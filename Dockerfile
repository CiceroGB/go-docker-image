# Building
FROM golang:alpine AS build

WORKDIR /src
COPY /src/main.go  .
RUN CGO_ENABLED=0 go build -ldflags '-w -s' -a -installsuffix cgo -o myapp main.go


FROM scratch
COPY --from=build /src/myapp /myapp
CMD ["/myapp"]
