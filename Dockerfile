FROM alpine:3.3
MAINTAINER Alex Thorpe <alexander.thorpe@cambiahealth.com>

# grab su-exec for easy step-down from root
RUN apk add --no-cache 'su-exec>=0.2'
