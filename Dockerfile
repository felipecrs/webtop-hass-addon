# https://github.com/linuxserver/docker-webtop/releases?q=debian-xfce-
FROM ghcr.io/linuxserver/webtop:debian-xfce-2c1a07f1-ls169

COPY rootfs/ /

RUN ["/opt/webtop-hass-addon/run_custom_build_script.sh"]

ENTRYPOINT ["/opt/webtop-hass-addon/entrypoint.sh"]

HEALTHCHECK --interval=30s --timeout=5s --retries=3 --start-period=15s --start-interval=5s \
  CMD curl -fsS -k -o /dev/null -I https://127.0.0.1:3001 || exit 1
