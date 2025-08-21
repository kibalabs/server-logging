function append_tag(tag, timestamp, record)
    newRecord = record
    newRecord["tag"] = tag
    return 2, timestamp, newRecord
end

function extract_container_id(tag, timestamp, record)
    newRecord = record
    if record["containerLogPath"] then
        local path = record["containerLogPath"]
        local container_id = string.match(path, "/var/lib/docker/containers/([^/]+)/")
        if container_id then
            newRecord["containerId"] = container_id
        end
        newRecord["container_log_path"] = nil
    end
    return 2, timestamp, newRecord
end
