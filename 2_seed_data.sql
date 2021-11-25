INSERT INTO customers (uuid, "name", email, cnpj, customer_key, created_at, updated_at) values ('3c82af17-3ce2-43ac-b4b1-fb4b0fdd4a81', 'acme', 'admin@acme.com', '11111111000111', 'lalalaqlL2jHOCPUoPQ111', NOW()::timestamp, NOW()::timestamp);
INSERT INTO customers (uuid, "name", email, cnpj, customer_key, created_at, updated_at) values ('7d300aca-4966-461e-aa15-efe4d5a5d448', 'xpto', 'admin@xpto.com', '22222222000122', 'lalalaqlL2jHOCPUoPQ222', '2021-01-01 13:00:01', '2021-01-01 13:00:01');
INSERT INTO customers (uuid, "name", email, cnpj, customer_key, created_at, updated_at) values ('c7eae6f3-832d-4b3b-a5fe-2b7b9cf9a688', 'big bang', 'admin@bigbang.com', '33333333000133', 'lalalaQqlL2jHOCPUoPQ333', '2021-02-01 14:00:01', '2021-02-01 14:00:01');
INSERT INTO customers (uuid, "name", email, cnpj, customer_key, created_at, updated_at) values ('0c482f53-2fc5-40b3-8f27-29e9c347e270', 'company', 'admin@company.com', '44444444000144', 'lalalaQqlL2jHOCPUoPQ444', '2021-03-01 15:00:01', '2021-03-01 15:00:01');
INSERT INTO customers (uuid, "name", email, cnpj, customer_key, created_at, updated_at) values ('4e0eeb41-853a-48dd-8976-ffbca7e1fb98', 'corp', 'admin@corp.com', '55555555000155', 'lalalaQqlL2jHOCPUoPQ555', '2021-07-01 19:00:01', '2021-07-01 19:00:01');

INSERT INTO addresses (created_at, updated_at, nickname, uuid, active, zip_code, street_name, street_number, city_name, state_name, latitude, longitude, reference, neighborhood)
VALUES(NOW()::timestamp, NOW()::timestamp, 'Matriz', '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4111', true, '04521030', 'rua colibri', '10', 'São Paulo', 'SP', 0, 0, '', 'Indianópolis');
INSERT INTO addresses (created_at, updated_at, nickname, uuid, active, zip_code, street_name, street_number, city_name, state_name, latitude, longitude, reference, neighborhood)
VALUES('2021-01-01 13:00:01', '2021-01-01 13:00:01', 'Matriz', '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4222', true, '86030480', 'rua bem-te-vi', '110', 'Londrina', 'PR', 0, 0, '', 'Centro');
INSERT INTO addresses (created_at, updated_at, nickname, uuid, active, zip_code, street_name, street_number, city_name, state_name, latitude, longitude, reference, neighborhood)
VALUES('2021-02-01 14:00:01', '2021-02-01 14:00:01', 'Matriz', '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4333', true, '37418000', 'rua shangri-lá', '88', 'São Thomé das Letras', 'MG', 0, 0, '', 'Paraíso');
INSERT INTO addresses (created_at, updated_at, nickname, uuid, active, zip_code, street_name, street_number, city_name, state_name, latitude, longitude, reference, neighborhood)
VALUES('2021-03-01 15:00:01', '2021-03-01 15:00:01', 'Matriz', '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4444', true, '05433000', 'rua girassol', '1000', 'São Paulo', 'SP', 0, 0, '', 'Vila Madalena');
INSERT INTO addresses (created_at, updated_at, nickname, uuid, active, zip_code, street_name, street_number, city_name, state_name, latitude, longitude, reference, neighborhood)
VALUES('2021-07-01 19:00:01', '2021-07-01 19:00:01', 'Matriz', '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4555', true, '62800000', 'rua quatro ventos', '100', 'Aracati', 'CE', 0, 0, '', 'Canoa Quebrada');


