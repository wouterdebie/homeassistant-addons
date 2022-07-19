# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH UHPPOTE_VERSION

RUN \
    curl -sSLf \
    "https://github.com/wouterdebie/uhppote-mqtt/releases/download/${UHPPOTE_VERSION}/uhppote-mqtt-nightly-${BUILD_ARCH}.tar.gz" | tar zxv -C /usr/bin

RUN chmod +x /usr/bin/uhppote-mqtt

CMD [ "/usr/bin/uhppote-mqtt", "-c", "/data/options.json" ]
