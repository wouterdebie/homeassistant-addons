# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf \
    "https://github.com/wouterdebie/uhppote-mqtt/releases/download/v${TEMPIO_VERSION}/uhppote-mqtt-nightly-${BUILD_ARCH}.tar.gz"

RUN echo ${BUILD_ARCH}
RUN echo ${TEMPIO_VERSION}
RUN tar zxvf uhppote-mqtt-nightly-${BUILD_ARCH}.tar.gz
# Copy root filesystem
COPY uhppote-mqtt /usr/bin
CMD [ "/usr/bin/uhppote-mqtt", "-c", "/data/options.json" ]
