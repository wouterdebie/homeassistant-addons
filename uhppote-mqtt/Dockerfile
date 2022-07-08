ARG BUILD_FROM
FROM rust:1.62.0-slim as builder
RUN apk add git
RUN git clone https://github.com/wouterdebie/uhppote-mqtt.git /src

WORKDIR /src
RUN cargo build --release


FROM $BUILD_FROM
# WORKDIR /
# RUN apk add -qU --no-cache coreutils curl git go musl-dev gcc clang
# RUN bash
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# RUN source $HOME/.cargo/env
# ENV PATH="$HOME/.cargo/bin:$PATH"
# RUN echo ${PATH}

# RUN ls -al $HOME/.cargo/bin
# RUN rustup target add armv7-unknown-linux-musleabihf


COPY --from=builder /src/target/release/uhppote-mqtt /

CMD [ "/uhppote-mqtt", "-c", "/data/options.json" ]
