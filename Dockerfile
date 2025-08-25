# https://github.com/linuxserver/docker-webtop/pkgs/container/webtop/versions?filters%5Bversion_type%5D=tagged
FROM ghcr.io/linuxserver/webtop:debian-xfce-version-2e2e878a

COPY rootfs/ /

RUN ["/opt/webtop-hass-addon/run_custom_build_script.sh"]

ENTRYPOINT ["/opt/webtop-hass-addon/entrypoint.sh"]

HEALTHCHECK --interval=30s --timeout=5s --retries=3 --start-period=15s --start-interval=5s \
  CMD curl -fsS -k -o /dev/null -I https://127.0.0.1:3001 || exit 1
