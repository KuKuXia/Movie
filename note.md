location ~ \.mov$ {
            mov;
            limit_conn addr 4;
            limit_rate 1024k;
            rewrite ^/static/uploads/(.+?).mov$ /Movie_Server/app/static/uploads/$1.mov permanent;
        }
