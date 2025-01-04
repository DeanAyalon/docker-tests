FROM gcc AS build 
COPY hello.c /
RUN gcc -o hello hello.c
# ENTRYPOINT [ "/hello" ]

# Why does this not work?
# FROM scratch
# COPY --from=build /hello /hello
# ENTRYPOINT [ "/hello" ]