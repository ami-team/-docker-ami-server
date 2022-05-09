########################################################################################################################

if [ -z "${BASE_URL}" ] || [ -z "${ADMIN_USER}" ] || [ -z "${ADMIN_PASS}" ] || [ -z "${ADMIN_EMAIL}" ] || [ -z "${ENCRYPTION_KEY}" ] || [ -z "${AUTHORIZED_IPS}" ] || [ -z "${ROUTER_CATALOG}" ] || [ -z "${ROUTER_SCHEMA}" ] || [ -z "${ROUTER_URL}" ] || [ -z "${ROUTER_USER}" ] || [ -z "${ROUTER_PASS}" ] || [ -z "${TIME_ZONE}" ]
then
  echo 'Please specify environment variables: BASE_URL, ADMIN_USER, ADMIN_PASS, ADMIN_EMAIL, ENCRYPTION_KEY, AUTHORIZED_IPS, ROUTER_CATALOG, ROUTER_SCHEMA, ROUTER_URL, ROUTER_USER, ROUTER_PASS, TIME_ZONE'

  exit 1
fi

########################################################################################################################

cat > /AMI/conf/AMI.xml << EOF
<?xml version="1.0" encoding="ISO-8859-1"?>

<properties>
  <property name="base_url"><![CDATA[${BASE_URL}]]></property>

  <property name="admin_user"><![CDATA[${ADMIN_USER}]]></property>
  <property name="admin_pass"><![CDATA[${ADMIN_PASS}]]></property>
  <property name="admin_email"><![CDATA[${ADMIN_EMAIL}]]></property>

  <property name="encryption_key"><![CDATA[${ENCRYPTION_KEY}]]></property>
  <property name="authorized_ips"><![CDATA[${AUTHORIZED_IPS}]]></property>

  <property name="router_catalog"><![CDATA[${ROUTER_CATALOG}]]></property>
  <property name="router_schema"><![CDATA[${ROUTER_SCHEMA}]]></property>
  <property name="router_url"><![CDATA[${ROUTER_URL}]]></property>
  <property name="router_user"><![CDATA[${ROUTER_USER}]]></property>
  <property name="router_pass"><![CDATA[${ROUTER_PASS}]]></property>

  <property name="time_zone"><![CDATA[${TIME_ZONE}]]></property>

  <property name="class_path"><![CDATA[${CLASS_PATH}]]></property>
</properties>
EOF

########################################################################################################################

JAVA_OPTS="-Dtomcat.http_timeout=${HTTP_TIMEOUT} -Dtomcat.http_max_threads=${HTTP_MAX_THREADS} -Dtomcat.http_packet_size=${HTTP_PACKET_SIZE} -Dtomcat.ajp_address=${AJP_ADDRESS} -Dtomcat.ajp_secret=${AJP_SECRET} -Dtomcat.ajp_timeout=${AJP_TIMEOUT} -Dtomcat.ajp_max_threads=${AJP_MAX_THREADS} -Dtomcat.ajp_packet_size=${AJP_PACKET_SIZE} -Dtomcat.jvm_route=${JVM_ROUTE} -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"

########################################################################################################################

CATALINA_OPTS="-Xms${JAVA_MS} -Xmx${JAVA_MX} -Xss${JAVA_SS} -server -XX:+UseParallelGC"

########################################################################################################################
