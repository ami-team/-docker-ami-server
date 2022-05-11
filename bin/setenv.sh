########################################################################################################################

if [ -z "${BASE_URL}" ] || [ -z "${ADMIN_USER}" ] || [ -z "${ADMIN_PASS}" ] || [ -z "${ADMIN_EMAIL}" ] || [ -z "${ENCRYPTION_KEY}" ] || [ -z "${AUTHORIZED_IPS}" ] || [ -z "${ROUTER_CATALOG}" ] || [ -z "${ROUTER_SCHEMA}" ] || [ -z "${ROUTER_URL}" ] || [ -z "${ROUTER_USER}" ] || [ -z "${ROUTER_PASS}" ] || [ -z "${TIME_ZONE}" ]
then
  echo 'Please specify environment variables: BASE_URL, ADMIN_USER, ADMIN_PASS, ADMIN_EMAIL, ENCRYPTION_KEY, AUTHORIZED_IPS, ROUTER_CATALOG, ROUTER_SCHEMA, ROUTER_URL, ROUTER_USER, ROUTER_PASS, TIME_ZONE'

  exit 1
fi

########################################################################################################################

JAVA_OPTS='-server -Djava.awt.headless=true'

########################################################################################################################

CATALINA_OPTS="\
-Xms${JAVA_MS} \
-Xmx${JAVA_MX} \
-Xss${JAVA_SS} \
\
-Dtomcat.http_timeout='${HTTP_TIMEOUT}' \
-Dtomcat.http_max_threads='${HTTP_MAX_THREADS}' \
-Dtomcat.http_packet_size='${HTTP_PACKET_SIZE}' \
\
-Dtomcat.ajp_address='${AJP_ADDRESS}' \
-Dtomcat.ajp_secret='${AJP_SECRET}' \
\
-Dtomcat.ajp_timeout='${AJP_TIMEOUT}' \
-Dtomcat.ajp_max_threads='${AJP_MAX_THREADS}' \
-Dtomcat.ajp_packet_size='${AJP_PACKET_SIZE}' \
-Dtomcat.jvm_route='${JVM_ROUTE}' \
\
-Dami.base_url='${BASE_URL}' \
\
-Dami.admin_user='${ADMIN_USER}' \
-Dami.admin_pass='${ADMIN_PASS}' \
-Dami.admin_email='${ADMIN_EMAIL}' \
\
-Dami.encryption_key='${ENCRYPTION_KEY}' \
-Dami.authorized_ips='${AUTHORIZED_IPS}' \
\
-Dami.router_catalog='${ROUTER_CATALOG}' \
-Dami.router_schema='${ROUTER_SCHEMA}' \
-Dami.router_url='${ROUTER_URL}' \
-Dami.router_user='${ROUTER_USER}' \
-Dami.router_pass='${ROUTER_PASS}' \
\
-Dami.time_zone='${TIME_ZONE}' \
\
Dami.class_path='${CLASS_PATH}' \
\
-Djava.security.egd=file:/dev/./urandom"

########################################################################################################################
