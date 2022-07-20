ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

ENV DD_HOME=/opt/datadog-agent \
    # prevent the agent from being started after install
    DD_START_AGENT=0 \
    DD_SKIP_INTEGRATIONS=1

RUN apk add -qU --no-cache coreutils curl curl-dev python2-dev tar sysstat tini
ADD https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/setup_agent.sh /tmp/setup_agent.sh
RUN apk add -qU --no-cache -t .build-deps gcc musl-dev postgresql-dev linux-headers libffi-dev \
    # Install the agent
    && sh /tmp/setup_agent.sh \
    # Clean build dependencies
    && apk del -q .build-deps \
    && rm /tmp/setup_agent.sh

# RUN cp ${DD_ETC_ROOT}/datadog.conf.example ${DD_ETC_ROOT}/datadog.conf

EXPOSE 8125/udp

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Wouter de Bie <wouter@evenflow.nl>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Wouter de Bie <wouter@evenflow.nl>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

