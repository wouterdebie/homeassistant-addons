ARG BUILD_FROM
FROM $BUILD_FROM
WORKDIR /
RUN apk add -qU --no-cache coreutils curl git go musl-dev gcc clang bash
RUN bash
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN source $HOME/.cargo/env
ENV PATH="$HOME/.cargo/bin:$PATH"
RUN echo ${PATH}

RUN ls -al $HOME/.cargo/bin
# RUN rustup target add armv7-unknown-linux-musleabihf

RUN git clone https://github.com/wouterdebie/uhppote-mqtt.git /src

WORKDIR /src
RUN /.cargo/bin/cargo build --release
RUN cp target/release/uhppote-mqtt /
WORKDIR /
RUN rm -rf /src

CMD [ "/uhppote-mqtt", "-c", "/data/options.json" ]
