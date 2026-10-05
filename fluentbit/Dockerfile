FROM fluent/fluent-bit:5.1.3

# NOTE(krishan711): the fluent-bit image has no shell, so add a static busybox for entrypoint.sh to pick the outputs
COPY --from=busybox:1.38.0-musl /bin/busybox /bin/busybox
RUN ["/bin/busybox", "--install", "-s", "/bin"]

COPY *.yaml /fluent-bit/etc/
COPY *.lua /fluent-bit/etc/
COPY outputs /fluent-bit/etc/outputs
COPY entrypoint.sh /fluent-bit/entrypoint.sh

ENTRYPOINT ["/fluent-bit/entrypoint.sh"]
