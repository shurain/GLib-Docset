#!/usr/bin/env python

import sqlite3
import sys

def load_data():
    with open('tmp.api', 'r') as f:
        api_data = []
        for line in f:
            api_data.append(line.split())

    with open('tmp.module', 'r') as f:
        module_data = []
        for line in f:
            module_data.append(line.split())

    return api_data, module_data


if __name__ == '__main__':
    api, module = load_data()
    conn = sqlite3.connect('docSet.dsidx')
    c = conn.cursor()
    try:
        c.execute("CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT)")
    except sqlite3.OperationalError as e:
        print e
        print 'File docSet.dsidx already exists'
        sys.exit(1)

    entries = []

    for i, d in enumerate(api):
        entries.append((i+1, d[1], d[2], d[0]))

    count = len(entries)
    for i, d in enumerate(module):
        url = d[0]
        name = ' '.join(d[1:])
        entries.append((count + i + 1, name, 'cat', url))

    c.executemany("INSERT INTO searchIndex VALUES (?, ?, ?, ?)", entries)
    conn.commit()
