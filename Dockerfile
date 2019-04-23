
FROM gcc:4.9.4
COPY . /usr/src/linpack
WORKDIR /usr/src/linpack
RUN gcc -o linpack linpack.c
ENTRYPOINT ["./linpack"]
