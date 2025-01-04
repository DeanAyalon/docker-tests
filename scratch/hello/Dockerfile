FROM gcc AS build 
COPY hello.c /
RUN gcc -static -o hello hello.c

FROM scratch
COPY --from=build /hello /
ENTRYPOINT [ "/hello" ]