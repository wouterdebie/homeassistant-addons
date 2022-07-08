ARG BUILD_FROM
FROM $BUILD_FROM
WORKDIR /
RUN apk add -qU --no-cache coreutils curl git go musl-dev

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH

RUN git clone https://github.com/wouterdebie/uhppote-mqtt.git src

WORKDIR /src
RUN cargo build --release
RUN cp target/release/uhppote-mqtt /
WORKDIR /
RUN rm -rf /uhppote-mqtt

CMD [ "/uhppote-mqtt", "-c", "/data/options.json" ]
