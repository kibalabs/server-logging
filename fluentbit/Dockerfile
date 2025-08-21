FROM fluent/fluent-bit:4.0.8

COPY *.yaml /fluent-bit/etc/
COPY *.lua /fluent-bit/etc/

CMD ["/fluent-bit/bin/fluent-bit", "--config=/fluent-bit/etc/fluent-bit.yaml"]
