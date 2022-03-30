[oracle@demo ~]$ du -s /app/oracle/biee/user_projects/domains/bi/servers/*/tmp
417764	/app/oracle/biee/user_projects/domains/bi/servers/AdminServer/tmp
2061740	/app/oracle/biee/user_projects/domains/bi/servers/bi_server1/tmp
8	/app/oracle/biee/user_projects/domains/bi/servers/obiccs1/tmp
277484	/app/oracle/biee/user_projects/domains/bi/servers/obips1/tmp
636	/app/oracle/biee/user_projects/domains/bi/servers/obis1/tmp
12	/app/oracle/biee/user_projects/domains/bi/servers/obisch1/tmp

while [ 1 -eq 1 ]; do
        du -s /app/oracle/biee/user_projects/domains/bi/servers/*/tmp| \
        sed 's/\/app\/oracle\/biee\/user_projects\/domains\/bi\/servers\///g'| \
        sed 's/\/tmp//g'| \
        awk '{print "DiskTemp,component="$2" value="$1}'| \
        curl -i -XPOST 'http://localhost:8086/write?db=obi' --data-binary @-
        sleep 10
done
