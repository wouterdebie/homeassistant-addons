ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add -qU --no-cache coreutils curl git

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN git clone https//github.com/wouterdebie/uhppote-mqtt.git

WORKDIR /uhppote-mqtt
RUN cargo build --release
RUN cp target/release/uhppote-mqtt /
WORKDIR /
RUN rm -rf /uhppote-mqtt

CMD [ "/uhppote-mqtt", "-c", "/data/options.json" ]
