#!/bin/bash
#
NULL="/dev/null"
#
REDIS="/usr/bin/redis-server"
REDIS_OPT="/etc/redis.conf"
REDIS_PID=""
#
OPENVAS="/usr/bin/openvassd"
OPENVAS_OPT="-f"
OPENVAS_PID=""
#
GVMD="/usr/bin/gvmd"
GVMD_OPT="-f"
GVMD_PID=""
GVMD_PASS="admin"
#
GSAD="/usr/bin/gsad"
GSAD_OPT="--port 9392"
GSAD_PID=""
#
#
echo -e "Init certs:"
gvm-manage-certs -a
#
#
echo -e "Create Admin:"
gvmd --create-user=admin --role=Admin
gvmd --user=admin --new-password="${GVMD_PASS}"
#
#
echo -e "Start services:"
${REDIS} ${REDIS_OPT} > ${NULL} &
REDIS_PID=${$}
[[ ${?} -eq 0 ]] && echo -e "${REDIS} is OK: ${REDIS_PID}"
#
${OPENVAS} ${OPENVAS_OPT} > ${NULL} &
OPENVAS_PID=${$}
[[ ${?} -eq 0 ]] && echo -e "${OPENVAS} is OK: ${OPENVAS_PID}"
#
${GVMD} ${GVMD_OPT} > ${NULL} &
GVMD_PID=${$}
[[ ${?} -eq 0 ]] && echo -e "${GVMD} is OK: ${GVMD_PID}"
#
${GSAD} ${GSAD_OPT} > ${NULL} &
GSAD_PID=${$}
[[ ${?} -eq 0 ]] && echo -e "${GSAD} is OK: ${GSAD_PID}"
#
#
echo -e "\nExecute:\ngreenbone-nvt-sync\ngreenbone-scapdata-sync\ngreenbone-certdata-sync\n"
while true; do sleep 1m; done

