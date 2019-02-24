FROM asciidoctor/docker-asciidoctor

WORKDIR /opt/src/site

COPY . .

RUN make

EXPOSE 8080

CMD ["make", "serve"]