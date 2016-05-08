import sys

dt = dict()

for line in sys.stdin:
    k = line.rstrip()
    if k not in dt:
        dt[k] = 0
    dt[k] += 1


for k in dt.keys():
    sys.stdout.write('{}\t:=>:\t{}\n'.format(k, dt[k]))
