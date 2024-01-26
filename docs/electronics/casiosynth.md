https://www.arduino.cc/reference/en/libraries/mcp23017-port-expander/

https://forum.arduino.cc/t/keypad-library-with-multiplexer/850685

https://github.com/Meebleeps/MeeBleeps-Mutant-Synth/blob/master/src/MutantMozziSynth.ino

casio to arduino keymatrix
https://forum.arduino.cc/t/old-cassio-61key-piano-with-arduino-mega-matrix/687733



WITH chk AS ( SELECT uuid, date_created, page_url deviation_purchase_url, CAST( regexp_extract(page_url, '(?<=id=)\d+', 0) AS bigint) subproductid FROM ievents.dbo.users_82 AS u WHERE u.date_created BETWEEN timestamp(from_unixtime({current_execution_ts}/1000)) - interval '25' hour AND timestamp(from_unixtime({current_execution_ts}/1000)) - interval '1' hour AND u.evid = 99 AND u.view = 'shop' AND u.component = 'checkout' GROUP BY 1, 2, 3 ), chk_t AS ( SELECT c.uuid, c.date_created, c.deviation_purchase_url, c.subproductid, p.deviationid FROM chk AS c JOIN iprod.deviantart_prod.deviations_products_price AS p ON p.subproductid = c.subproductid and merchantid = 14 ), click_to_chk_fin AS ( SELECT c.uuid AS buyer_uuid, b.userid, b.username AS buyer_username, max_by(s.username, c.date_created) seller_username, max_by(c.deviationid, c.date_created) deviation_id, max_by(c.deviation_purchase_url, c.date_created) deviation_purchase_url, max_by(c.subproductid, c.date_created) subproductid, max_by( case WHEN d.is_mature = 1 THEN 'true' ELSE 'false' end, c.date_created ) is_mature, max_by(d.title, c.date_created) title FROM chk_t AS c JOIN iprod.deviantart_prod.main_deviations AS d ON d.deviationid = c.deviationid JOIN iprod.deviantart_prod.users AS s ON s.userid = d.userid JOIN iprod.deviantart_prod.users AS b ON b.uuid = c.uuid WHERE deviation_purchase_url NOT LIKE '%&%' GROUP BY 1, 2, 3 ), success_purch AS ( SELECT u.uuid, page_url deviation_purchase_url, CAST(subproductid AS bigint) subproductid FROM ievents.dbo.users_82 AS u WHERE u.date_created BETWEEN timestamp(from_unixtime({current_execution_ts}/1000)) - interval '25' hour AND timestamp(from_unixtime({current_execution_ts}/1000)) - interval '1' hour AND u.evid = 520 AND is_form_valid GROUP BY 1, 2, 3 ) SELECT f.userid, da_image_url_by_id(f.deviation_id) deviation_image_url, concat_ws('/','https://deviantart.com',f.seller_username,'subscriptions' ) deviation_url, f.deviation_purchase_url,f.deviation_id, f.is_mature, f.seller_username, f.buyer_username username FROM click_to_chk_fin AS f LEFT JOIN success_purch AS p ON p.uuid = f.buyer_uuid AND p.subproductid = f.subproductid WHERE p.subproductid IS NULL AND da_image_url_by_id(f.deviation_id) IS NOT NULL



BETWEEN timestamp(from_unixtime({current_execution_ts}/1000)) - interval '25' hour  AND timestamp(from_unixtime({current_execution_ts}/1000)) - interval '1' hour
