FROM gcc AS build 
COPY idle.c /
RUN gcc -static -o idle idle.c

FROM scratch
COPY --from=build /idle /
ENTRYPOINT [ "/idle" ]