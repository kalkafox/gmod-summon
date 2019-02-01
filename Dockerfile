FROM kalka/steamcmd:latest
LABEL maintainer="Kalka <k@kalka.io>"


ENV port=27015

ENV LD_LIBRARY_PATH=/opt/garrysmod/bin

USER root
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh && \
    chown steam:steam /docker-entrypoint.sh && \
    chown -R steam:steam /opt

USER steam

RUN mkdir -p /opt/garrysmod

RUN /usr/games/steamcmd +login anonymous +force_install_dir /opt/garrysmod +app_update 4020 validate +quit

EXPOSE ${port}/udp

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["+gamemode", "sandbox", "+map", "gm_flatgrass"]
