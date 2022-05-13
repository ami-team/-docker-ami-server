[![][Build Status img]][Build Status]
[![][License img]][License]

<a href="http://lpsc.in2p3.fr/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_lpsc.png" alt="LPSC" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://www.in2p3.fr/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_in2p3.png" alt="IN2P3" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://www.univ-grenoble-alpes.fr/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_uga.png" alt="UGA" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://home.cern/" target="_blank">
	<img src="http://www.cern.ch/ami/images/logo_atlas.png" alt="CERN" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://atlas.cern/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_cern.png" alt="CERN" height="72" />
</a>

AMIServer Docker Image
======================

Blablablabla. It was originally developed for the A Toroidal LHC ApparatuS (ATLAS) experiment, one of the two general-purpose detectors at the Large Hadron Collider (LHC).

This is the official Docker image.

Environment variables
=====================

Java:
* `JAVA_MS`<sup>opt, default: 2G</opt>
* `JAVA_MX`<sup>opt, default: 4G</opt>
* `JAVA_SS`<sup>opt, default: 20m</opt>

HTTP:
* `HTTP_TIMEOUT`<sup>opt, default: 20000</opt>
* `HTTP_MAX_THREADS`<sup>opt, default: 200</opt>
* `HTTP_PACKET_SIZE`<sup>opt, default: 8192</opt>

AJP:
* `AJP_ADDRESS`
* `AJP_SECRET`

* `AJP_TIMEOUT`<sup>opt, default: 20000</opt>
* `AJP_MAX_THREADS`<sup>opt, default: 200</opt>
* `AJP_PACKET_SIZE`<sup>opt, default: 8192</opt>

JVM route:
* `JVM_ROUTE`

AMI:
* `BASE_URL`

Admin user:
* `ADMIN_USER`
* `ADMIN_PASS`
* `ADMIN_EMAIL`

Security:
* `ENCRYPTION_KEY`
* `AUTHORIZED_IPS`<sup>opt, default: <i>empty</i></opt>

Config. DB:
* `ROUTER_CATALOG`
* `ROUTER_SCHEMA`<sup>opt, default: <i>@NULL</i></opt>
* `ROUTER_URL`
* `ROUTER_USER`
* `ROUTER_PASS`

Time zone:
* `TIME_ZONE`<sup>opt, default: UTC</opt>

Class path:
* `CLASS_PATH`<sup>opt, default: /AMI/cmds/</opt>

Volume
======

Configuration is there: `/AMI/config/`.

Developers
==========

* [Jérôme ODIER](https://annuaire.in2p3.fr/4121-4467/jerome-odier) ([CNRS/LPSC](http://lpsc.in2p3.fr/))

[Build Status]:https://github.com/ami-team/docker-ami-server/actions/workflows/docker-image.yml
[Build Status img]:https://github.com/ami-team/docker-ami-server/actions/workflows/docker-image.yml/badge.svg?branch=master

[License]:http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.txt
[License img]:https://img.shields.io/badge/license-CeCILL-blue.svg
