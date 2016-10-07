FROM golang:alpine

RUN apk add --no-cache git

RUN go get github.com/mailhog/MailHog

EXPOSE 1025 8025

ENTRYPOINT ["/go/bin/MailHog"]