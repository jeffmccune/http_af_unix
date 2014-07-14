# HTTPAFUnix

`HTTPAFUnix::WebApp` is a simple sinatra application intended to run inside of
a web server listening on a unix domain socket rather than a TCP socket.  The
purpose is to provide something simple and light to develop HTTP client
libraries with.

## Installation

```bash
bundle install --path .bundle/gems/
```

## Usage

Start the server:

```bash
bundle exec unicorn -c config/unicorn.rb
```

Issue a request to the server using `socat`

```bash
echo -e "GET http://127.0.0.1/ HTTP/1.1\r\nHost: 127.0.0.1\r\n\r\n\r\n" \
  | socat - UNIX-CONNECT:$(pwd)/tmp/sockets/unicorn.sock
```

The socket can be changed using an environment variable

```bash
UNICORN_SOCKET=/tmp/unicorn.sock bundle exec unicorn -c config/unicorn.rb
```

This should result in something like the following response:

    HTTP/1.1 200 OK
    Date: Mon, 14 Jul 2014 17:55:29 GMT
    Status: 200 OK
    Connection: close
    Content-Type: text/html;charset=utf-8
    Content-Length: 26
    X-XSS-Protection: 1; mode=block
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN

    Hello, nginx and unicorn!
