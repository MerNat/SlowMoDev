FROM alpine:latest
RUN apk add --update bash libc6-compat gcc libc-dev make && rm -rf /var/cache/apk/*


WORKDIR /slowmo

EXPOSE 9090

COPY slowmo .

RUN chmod +x slowmo

ENTRYPOINT [ "./slowmo" ]