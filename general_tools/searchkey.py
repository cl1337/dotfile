import sys
import json
import argparse


parser = argparse.ArgumentParser()
parser.add_argument('-k', '--key')
parser.add_argument(
    '-d', '--dotty', help="give absulote search path, like: msg.response_text.messageText",
    action='store_true',
)
args = parser.parse_args()


def fuzz_search(dt, key):
    if not dt:
        return None

    if isinstance(dt, basestring):
        try:
            dt = json.loads(dt)
        except Exception:
            return None

    if not isinstance(dt, dict):
        return None

    for k in dt.keys():
        if k == key:
            return dt[key]
        next_level = fuzz_search(dt[k], key)
        if next_level:
            return next_level

    return None


def dotty_search(dt, key):
    keys = key.split('.')
    while dt and keys:
        if isinstance(dt, basestring):
            try:
                dt = json.loads(dt)
            except Exception:
                return None
        dt = dt.get(keys.pop(0), {})
    return dt


for line in sys.stdin:
    val = dotty_search(line, args.key)
    val = dotty_search(line, args.key) if args.dotty else fuzz_search(line, args.key)
    if val:
        sys.stdout.write('{}\n'.format(val))
