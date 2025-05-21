


Ngnix.log
/*
172.17.0.1 - - [06/Aug/2024:14:55:37 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.2 - - [06/Aug/2024:14:55:38 +0000] "GET /favicon.ico HTTP/1.1" 200 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.2 - - [06/Aug/2024:14:55:39 +0000] "GET /favicon.ico HTTP/1.1" 201 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.2 - - [06/Aug/2024:14:55:40 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.3 - - [06/Aug/2024:14:55:41 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.2 - - [06/Aug/2024:14:55:42 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.1 - - [06/Aug/2024:14:55:43 +0000] "GET /favicon.ico HTTP/1.1" 200 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.2 - - [06/Aug/2024:14:55:44 +0000] "GET /favicon.ico HTTP/1.1" 200 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.1 - - [06/Aug/2024:14:55:45 +0000] "GET /favicon.ico HTTP/1.1" 200 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.3 - - [06/Aug/2024:14:55:46 +0000] "GET /favicon.ico HTTP/1.1" 200 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-"
172.17.0.1 - - [06/Aug/2024:14:55:47 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" "-" */

#Execution


#find ip count based on response
response="$1"
source="$2"

awk -v res="$response" '$9 == res {print $1}' "$source" | sort | uniq -c | sort -nr