INSERT INTO customer_addresses (address_id, customer_id) values ((select id from addresses where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4111'), (select id from customers where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4a81'));
INSERT INTO customer_addresses (address_id, customer_id) values ((select id from addresses where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4222'), (select id from customers where uuid = '7d300aca-4966-461e-aa15-efe4d5a5d448'));
INSERT INTO customer_addresses (address_id, customer_id) values ((select id from addresses where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4333'), (select id from customers where uuid = 'c7eae6f3-832d-4b3b-a5fe-2b7b9cf9a688'));
INSERT INTO customer_addresses (address_id, customer_id) values ((select id from addresses where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4444'), (select id from customers where uuid = '0c482f53-2fc5-40b3-8f27-29e9c347e270'));
INSERT INTO customer_addresses (address_id, customer_id) values ((select id from addresses where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4555'), (select id from customers where uuid = '4e0eeb41-853a-48dd-8976-ffbca7e1fb98'));

INSERT INTO psp (psp_name, active, payment_fee, minimum_payment, meta_data) values ('itau', true, 0, 0.1, '{"url": "https://api.itau.com"}');
INSERT INTO psp (psp_name, active, payment_fee, minimum_payment, meta_data) values ('bradesco', true, 0, 0.1, '{"url": "https://api.bradesco.com"}');
INSERT INTO psp (psp_name, active, payment_fee, minimum_payment, meta_data) values ('santander', true, 0, 0.1, '{"url": "https://api.santander.com"}');
INSERT INTO psp (psp_name, active, payment_fee, minimum_payment, meta_data) values ('bb', true, 0, 0.1, '{"url": "https://api.bb.com"}');
INSERT INTO psp (psp_name, active, payment_fee, minimum_payment, meta_data) values ('caixa', true, 0, 0.1, '{"url": "https://api.caixa.com"}');

INSERT INTO pos_type (description) values ('retail');
INSERT INTO pos_type (description) values ('e-commerce');

INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values (NOW()::timestamp, NOW()::timestamp, 'quiosque caixa 1', true, '11111111-3ce2-43ac-b4b1-fb4b0fdd4111', '{}', (select id from customers where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4a81'), (select id from pos_type where description='retail'));
INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values (NOW()::timestamp, NOW()::timestamp, 'quiosque caixa 2', true, '11111112-3ce2-43ac-b4b1-fb4b0fdd4112', '{}', (select id from customers where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4a81'), (select id from pos_type where description='retail'));
INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values (NOW()::timestamp, NOW()::timestamp, 'quiosque caixa 3', false, '11111113-3ce2-43ac-b4b1-fb4b0fdd4113', '{}', (select id from customers where uuid = '3c82af17-3ce2-43ac-b4b1-fb4b0fdd4a81'), (select id from pos_type where description='retail'));
INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values ('2021-01-01 13:00:01', '2021-01-01 13:00:01', 'xpto caixa 1', true, '22222221-3ce2-43ac-b4b1-fb4b0fdd4221', '{}', (select id from customers where uuid = '7d300aca-4966-461e-aa15-efe4d5a5d448'), (select id from pos_type where description='retail'));
INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values ('2021-02-01 14:00:01', '2021-02-01 14:00:01', 'big caixa', true, '33333331-3ce2-43ac-b4b1-fb4b0fdd4331', '{}', (select id from customers where uuid = 'c7eae6f3-832d-4b3b-a5fe-2b7b9cf9a688'), (select id from pos_type where description='retail'));
INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values ('2021-03-01 15:00:01', '2021-03-01 15:00:01', 'comp caixa', true, '44444441-3ce2-43ac-b4b1-fb4b0fdd4441', '{}', (select id from customers where uuid = '0c482f53-2fc5-40b3-8f27-29e9c347e270'), (select id from pos_type where description='retail'));
INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values ('2021-07-01 19:00:01', '2021-07-01 19:00:01', 'corp caixa', true, '55555551-3ce2-43ac-b4b1-fb4b0fdd4551', '{}', (select id from customers where uuid = '4e0eeb41-853a-48dd-8976-ffbca7e1fb98'), (select id from pos_type where description='retail'));
INSERT INTO pos (created_at, updated_at, "name", active, uuid, meta_data, customer_id, pos_type_id) values ('2021-07-01 19:10:01', '2021-07-01 19:10:01', 'corp caixa 2', true, '55555552-3ce2-43ac-b4b1-fb4b0fdd4552', '{}', (select id from customers where uuid = '4e0eeb41-853a-48dd-8976-ffbca7e1fb98'), (select id from pos_type where description='e-commerce'));


INSERT INTO orders (created_at, updated_at, uuid, total_order, status, psp_id, pos_id, meta_data, callback_url, expiration_date, payment_date) values ('2021-11-24 12:00:05', NOW()::timestamp, '11111111-1111-43ac-b4b1-11110fdd4111', 150, 'approved', 1, 1, '{"qrcode": {"base64": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA0IdORK5CYII=", "text": "00020101021226900014BR.GOV.BCB.PIX2568pix-qr.com/instore/p/v2/2dd501732dc3459da79133bc4eb8c20543530016com.0129https://m***6304FFFD"}, "deep_link": null}', 'https://acme.com/callback', NULL, NOW()::timestamp);
INSERT INTO order_items ("name", unit_price, quantity, order_id, ean, sku) values ('geleia de mocoto', 75, 2, 1, '', '000000000000977724-UN');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-11-24 12:00:06', '2021-11-24 12:00:06', 'creating', '{"status": "ATIVA", "txid": "d7365126e009441b89b5151f00a0a9bf", "revisao": 0, "location": "api.itau/ff4d3b09-8d2e-4fb4-9df1-81f755417323"}', 1, 1, '2021-11-24 12:00:06');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-11-24 12:00:35', '2021-11-24 12:00:35', 'callback', '{"endToEndId": "E60701190202103311933DY5DP1F042B", "txid": "d7365126e009441b89b5151f00a0a9bf", "valor": "150"}', 1, 1, '2021-11-24 12:00:35');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-11-24 12:00:35', '2021-11-24 12:00:35', 'payment', '{"endToEndId": "E60701190202103311933DY5DP1F042B", "txid": "d7365126e009441b89b5151f00a0a9bf", "valor": "150"}', 1, 1, '2021-11-24 12:00:35');

INSERT INTO orders (created_at, updated_at, uuid, total_order, status, psp_id, pos_id, meta_data, callback_url, expiration_date, payment_date) values ('2021-11-24 12:01:05', '2021-11-24 12:01:05', '11111112-1111-43ac-b4b1-11110fdd4112', 200, 'approved', 1, 1, '{"qrcode": {"base64": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA0IdORK5CYgg=", "text": "00020101021226900015BR.GOV.BCB.PIX2568pix-qr.com/instore/p/v2/2dd501732dc3459da79133bc4eb8c20543530016com.0129https://m***6304FFFF"}, "deep_link": null}', 'https://acme.com/callback', NULL, '2021-11-24 12:01:05');
INSERT INTO order_items ("name", unit_price, quantity, order_id, ean, sku) values ('pacoca pack', 100, 2, 2, '', '000000000000977730-UN');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-11-24 12:01:05', '2021-11-24 12:01:05', 'creating', '{"status": "ATIVA", "txid": "d7365126e009441b89b5151f00a0afff", "revisao": 0, "location": "api.itau/ff4d3b09-8d2e-4fb4-9df1-81f755417323"}', 2, 1, '2021-11-24 12:00:06');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-11-24 12:01:35', '2021-11-24 12:01:35', 'callback', '{"endToEndId": "E60701190202103311933DY5DP1F04BB", "txid": "d7365126e009441b89b5151f00a0afff", "valor": "200"}', 2, 1, '2021-11-24 12:01:35');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-11-24 12:01:35', '2021-11-24 12:01:35', 'payment', '{"endToEndId": "E60701190202103311933DY5DP1F04BB", "txid": "d7365126e009441b89b5151f00a0afff", "valor": "200"}', 2, 1, '2021-11-24 12:01:35');

INSERT INTO orders (created_at, updated_at, uuid, total_order, status, psp_id, pos_id, meta_data, callback_url, expiration_date, payment_date) values ('2021-01-02 12:01:05', '2021-01-02 12:01:05', '22222221-1111-43ac-b4b1-11110fdd4221', 100, 'approved', 2, 4, '{"qrcode": {"base64": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA0IdORK5CYyy=", "text": "00020101021226900012BR.GOV.BCB.PIX2562pix-qr.com/instore/p/v2/2dd501732dc3459da79133bc4eb8c20543530016com.0129https://m***6304FF22"}, "deep_link": null}', 'https://xpto.com/callback', NULL, '2021-01-02 12:01:05');
INSERT INTO order_items ("name", unit_price, quantity, order_id, ean, sku) values ('noodles', 100, 1, 3, '', '000000000000977735-UN');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-01-02 12:01:05', '2021-01-02 12:01:05', 'creating', '{"status": "ATIVA", "txid": "d7365126e009441b89b5151f00a0af00", "revisao": 0, "location": "api/ff4d3b09-8d2e-4fb4-9df1-81f755417563"}', 3, 4, '2021-01-02 12:00:06');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-01-02 12:01:35', '2021-01-02 12:01:35', 'callback', '{"endToEndId": "E60701190202103311933DY5DP1F04BB", "txid": "d7365126e009441b89b5151f00a0afff", "valor": "200"}', 3, 4, '2021-01-02 12:01:35');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-01-02 12:01:35', '2021-01-02 12:01:35', 'payment', '{"endToEndId": "E60701190202103311933DY5DP1F04BB", "txid": "d7365126e009441b89b5151f00a0afff", "valor": "200"}', 3, 4, '2021-01-02 12:01:35');

INSERT INTO orders (created_at, updated_at, uuid, total_order, status, psp_id, pos_id, meta_data, callback_url, expiration_date, payment_date) values ('2021-01-12 12:01:05', '2021-01-12 12:01:05', '22222222-1111-43ac-b4b1-11110fdd4222', 100, 'refunded', 2, 4, '{"qrcode": {"base64": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA0IdORK5CYKK=", "text": "00020101021226900012BR.GOV.BCB.PIX2562pix-qr.com/instore/p/v2/2dd501732dc3459da79133bc4eb8c20543530016com.0150https://m***6304FF25"}, "deep_link": null}', 'https://xpto.com/callback', NULL, '2021-01-12 12:01:05');
INSERT INTO order_items ("name", unit_price, quantity, order_id, ean, sku) values ('noodles', 100, 1, 4, '', '000000000000977735-UN');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-01-02 12:01:05', '2021-01-02 12:01:05', 'creating', '{"status": "ATIVA", "txid": "d7365126e009441b89b5151f00a0af00", "revisao": 0, "location": "api/ff4d3b09-8d2e-4fb4-9df1-81f755417563"}', 3, 4, '2021-01-02 12:00:06');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-01-02 12:01:35', '2021-01-02 12:01:35', 'payment', '{"endToEndId": "E60701190202103311933DY5DP1F04BB", "txid": "d7365126e009441b89b5151f00a0afff", "valor": "200"}', 3, 4, '2021-01-02 12:01:35');
INSERT INTO transaction_logs (created_at, updated_at, transaction_type, psp_response, order_id, pos_id, created_at_date) values ('2021-01-02 12:01:35', '2021-01-02 12:01:35', 'refunding', '{"endToEndId": "E60701190202103311933DY5DP1F04BB", "txid": "d7365126e009441b89b5151f00a0afff", "valor": "200"}', 3, 4, '2021-01-02 12:01:35');
