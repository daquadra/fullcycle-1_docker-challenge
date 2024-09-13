FROM golang:1.20-alpine as goBuilder

WORKDIR /app

COPY main.go .

RUN go mod init hello-fullcycle

RUN go build -o fullCycle .

FROM scratch

COPY --from=goBuilder /app/fullCycle /fullCycle

ENTRYPOINT [ "/fullCycle" ]
