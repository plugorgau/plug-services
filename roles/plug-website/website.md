We're trying to get ugmm running as a subdir of main www

`
        location /ugmm {
                alias /usr/share/plug-ugmm/www;
                autoindex off;
                try_files $uri $uri/ $uri.php;

                location ~ \.php$ {
                        include snippets/fastcgi-php.conf;
                        fastcgi_param SCRIPT_FILENAME $request_filename;
                        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
                }
        }

        location @nested {
                rewrite /ugmm/(.*)$ /ugmm/index.php?/$1 last;
        }
`
