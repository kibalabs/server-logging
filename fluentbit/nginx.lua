function parse_json_date(json_date)
    local pattern = "(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d%.]+)([Z%+%-])(%d?%d?)%:?(%d?%d?)"
    local year, month, day, hour, minute,
        seconds, offsetsign, offsethour, offsetmin = json_date:match(pattern)
    local timestamp = os.time{year = year, month = month,
        day = day, hour = hour, min = minute, sec = seconds}
    local offset = 0
    if offsetsign ~= 'Z' then
      offset = tonumber(offsethour) * 60 + tonumber(offsetmin)
      if xoffset == "-" then offset = offset * -1 end
    end
    return timestamp + offset
end

function parse(tag, timestamp, record)
    newRecord = record
    newRecord["apiAction"] = record["request_method"]
    record["request_method"] = nil
    newRecord["apiPath"] = record["uri"]
    record["uri"] = nil
    newRecord["apiResponse"] = record["status"]
    record["status"] = nil
    newRecord["apiDuration"] = record["request_time"]
    record["request_time"] = nil
    newRecord["apiQuery"] = record["query_string"]
    record["query_string"] = nil
    newRecord["requestId"] = record["request_id"]
    record["request_id"] = nil
    timestamp = parse_json_date(newRecord["time_iso8601"])
    record["time_iso8601"] = nil
    return 1, timestamp, newRecord
end
