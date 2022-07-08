ARG BUILD_FROM
FROM liuchong/rustup:stable-musl as builder
RUN apt-get update
RUN apt-get install git libc6-dev
RUN git clone https://github.com/wouterdebie/uhppote-mqtt.git /src
RUN rustup target add aarch64-unknown-linux-musl


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
