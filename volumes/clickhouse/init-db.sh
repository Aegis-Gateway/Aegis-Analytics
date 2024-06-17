#!/bin/bash
set -e

clickhouse client -n <<-EOSQL
    CREATE TABLE IF NOT EXISTS proxy_analytics (
      id UUID NOT NULL DEFAULT generateUUIDv4(),
      response_time Float32 NOT NULL,
      origin String NOT NULL,
      sha256hash String DEFAULT '',
      project String NOT NULL,
      endpoint String NOT NULL,
      time DateTime64 NOT NULL,
      path String NOT NULL,
      user_agent String NOT NULL,
      status_code UInt16 NOT NULL,
      ip String NOT NULL,
      message String DEFAULT ''
    ) ORDER BY time;
EOSQL