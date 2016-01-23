ad_server
=========

A small ad-server utilty for serving banners for diffrent campaigns and display them based on the campaign.
To do so, The program is calculating a eCPM based on the campaign initial bid price and type (CPM,CPC,CPA)
and uses it to priortize serving the banner with the highest eCPM.

Requirement
============

1. Python 2.7
2. MySQL server
2. MySQL Connector c 6.0.2 (for MySQLdb) - https://dev.mysql.com/downloads/file/?id=378015
3. Microsoft Visual C++ Compiler for Python 2.7 (for MySQLdb)- https://www.microsoft.com/en-us/download/confirmation.aspx?id=44266
4. MySQLdb - pip install mysql
5. Django Webserver - pip install Django==1.9.1

Installing
==========

1. Installing MySql server on localhost:8080 using U:root P:root
2. Importing the ad_db.sql (attached) to a new ad_db schema.
3. Making sure all requierments has been met.
4. running the script inside the root program directory (\ad_server\) : python manage.py runserver

Urls
====
Banners:			http://localhost:8000/<requested_banner_size>
Banners list: 		http://localhost:8000/banner/list
Campaign list: 		http://localhost:8000/campaign/list
Campaign Banners: 	http://localhost:8000/campaign_banner/list
Django Admin: 		http://localhost:8000/admin

Django Admin
============
To use django admin run the script: python manage.py createsuperuser
