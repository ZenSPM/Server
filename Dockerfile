FROM iantorres/instance:latest

COPY src /src

ENV sentry_DIR /vcpkg/packages/sentry-native_x64-linux/share/sentry

EXPOSE 8080

WORKDIR /src

RUN cmake -S . -B . -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=/vcpkg/scripts/buildsystems/vcpkg.cmake -D SENTRY_BACKEND=breakpad && \
    cmake --install . --strip && \
    cmake --build . --config Release

ENTRYPOINT ["./Server"]