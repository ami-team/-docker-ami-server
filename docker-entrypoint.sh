#!/bin/bash

########################################################################################################################

if [ ! -f /AMI/conf/server.xml ]
then
  AMI_RESTART=0 /AMI/bin/ami_setup.sh
fi

########################################################################################################################

cat > /AMI/bin/setenv.sh << EOF
########################################################################################################################

JAVA_OPTS='-server -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

########################################################################################################################

CATALINA_OPTS="\\
-Xms\${JAVA_MS} \\
-Xmx\${JAVA_MX} \\
-Xss\${JAVA_SS} \\
\\
-Dtomcat.http_timeout='\${HTTP_TIMEOUT}' \\
-Dtomcat.http_max_threads='\${HTTP_MAX_THREADS}' \\
-Dtomcat.http_packet_size='\${HTTP_PACKET_SIZE}' \\
\\
-Dtomcat.ajp_address='\${AJP_ADDRESS}' \\
-Dtomcat.ajp_secret='\${AJP_SECRET}' \\
\\
-Dtomcat.ajp_timeout='\${AJP_TIMEOUT}' \\
-Dtomcat.ajp_max_threads='\${AJP_MAX_THREADS}' \\
-Dtomcat.ajp_packet_size='\${AJP_PACKET_SIZE}' \\
-Dtomcat.jvm_route='\${JVM_ROUTE}' \\
\\
-Dami.base_url='\${BASE_URL}' \\
\\
-Dami.admin_user='\${ADMIN_USER}' \\
-Dami.admin_pass='\${ADMIN_PASS}' \\
-Dami.admin_email='\${ADMIN_EMAIL}' \\
\\
-Dami.encryption_key='\${ENCRYPTION_KEY}' \\
-Dami.authorized_ips='\${AUTHORIZED_IPS}' \\
\\
-Dami.router_catalog='\${ROUTER_CATALOG}' \\
-Dami.router_schema='\${ROUTER_SCHEMA}' \\
-Dami.router_url='\${ROUTER_URL}' \\
-Dami.router_user='\${ROUTER_USER}' \\
-Dami.router_pass='\${ROUTER_PASS}' \\
\\
-Dami.time_zone='\${TIME_ZONE}' \\
\\
-Dami.class_path='\${CLASS_PATH}'"

########################################################################################################################
EOF

########################################################################################################################

cat > /AMI/conf/AMI.xml << EOF
<?xml version="1.0" encoding="ISO-8859-1"?>

<properties>
    <property name="base_url"><![CDATA[\${ami.base_url}]]></property>

    <property name="admin_user"><![CDATA[\${ami.admin_user}]]></property>
    <property name="admin_pass"><![CDATA[\${ami.admin_pass}]]></property>
    <property name="admin_email"><![CDATA[\${ami.admin_email}]]></property>

    <property name="encryption_key"><![CDATA[\${ami.encryption_key}]]></property>
    <property name="authorized_ips"><![CDATA[\${ami.authorized_ips}]]></property>

    <property name="router_catalog"><![CDATA[\${ami.router_catalog}]]></property>
    <property name="router_schema"><![CDATA[\${ami.router_schema}]]></property>
    <property name="router_url"><![CDATA[\${ami.router_url}]]></property>
    <property name="router_user"><![CDATA[\${ami.router_user}]]></property>
    <property name="router_pass"><![CDATA[\${ami.router_pass}]]></property>

    <property name="time_zone"><![CDATA[\${ami.time_zone}]]></property>

    <property name="class_path"><![CDATA[\${ami.class_path}]]></property>
</properties>
EOF

########################################################################################################################

/AMI/bin/ami.sh run

########################################################################################################################
