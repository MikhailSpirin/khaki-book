WITH ranked_events AS (
  SELECT
    CASE
      WHEN op = 'd' THEN before.deviationid
      ELSE after.deviationid
    END AS deviationid,
    cdc_raw.after.catid,
    cdc_raw.after.userid,
    cdc_raw.after.printid,
    cdc_raw.after.privid,
    cdc_raw.after.title,
    cdc_raw.after.filepreview,
    cdc_raw.after.filename,
    cdc_raw.after.ts,
    cdc_raw.after.created_ts,
    cdc_raw.after.modified_ts,
    cdc_raw.after.updated_ts,
    cdc_raw.after.previewsize,
    cdc_raw.after.filesize,
    cdc_raw.after.width,
    cdc_raw.after.height,
    cdc_raw.after.filewidth,
    cdc_raw.after.fileheight,
    cdc_raw.after.filetype,
    cdc_raw.after.attributes,
    cdc_raw.after.attributes2,
    cdc_raw.op,
    ROW_NUMBER() OVER (
      PARTITION BY after.deviationid
      ORDER BY
        ts_ms DESC,
        CASE
          WHEN op = 'c' THEN 4
          WHEN op = 'r' THEN 3
          WHEN op = 'u' THEN 2
          ELSE 1
        END
    ) AS rn
  FROM
    prod.deviantart_cdc_prod.split01_devart_deviations AS cdc_raw
  WHERE
    ts_ms > 1707811200000
)
SELECT
  *
FROM
  ranked_events
WHERE
  rn = 1;
