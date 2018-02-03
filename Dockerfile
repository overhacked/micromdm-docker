FROM alpine:3.6
RUN apk --no-cache add --virtual build-deps curl unzip

ENV MICROMDM_VERSION=v1.2.0
RUN cd /tmp && \
    curl -OL https://github.com/micromdm/micromdm/releases/download/${MICROMDM_VERSION}/micromdm_${MICROMDM_VERSION}.zip && \
	unzip micromdm_${MICROMDM_VERSION}.zip && \
	mkdir /app && \
	mv build/linux/mdmctl build/linux/micromdm /app && \
    chmod a+x /app/micromdm /app/mdmctl && \
	rm -rf /tmp/build /tmp/micromdm_${MICROMDM_VERSION}.zip

RUN apk --no-cache del build-deps

CMD ["/app/micromdm"]
