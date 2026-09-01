FROM fluent/fluent-bit:5.1.1

COPY *.yaml /fluent-bit/etc/
COPY *.lua /fluent-bit/etc/

CMD ["/fluent-bit/bin/fluent-bit", "--config=/fluent-bit/etc/fluent-bit.yaml"]
