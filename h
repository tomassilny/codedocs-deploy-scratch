RewriteEngine On

RewriteBase /
ErrorDocument 404 /404.php


RewriteCond %{HTTP_HOST} ^www\.(.*)$ [NC]
RewriteRule ^(.*)$ https://%1/$1 [R=301,L]
RewriteRule ^sitemap.xml/?$ sitemap.php [L]


RewriteCond %{ENV:HTTPS} !on
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]


RewriteRule ^([^\.]+)$ $1.php [NC,L]


  RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d

RewriteRule ^([^/]+)/([^/]+)$ course.php?course=$1&code=$2 [NC,QSA]

	