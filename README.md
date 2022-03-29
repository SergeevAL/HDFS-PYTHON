# HDFS-PYTHON
HDFS PYTHON

import os
stream = os.popen('du')
output = stream.readlines()
df = dict()
for i in output:
    df[i.split()[1]] = i.split()[0]
df
