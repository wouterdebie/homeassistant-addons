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
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="armhf|aarch64|i386|amd64"
