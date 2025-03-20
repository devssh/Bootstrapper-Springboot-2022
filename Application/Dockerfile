FROM alpine:3.17
WORKDIR /app
COPY requirements.txt /app/requirements.txt
COPY Application /app/Application
EXPOSE 8081
CMD ["/bin/sh /app/Application/run_prod.sh"]
