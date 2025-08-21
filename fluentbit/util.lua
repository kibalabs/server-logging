function append_tag(tag, timestamp, record)
    newRecord = record
    newRecord["tag"] = tag
    return 2, timestamp, newRecord
end

function extract_container_id(tag, timestamp, record)
    newRecord = record
    if record["containerLogPath"] then
        -- Extract container ID from path like /var/lib/docker/containers/abc123.../abc123...-json.log
        local path = record["containerLogPath"]
        local container_id = string.match(path, "/var/lib/docker/containers/([^/]+)/")
        if container_id then
            -- Keep the full container ID
            newRecord["containerId"] = container_id
        end
        -- Remove the path key as we don't need it anymore
        newRecord["container_log_path"] = nil
    end
    return 2, timestamp, newRecord
end
