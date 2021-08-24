#tag- resume-builder:latest
FROM debian:latest
RUN apt-get update
RUN apt install -y texlive-full make
WORKDIR /app
ENTRYPOINT []
