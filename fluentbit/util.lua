function append_tag(tag, timestamp, record)
    newRecord = record
    newRecord["tag"] = tag
    return 2, timestamp, newRecord
end
