#!/bin/sh
set -e

config=/fluent-bit/etc/fluent-bit.generated.yaml
cp /fluent-bit/etc/fluent-bit.yaml "$config"
echo "  outputs:" >> "$config"
if [ -n "$OPENSEARCH_URL" ]; then
    cat /fluent-bit/etc/outputs/opensearch.yaml >> "$config"
    echo "Sending logs to OpenSearch at $OPENSEARCH_URL"
fi
if [ -n "$VICTORIALOGS_HOST" ]; then
    cat /fluent-bit/etc/outputs/victorialogs.yaml >> "$config"
    echo "Sending logs to VictoriaLogs at $VICTORIALOGS_HOST"
fi
if [ -z "$OPENSEARCH_URL" ] && [ -z "$VICTORIALOGS_HOST" ]; then
    echo "Error: set OPENSEARCH_URL and/or VICTORIALOGS_HOST"
    exit 1
fi

exec /fluent-bit/bin/fluent-bit --config="$config"
