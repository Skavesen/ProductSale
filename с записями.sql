/*
 Navicat Premium Data Transfer

 Source Server         : FirstConnection
 Source Server Type    : PostgreSQL
 Source Server Version : 100013
 Source Host           : localhost:5432
 Source Catalog        : SaleDB
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100013
 File Encoding         : 65001

 Date: 18/02/2022 23:44:59
*/


-- ----------------------------
-- Sequence structure for Buyer_id_buyer_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Buyer_id_buyer_seq";
CREATE SEQUENCE "public"."Buyer_id_buyer_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Product_id_product_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Product_id_product_seq";
CREATE SEQUENCE "public"."Product_id_product_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ProvidedProduct_id_provided_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ProvidedProduct_id_provided_seq";
CREATE SEQUENCE "public"."ProvidedProduct_id_provided_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Sale_id_sale_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Sale_id_sale_seq";
CREATE SEQUENCE "public"."Sale_id_sale_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for SalesData_id_sales_data_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."SalesData_id_sales_data_seq";
CREATE SEQUENCE "public"."SalesData_id_sales_data_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for SalesPoint_id_sales_point_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."SalesPoint_id_sales_point_seq";
CREATE SEQUENCE "public"."SalesPoint_id_sales_point_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_history_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_history_id_seq";
CREATE SEQUENCE "public"."t_history_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Buyer
-- ----------------------------
DROP TABLE IF EXISTS "public"."Buyer";
CREATE TABLE "public"."Buyer" (
  "id_buyer" int4 NOT NULL DEFAULT nextval('"Buyer_id_buyer_seq"'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "mas_id_sale" int4[],
  "login" varchar(25) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Buyer
-- ----------------------------
INSERT INTO "public"."Buyer" VALUES (4, 'Вадим', '{2}', 'Пользователь_2');
INSERT INTO "public"."Buyer" VALUES (5, 'Вацлав', '{3}', 'Пользователь_3');
INSERT INTO "public"."Buyer" VALUES (6, 'Платон', '{4}', 'Пользователь_4');
INSERT INTO "public"."Buyer" VALUES (7, 'Ерофей', '{5}', 'Пользователь_5');
INSERT INTO "public"."Buyer" VALUES (8, 'Вениамин', '{6}', 'Пользователь_6');
INSERT INTO "public"."Buyer" VALUES (9, 'Юлиан', '{7}', 'Пользователь_7');
INSERT INTO "public"."Buyer" VALUES (10, 'Осип', '{8}', 'Пользователь_8');
INSERT INTO "public"."Buyer" VALUES (11, 'Адриан', '{9}', 'Пользователь_9');
INSERT INTO "public"."Buyer" VALUES (12, 'Всеволод', '{10}', 'Пользователь_10');
INSERT INTO "public"."Buyer" VALUES (13, 'Антон', '{1,2,3,4}', 'gg');
INSERT INTO "public"."Buyer" VALUES (2, 'tON', '{7,12,44,10,10,11,12,53}', 'admin');
INSERT INTO "public"."Buyer" VALUES (1, 'Bill', '{1,2,5,110,10,11,12,100,1100,1200,54}', 'user');
INSERT INTO "public"."Buyer" VALUES (3, 'Никита', '{1,55}', 'Пользователь_1');

-- ----------------------------
-- Table structure for Product
-- ----------------------------
DROP TABLE IF EXISTS "public"."Product";
CREATE TABLE "public"."Product" (
  "id_product" int4 NOT NULL DEFAULT nextval('"Product_id_product_seq"'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "price" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Product
-- ----------------------------
INSERT INTO "public"."Product" VALUES (1, 'Молоко', 205);
INSERT INTO "public"."Product" VALUES (2, 'Сметана', 673);
INSERT INTO "public"."Product" VALUES (3, 'Кефир', 580);
INSERT INTO "public"."Product" VALUES (4, 'Сыр', 534);
INSERT INTO "public"."Product" VALUES (5, 'Хлеб', 102);
INSERT INTO "public"."Product" VALUES (6, 'Картофель', 383);
INSERT INTO "public"."Product" VALUES (7, 'Морковь', 774);
INSERT INTO "public"."Product" VALUES (9, 'Яблоко', 884);
INSERT INTO "public"."Product" VALUES (10, 'Груша', 467);
INSERT INTO "public"."Product" VALUES (11, 'Рыба', 524);
INSERT INTO "public"."Product" VALUES (12, 'Кофеты', 498);
INSERT INTO "public"."Product" VALUES (13, 'Печенье', 389);
INSERT INTO "public"."Product" VALUES (14, 'Вода', 403);
INSERT INTO "public"."Product" VALUES (15, 'Кукуруза', 802);
INSERT INTO "public"."Product" VALUES (8, 'Свекла', 3);

-- ----------------------------
-- Table structure for ProvidedProduct
-- ----------------------------
DROP TABLE IF EXISTS "public"."ProvidedProduct";
CREATE TABLE "public"."ProvidedProduct" (
  "id_provided" int4 NOT NULL DEFAULT nextval('"ProvidedProduct_id_provided_seq"'::regclass),
  "id_product" int4 NOT NULL,
  "quantity" int4 NOT NULL
)
;

-- ----------------------------
-- Records of ProvidedProduct
-- ----------------------------
INSERT INTO "public"."ProvidedProduct" VALUES (1, 1, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (2, 2, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (3, 3, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (4, 4, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (5, 5, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (6, 6, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (7, 7, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (8, 8, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (9, 9, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (10, 10, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (11, 11, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (12, 12, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (13, 13, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (14, 14, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (15, 15, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (16, 1, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (17, 2, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (18, 3, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (19, 4, 83);
INSERT INTO "public"."ProvidedProduct" VALUES (20, 5, 83);

-- ----------------------------
-- Table structure for Sale
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sale";
CREATE TABLE "public"."Sale" (
  "id_sale" int4 NOT NULL DEFAULT nextval('"Sale_id_sale_seq"'::regclass),
  "date" date NOT NULL,
  "time" time(6) NOT NULL,
  "id_sales_point" int4 NOT NULL,
  "id_buyer" int4,
  "id_sales_data" int4 NOT NULL,
  "total_amount" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Sale
-- ----------------------------
INSERT INTO "public"."Sale" VALUES (2, '2022-02-17', '11:09:50', 2, 2, 2, 4902);
INSERT INTO "public"."Sale" VALUES (3, '2022-02-17', '11:09:50', 3, 3, 3, 1012);
INSERT INTO "public"."Sale" VALUES (4, '2022-02-17', '11:09:50', 4, 4, 4, 2550);
INSERT INTO "public"."Sale" VALUES (5, '2022-02-17', '11:09:50', 5, 5, 5, 3242);
INSERT INTO "public"."Sale" VALUES (6, '2022-02-17', '11:09:50', 6, 6, 6, 1629);
INSERT INTO "public"."Sale" VALUES (7, '2022-02-17', '11:09:50', 7, 7, 7, 2525);
INSERT INTO "public"."Sale" VALUES (8, '2022-02-17', '11:09:50', 8, 8, 8, 1093);
INSERT INTO "public"."Sale" VALUES (9, '2022-02-17', '11:09:50', 9, 9, 9, 1188);
INSERT INTO "public"."Sale" VALUES (10, '2022-02-17', '11:09:50', 1, 10, 10, 2750);
INSERT INTO "public"."Sale" VALUES (11, '2022-02-17', '11:09:50', 2, 1, 11, 4093);
INSERT INTO "public"."Sale" VALUES (12, '2022-02-17', '11:09:50', 3, 2, 12, 1878);
INSERT INTO "public"."Sale" VALUES (13, '2022-02-17', '11:09:50', 4, 3, 13, 1378);
INSERT INTO "public"."Sale" VALUES (14, '2022-02-17', '11:09:50', 5, 4, 14, 4081);
INSERT INTO "public"."Sale" VALUES (15, '2022-02-17', '11:09:50', 6, 5, 15, 4975);
INSERT INTO "public"."Sale" VALUES (16, '2022-02-17', '11:09:50', 7, 6, 16, 3085);
INSERT INTO "public"."Sale" VALUES (17, '2022-02-17', '11:09:50', 8, 7, 17, 3919);
INSERT INTO "public"."Sale" VALUES (18, '2022-02-17', '11:09:50', 9, 8, 18, 4198);
INSERT INTO "public"."Sale" VALUES (19, '2022-02-17', '11:09:50', 1, 9, 19, 3069);
INSERT INTO "public"."Sale" VALUES (20, '2022-02-17', '11:09:50', 2, 10, 20, 4133);
INSERT INTO "public"."Sale" VALUES (21, '2022-02-17', '11:09:50', 3, 1, 1, 2607);
INSERT INTO "public"."Sale" VALUES (22, '2022-02-17', '11:09:50', 4, 2, 2, 4924);
INSERT INTO "public"."Sale" VALUES (23, '2022-02-17', '11:09:50', 5, 3, 3, 2393);
INSERT INTO "public"."Sale" VALUES (24, '2022-02-17', '11:09:50', 6, 4, 4, 2816);
INSERT INTO "public"."Sale" VALUES (25, '2022-02-17', '11:09:50', 7, 5, 5, 1068);
INSERT INTO "public"."Sale" VALUES (26, '2022-02-17', '11:09:50', 8, 6, 6, 3941);
INSERT INTO "public"."Sale" VALUES (27, '2022-02-17', '11:09:50', 9, 7, 7, 1227);
INSERT INTO "public"."Sale" VALUES (28, '2022-02-17', '11:09:50', 1, 8, 8, 2883);
INSERT INTO "public"."Sale" VALUES (29, '2022-02-17', '11:09:50', 2, 9, 9, 4889);
INSERT INTO "public"."Sale" VALUES (30, '2022-02-17', '11:09:50', 3, 10, 10, 4658);
INSERT INTO "public"."Sale" VALUES (31, '2022-01-01', '10:00:00', 1, 1, 1, 1000);
INSERT INTO "public"."Sale" VALUES (32, '2020-01-01', '10:00:00', 1, NULL, 1, 100);
INSERT INTO "public"."Sale" VALUES (37, '2011-11-11', '10:10:00', 1, NULL, 1, 383);
INSERT INTO "public"."Sale" VALUES (40, '2022-02-02', '07:07:07', 1, NULL, 3, 678);
INSERT INTO "public"."Sale" VALUES (41, '1000-10-10', '10:10:10', 1, NULL, 2, 774);
INSERT INTO "public"."Sale" VALUES (44, '2020-01-14', '14:14:14', 1, NULL, 1, 383);
INSERT INTO "public"."Sale" VALUES (45, '2020-01-14', '14:14:14', 1, NULL, 3, 678);
INSERT INTO "public"."Sale" VALUES (46, '2020-04-01', '10:10:10', 1, NULL, 4, 7072);
INSERT INTO "public"."Sale" VALUES (47, '2021-01-01', '12:12:12', 1, 1, 3, 2712);
INSERT INTO "public"."Sale" VALUES (48, '2021-01-01', '12:12:12', 1, 1, 3, 12);
INSERT INTO "public"."Sale" VALUES (53, '2000-10-10', '10:10:01', 1, 2, 3, 12);
INSERT INTO "public"."Sale" VALUES (54, '2022-02-18', '05:17:29', 2, 1, 3, 12);
INSERT INTO "public"."Sale" VALUES (55, '2022-02-18', '17:22:37', 3, 3, 4, 7072);
INSERT INTO "public"."Sale" VALUES (1, '2022-02-18', '17:52:33', 4, 5, 4, 3107);

-- ----------------------------
-- Table structure for SalesData
-- ----------------------------
DROP TABLE IF EXISTS "public"."SalesData";
CREATE TABLE "public"."SalesData" (
  "id_sales_data" int4 NOT NULL DEFAULT nextval('"SalesData_id_sales_data_seq"'::regclass),
  "id_product" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "product_amount" int4 NOT NULL
)
;

-- ----------------------------
-- Records of SalesData
-- ----------------------------
INSERT INTO "public"."SalesData" VALUES (1, 6, 2, 692);
INSERT INTO "public"."SalesData" VALUES (2, 7, 1, 949);
INSERT INTO "public"."SalesData" VALUES (3, 8, 4, 556);
INSERT INTO "public"."SalesData" VALUES (4, 9, 8, 724);
INSERT INTO "public"."SalesData" VALUES (5, 10, 1, 334);
INSERT INTO "public"."SalesData" VALUES (6, 11, 7, 558);
INSERT INTO "public"."SalesData" VALUES (7, 12, 4, 678);
INSERT INTO "public"."SalesData" VALUES (8, 13, 8, 190);
INSERT INTO "public"."SalesData" VALUES (9, 14, 1, 151);
INSERT INTO "public"."SalesData" VALUES (10, 15, 5, 244);
INSERT INTO "public"."SalesData" VALUES (11, 1, 5, 647);
INSERT INTO "public"."SalesData" VALUES (12, 2, 9, 360);
INSERT INTO "public"."SalesData" VALUES (13, 3, 4, 684);
INSERT INTO "public"."SalesData" VALUES (14, 4, 1, 859);
INSERT INTO "public"."SalesData" VALUES (15, 5, 4, 644);
INSERT INTO "public"."SalesData" VALUES (16, 6, 3, 950);
INSERT INTO "public"."SalesData" VALUES (17, 7, 5, 887);
INSERT INTO "public"."SalesData" VALUES (18, 8, 7, 882);
INSERT INTO "public"."SalesData" VALUES (19, 9, 8, 758);
INSERT INTO "public"."SalesData" VALUES (20, 10, 1, 645);

-- ----------------------------
-- Table structure for SalesPoint
-- ----------------------------
DROP TABLE IF EXISTS "public"."SalesPoint";
CREATE TABLE "public"."SalesPoint" (
  "id_sales_point" int4 NOT NULL DEFAULT nextval('"SalesPoint_id_sales_point_seq"'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "id_provided" int4 NOT NULL
)
;

-- ----------------------------
-- Records of SalesPoint
-- ----------------------------
INSERT INTO "public"."SalesPoint" VALUES (1, 'Будённовский', 1);
INSERT INTO "public"."SalesPoint" VALUES (2, 'Калининский', 2);
INSERT INTO "public"."SalesPoint" VALUES (3, 'Кировский', 3);
INSERT INTO "public"."SalesPoint" VALUES (4, 'Куйбышевский', 4);
INSERT INTO "public"."SalesPoint" VALUES (5, 'Ворошиловский', 5);
INSERT INTO "public"."SalesPoint" VALUES (6, 'Киевский', 6);
INSERT INTO "public"."SalesPoint" VALUES (7, 'Ленинский', 7);
INSERT INTO "public"."SalesPoint" VALUES (8, 'Петровский', 8);
INSERT INTO "public"."SalesPoint" VALUES (9, 'Пролетарский', 9);

-- ----------------------------
-- Table structure for t_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_history";
CREATE TABLE "public"."t_history" (
  "id" int4 NOT NULL DEFAULT nextval('t_history_id_seq'::regclass),
  "tstamp" timestamp(6) DEFAULT now(),
  "schemaname" text COLLATE "pg_catalog"."default",
  "tabname" text COLLATE "pg_catalog"."default",
  "operation" text COLLATE "pg_catalog"."default",
  "who" text COLLATE "pg_catalog"."default" DEFAULT CURRENT_USER,
  "new_val" json,
  "old_val" json
)
;

-- ----------------------------
-- Records of t_history
-- ----------------------------
INSERT INTO "public"."t_history" VALUES (1, '2022-02-18 13:02:54.327544', 'public', 'Buyer', 'INSERT', 'postgres', '{"id_buyer":13,"name":"Антон","mas_id_sale":[1,2,3,4],"login":"gg"}', NULL);
INSERT INTO "public"."t_history" VALUES (2, '2022-02-18 13:38:27.643291', 'public', 'Sale', 'UPDATE', 'postgres', '{"id_sale":1,"date":"2022-02-17","time":"11:09:50","id_sales_point":1,"id_buyer":null,"id_sales_data":1,"total_amount":3107}', '{"id_sale":1,"date":"2022-02-17","time":"11:09:50","id_sales_point":1,"id_buyer":1,"id_sales_data":1,"total_amount":3107}');
INSERT INTO "public"."t_history" VALUES (3, '2022-02-18 13:53:51.379303', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":31,"date":"2022-01-01","time":"10:00:00","id_sales_point":1,"id_buyer":1,"id_sales_data":1,"total_amount":1000}', NULL);
INSERT INTO "public"."t_history" VALUES (4, '2022-02-18 13:55:10.459961', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":32,"date":"2020-01-01","time":"10:00:00","id_sales_point":1,"id_buyer":null,"id_sales_data":1,"total_amount":100}', NULL);
INSERT INTO "public"."t_history" VALUES (9, '2022-02-18 14:13:20.666552', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":37,"date":"2011-11-11","time":"10:10:00","id_sales_point":1,"id_buyer":null,"id_sales_data":1,"total_amount":383}', NULL);
INSERT INTO "public"."t_history" VALUES (12, '2022-02-18 14:17:26.306564', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":40,"date":"2022-02-02","time":"07:07:07","id_sales_point":1,"id_buyer":null,"id_sales_data":3,"total_amount":678}', NULL);
INSERT INTO "public"."t_history" VALUES (13, '2022-02-18 14:21:52.064286', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":41,"date":"1000-10-10","time":"10:10:10","id_sales_point":1,"id_buyer":null,"id_sales_data":2,"total_amount":774}', NULL);
INSERT INTO "public"."t_history" VALUES (16, '2022-02-18 14:27:41.815391', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":44,"date":"2020-01-14","time":"14:14:14","id_sales_point":1,"id_buyer":null,"id_sales_data":1,"total_amount":383}', NULL);
INSERT INTO "public"."t_history" VALUES (17, '2022-02-18 14:28:13.026917', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":45,"date":"2020-01-14","time":"14:14:14","id_sales_point":1,"id_buyer":null,"id_sales_data":3,"total_amount":678}', NULL);
INSERT INTO "public"."t_history" VALUES (18, '2022-02-18 14:30:37.366061', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":46,"date":"2020-04-01","time":"10:10:10","id_sales_point":1,"id_buyer":null,"id_sales_data":4,"total_amount":7072}', NULL);
INSERT INTO "public"."t_history" VALUES (19, '2022-02-18 15:14:16.189575', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":47,"date":"2021-01-01","time":"12:12:12","id_sales_point":1,"id_buyer":1,"id_sales_data":3,"total_amount":2712}', NULL);
INSERT INTO "public"."t_history" VALUES (20, '2022-02-18 15:15:03.601842', 'public', 'Product', 'UPDATE', 'postgres', '{"id_product":8,"name":"Свекла","price":3}', '{"id_product":8,"name":"Свекла","price":678}');
INSERT INTO "public"."t_history" VALUES (21, '2022-02-18 15:15:11.597043', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":48,"date":"2021-01-01","time":"12:12:12","id_sales_point":1,"id_buyer":1,"id_sales_data":3,"total_amount":12}', NULL);
INSERT INTO "public"."t_history" VALUES (86, '2022-02-18 16:22:01.435277', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":53,"date":"2000-10-10","time":"10:10:01","id_sales_point":1,"id_buyer":2,"id_sales_data":3,"total_amount":12}', NULL);
INSERT INTO "public"."t_history" VALUES (87, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":1,"id_product":1,"quantity":87}', '{"id_provided":1,"id_product":1,"quantity":57}');
INSERT INTO "public"."t_history" VALUES (88, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":2,"id_product":2,"quantity":87}', '{"id_provided":2,"id_product":2,"quantity":89}');
INSERT INTO "public"."t_history" VALUES (89, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":3,"id_product":3,"quantity":87}', '{"id_provided":3,"id_product":3,"quantity":70}');
INSERT INTO "public"."t_history" VALUES (90, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":4,"id_product":4,"quantity":87}', '{"id_provided":4,"id_product":4,"quantity":49}');
INSERT INTO "public"."t_history" VALUES (91, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":5,"id_product":5,"quantity":87}', '{"id_provided":5,"id_product":5,"quantity":20}');
INSERT INTO "public"."t_history" VALUES (92, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":6,"id_product":6,"quantity":87}', '{"id_provided":6,"id_product":6,"quantity":41}');
INSERT INTO "public"."t_history" VALUES (93, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":7,"id_product":7,"quantity":87}', '{"id_provided":7,"id_product":7,"quantity":70}');
INSERT INTO "public"."t_history" VALUES (94, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":8,"id_product":8,"quantity":87}', '{"id_provided":8,"id_product":8,"quantity":15}');
INSERT INTO "public"."t_history" VALUES (95, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":9,"id_product":9,"quantity":87}', '{"id_provided":9,"id_product":9,"quantity":68}');
INSERT INTO "public"."t_history" VALUES (96, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":10,"id_product":10,"quantity":87}', '{"id_provided":10,"id_product":10,"quantity":31}');
INSERT INTO "public"."t_history" VALUES (97, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":11,"id_product":11,"quantity":87}', '{"id_provided":11,"id_product":11,"quantity":69}');
INSERT INTO "public"."t_history" VALUES (98, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":12,"id_product":12,"quantity":87}', '{"id_provided":12,"id_product":12,"quantity":75}');
INSERT INTO "public"."t_history" VALUES (99, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":13,"id_product":13,"quantity":87}', '{"id_provided":13,"id_product":13,"quantity":69}');
INSERT INTO "public"."t_history" VALUES (100, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":14,"id_product":14,"quantity":87}', '{"id_provided":14,"id_product":14,"quantity":84}');
INSERT INTO "public"."t_history" VALUES (101, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":15,"id_product":15,"quantity":87}', '{"id_provided":15,"id_product":15,"quantity":58}');
INSERT INTO "public"."t_history" VALUES (102, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":16,"id_product":1,"quantity":87}', '{"id_provided":16,"id_product":1,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (103, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":17,"id_product":2,"quantity":87}', '{"id_provided":17,"id_product":2,"quantity":34}');
INSERT INTO "public"."t_history" VALUES (104, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":18,"id_product":3,"quantity":87}', '{"id_provided":18,"id_product":3,"quantity":59}');
INSERT INTO "public"."t_history" VALUES (105, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":19,"id_product":4,"quantity":87}', '{"id_provided":19,"id_product":4,"quantity":93}');
INSERT INTO "public"."t_history" VALUES (106, '2022-02-18 16:22:01.435277', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":20,"id_product":5,"quantity":87}', '{"id_provided":20,"id_product":5,"quantity":56}');
INSERT INTO "public"."t_history" VALUES (107, '2022-02-18 16:22:01.435277', 'public', 'Buyer', 'UPDATE', 'postgres', '{"id_buyer":2,"name":"tON","mas_id_sale":[7,12,44,10,10,11,12,53],"login":"admin"}', '{"id_buyer":2,"name":"tON","mas_id_sale":[7,12,44,10,10,11,12],"login":"admin"}');
INSERT INTO "public"."t_history" VALUES (108, '2022-02-18 17:17:31.456985', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":54,"date":"2022-02-18","time":"05:17:29","id_sales_point":2,"id_buyer":1,"id_sales_data":3,"total_amount":12}', NULL);
INSERT INTO "public"."t_history" VALUES (109, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":1,"id_product":1,"quantity":85}', '{"id_provided":1,"id_product":1,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (110, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":2,"id_product":2,"quantity":85}', '{"id_provided":2,"id_product":2,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (111, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":3,"id_product":3,"quantity":85}', '{"id_provided":3,"id_product":3,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (112, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":4,"id_product":4,"quantity":85}', '{"id_provided":4,"id_product":4,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (113, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":5,"id_product":5,"quantity":85}', '{"id_provided":5,"id_product":5,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (114, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":6,"id_product":6,"quantity":85}', '{"id_provided":6,"id_product":6,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (115, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":7,"id_product":7,"quantity":85}', '{"id_provided":7,"id_product":7,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (116, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":8,"id_product":8,"quantity":85}', '{"id_provided":8,"id_product":8,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (117, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":9,"id_product":9,"quantity":85}', '{"id_provided":9,"id_product":9,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (118, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":10,"id_product":10,"quantity":85}', '{"id_provided":10,"id_product":10,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (119, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":11,"id_product":11,"quantity":85}', '{"id_provided":11,"id_product":11,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (120, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":12,"id_product":12,"quantity":85}', '{"id_provided":12,"id_product":12,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (121, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":13,"id_product":13,"quantity":85}', '{"id_provided":13,"id_product":13,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (122, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":14,"id_product":14,"quantity":85}', '{"id_provided":14,"id_product":14,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (123, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":15,"id_product":15,"quantity":85}', '{"id_provided":15,"id_product":15,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (124, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":16,"id_product":1,"quantity":85}', '{"id_provided":16,"id_product":1,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (125, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":17,"id_product":2,"quantity":85}', '{"id_provided":17,"id_product":2,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (126, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":18,"id_product":3,"quantity":85}', '{"id_provided":18,"id_product":3,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (127, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":19,"id_product":4,"quantity":85}', '{"id_provided":19,"id_product":4,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (128, '2022-02-18 17:17:31.456985', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":20,"id_product":5,"quantity":85}', '{"id_provided":20,"id_product":5,"quantity":87}');
INSERT INTO "public"."t_history" VALUES (129, '2022-02-18 17:17:31.456985', 'public', 'Buyer', 'UPDATE', 'postgres', '{"id_buyer":1,"name":"Bill","mas_id_sale":[1,2,5,110,10,11,12,100,1100,1200,54],"login":"user"}', '{"id_buyer":1,"name":"Bill","mas_id_sale":[1,2,5,110,10,11,12,100,1100,1200],"login":"user"}');
INSERT INTO "public"."t_history" VALUES (130, '2022-02-18 17:22:37.396402', 'public', 'Sale', 'INSERT', 'postgres', '{"id_sale":55,"date":"2022-02-18","time":"17:22:37","id_sales_point":3,"id_buyer":3,"id_sales_data":4,"total_amount":7072}', NULL);
INSERT INTO "public"."t_history" VALUES (131, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":1,"id_product":1,"quantity":83}', '{"id_provided":1,"id_product":1,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (132, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":2,"id_product":2,"quantity":83}', '{"id_provided":2,"id_product":2,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (133, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":3,"id_product":3,"quantity":83}', '{"id_provided":3,"id_product":3,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (134, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":4,"id_product":4,"quantity":83}', '{"id_provided":4,"id_product":4,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (135, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":5,"id_product":5,"quantity":83}', '{"id_provided":5,"id_product":5,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (136, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":6,"id_product":6,"quantity":83}', '{"id_provided":6,"id_product":6,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (137, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":7,"id_product":7,"quantity":83}', '{"id_provided":7,"id_product":7,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (138, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":8,"id_product":8,"quantity":83}', '{"id_provided":8,"id_product":8,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (139, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":9,"id_product":9,"quantity":83}', '{"id_provided":9,"id_product":9,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (140, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":10,"id_product":10,"quantity":83}', '{"id_provided":10,"id_product":10,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (141, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":11,"id_product":11,"quantity":83}', '{"id_provided":11,"id_product":11,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (142, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":12,"id_product":12,"quantity":83}', '{"id_provided":12,"id_product":12,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (143, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":13,"id_product":13,"quantity":83}', '{"id_provided":13,"id_product":13,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (144, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":14,"id_product":14,"quantity":83}', '{"id_provided":14,"id_product":14,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (145, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":15,"id_product":15,"quantity":83}', '{"id_provided":15,"id_product":15,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (146, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":16,"id_product":1,"quantity":83}', '{"id_provided":16,"id_product":1,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (147, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":17,"id_product":2,"quantity":83}', '{"id_provided":17,"id_product":2,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (148, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":18,"id_product":3,"quantity":83}', '{"id_provided":18,"id_product":3,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (149, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":19,"id_product":4,"quantity":83}', '{"id_provided":19,"id_product":4,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (150, '2022-02-18 17:22:37.396402', 'public', 'ProvidedProduct', 'UPDATE', 'postgres', '{"id_provided":20,"id_product":5,"quantity":83}', '{"id_provided":20,"id_product":5,"quantity":85}');
INSERT INTO "public"."t_history" VALUES (151, '2022-02-18 17:22:37.396402', 'public', 'Buyer', 'UPDATE', 'postgres', '{"id_buyer":3,"name":"Никита","mas_id_sale":[1,55],"login":"Пользователь_1"}', '{"id_buyer":3,"name":"Никита","mas_id_sale":[1],"login":"Пользователь_1"}');
INSERT INTO "public"."t_history" VALUES (152, '2022-02-18 17:52:55.775712', 'public', 'Sale', 'UPDATE', 'postgres', '{"id_sale":1,"date":"2022-02-18","time":"17:52:33","id_sales_point":4,"id_buyer":5,"id_sales_data":4,"total_amount":3107}', '{"id_sale":1,"date":"2022-02-17","time":"11:09:50","id_sales_point":1,"id_buyer":null,"id_sales_data":1,"total_amount":3107}');
INSERT INTO "public"."t_history" VALUES (153, '2022-02-18 18:39:53.887002', 'public', 'SalesData', 'INSERT', 'postgres', '{"id_sales_data":21,"id_product":2,"quantity":1,"product_amount":60}', NULL);
INSERT INTO "public"."t_history" VALUES (154, '2022-02-18 18:40:34.871905', 'public', 'SalesData', 'UPDATE', 'postgres', '{"id_sales_data":21,"id_product":1,"quantity":80,"product_amount":60}', '{"id_sales_data":21,"id_product":2,"quantity":1,"product_amount":60}');
INSERT INTO "public"."t_history" VALUES (155, '2022-02-18 18:40:47.508178', 'public', 'SalesData', 'DELETE', 'postgres', NULL, '{"id_sales_data":21,"id_product":1,"quantity":80,"product_amount":60}');
INSERT INTO "public"."t_history" VALUES (156, '2022-02-18 19:44:28.690403', 'public', 'SalesPoint', 'INSERT', 'postgres', '{"id_sales_point":10,"name":"ПРоверка","id_provided":1}', NULL);
INSERT INTO "public"."t_history" VALUES (157, '2022-02-18 19:45:40.487937', 'public', 'SalesPoint', 'UPDATE', 'postgres', '{"id_sales_point":10,"name":"Продуктовый","id_provided":2}', '{"id_sales_point":10,"name":"ПРоверка","id_provided":1}');
INSERT INTO "public"."t_history" VALUES (158, '2022-02-18 19:45:56.294546', 'public', 'SalesPoint', 'DELETE', 'postgres', NULL, '{"id_sales_point":10,"name":"Продуктовый","id_provided":2}');

-- ----------------------------
-- Function structure for change_trigger
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."change_trigger"();
CREATE OR REPLACE FUNCTION "public"."change_trigger"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
       BEGIN
         IF TG_OP = 'INSERT'
         THEN INSERT INTO t_history (
                tabname, schemaname, operation, new_val
              ) VALUES (
                TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(NEW)
              );
           RETURN NEW;
         ELSIF  TG_OP = 'UPDATE'
         THEN
           INSERT INTO t_history (
             tabname, schemaname, operation, new_val, old_val
           )
           VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(NEW), row_to_json(OLD));
           RETURN NEW;
         ELSIF TG_OP = 'DELETE'
         THEN
           INSERT INTO t_history
             (tabname, schemaname, operation, old_val)
             VALUES (
               TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(OLD)
             );
             RETURN OLD;
         END IF;
       END;
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;

-- ----------------------------
-- Function structure for insert_into_sale
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."insert_into_sale"("_date" date, "_time" time, "_id_sales_point" int4, "_id_buyer" int4, "_id_sales_data" int4);
CREATE OR REPLACE FUNCTION "public"."insert_into_sale"("_date" date, "_time" time, "_id_sales_point" int4, "_id_buyer" int4, "_id_sales_data" int4)
  RETURNS "pg_catalog"."void" AS $BODY$
	DECLARE _total_amount integer;
      BEGIN
			IF (_id_buyer = NULL OR _id_buyer = 0)
				THEN
						IF ((SELECT quantity FROM "ProvidedProduct" WHERE id_product = (SELECT id_product FROM "SalesData" WHERE id_sales_data = _id_sales_data)) >= 	(SELECT quantity FROM "SalesData" WHERE id_sales_data = _id_sales_data))
						THEN
							_total_amount = ((SELECT price FROM "Product" WHERE id_product = (SELECT id_product FROM "SalesData" WHERE id_sales_data = _id_sales_data))*(SELECT quantity FROM "SalesData" WHERE id_sales_data = _id_sales_data));
							INSERT INTO "Sale"("date", "time", id_sales_point, id_sales_data, total_amount)
							VALUES(_date, _time, _id_sales_point, _id_sales_data, _total_amount);
							UPDATE "ProvidedProduct" SET(quantity) = (SELECT(SELECT quantity FROM "ProvidedProduct" WHERE id_provided = (SELECT id_provided FROM "SalesPoint" WHERE id_sales_point = 2))-(SELECT quantity FROM "SalesData" WHERE id_sales_data = 1));
						ELSE
							SELECT 'Ошибка';
						END IF;
			ELSE
						IF ((SELECT quantity FROM "ProvidedProduct" WHERE id_product = (SELECT id_product FROM "SalesData" WHERE id_sales_data = _id_sales_data)) 
						>= 
						(SELECT quantity FROM "SalesData" WHERE id_sales_data = _id_sales_data))
						THEN
							_total_amount = ((SELECT price FROM "Product" WHERE id_product = (SELECT id_product FROM "SalesData" WHERE id_sales_data = _id_sales_data))*(SELECT quantity FROM "SalesData" WHERE id_sales_data = _id_sales_data));
							INSERT INTO "Sale"("date", "time", id_sales_point, id_buyer, id_sales_data, total_amount)
							VALUES(_date, _time, _id_sales_point, _id_buyer, _id_sales_data, _total_amount);							
							UPDATE "ProvidedProduct" SET(quantity) = (SELECT(SELECT quantity FROM "ProvidedProduct" WHERE id_provided = (SELECT id_provided FROM "SalesPoint" WHERE id_sales_point = 2))-(SELECT quantity FROM "SalesData" WHERE id_sales_data = 1));
							UPDATE "Buyer" SET mas_id_sale = array_append(mas_id_sale, (SELECT last_value FROM "Sale_id_sale_seq"):: INT) WHERE id_buyer = _id_buyer;
						ELSE
							SELECT 'Ошибка';					
						END IF;
				END IF;
      END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Buyer_id_buyer_seq"
OWNED BY "public"."Buyer"."id_buyer";
SELECT setval('"public"."Buyer_id_buyer_seq"', 14, true);
ALTER SEQUENCE "public"."Product_id_product_seq"
OWNED BY "public"."Product"."id_product";
SELECT setval('"public"."Product_id_product_seq"', 17, true);
ALTER SEQUENCE "public"."ProvidedProduct_id_provided_seq"
OWNED BY "public"."ProvidedProduct"."id_provided";
SELECT setval('"public"."ProvidedProduct_id_provided_seq"', 23, true);
ALTER SEQUENCE "public"."Sale_id_sale_seq"
OWNED BY "public"."Sale"."id_sale";
SELECT setval('"public"."Sale_id_sale_seq"', 56, true);
ALTER SEQUENCE "public"."SalesData_id_sales_data_seq"
OWNED BY "public"."SalesData"."id_sales_data";
SELECT setval('"public"."SalesData_id_sales_data_seq"', 22, true);
ALTER SEQUENCE "public"."SalesPoint_id_sales_point_seq"
OWNED BY "public"."SalesPoint"."id_sales_point";
SELECT setval('"public"."SalesPoint_id_sales_point_seq"', 11, true);
ALTER SEQUENCE "public"."t_history_id_seq"
OWNED BY "public"."t_history"."id";
SELECT setval('"public"."t_history_id_seq"', 159, true);

-- ----------------------------
-- Triggers structure for table Buyer
-- ----------------------------
CREATE TRIGGER "triger1" BEFORE INSERT OR UPDATE OR DELETE ON "public"."Buyer"
FOR EACH ROW
EXECUTE PROCEDURE "public"."change_trigger"();

-- ----------------------------
-- Primary Key structure for table Buyer
-- ----------------------------
ALTER TABLE "public"."Buyer" ADD CONSTRAINT "Buyer_pkey" PRIMARY KEY ("id_buyer");

-- ----------------------------
-- Triggers structure for table Product
-- ----------------------------
CREATE TRIGGER "triger5" BEFORE INSERT OR UPDATE OR DELETE ON "public"."Product"
FOR EACH ROW
EXECUTE PROCEDURE "public"."change_trigger"();

-- ----------------------------
-- Primary Key structure for table Product
-- ----------------------------
ALTER TABLE "public"."Product" ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("id_product");

-- ----------------------------
-- Triggers structure for table ProvidedProduct
-- ----------------------------
CREATE TRIGGER "triger6" BEFORE INSERT OR UPDATE OR DELETE ON "public"."ProvidedProduct"
FOR EACH ROW
EXECUTE PROCEDURE "public"."change_trigger"();

-- ----------------------------
-- Primary Key structure for table ProvidedProduct
-- ----------------------------
ALTER TABLE "public"."ProvidedProduct" ADD CONSTRAINT "ProvidedProduct_pkey" PRIMARY KEY ("id_provided");

-- ----------------------------
-- Triggers structure for table Sale
-- ----------------------------
CREATE TRIGGER "triger4" BEFORE INSERT OR UPDATE OR DELETE ON "public"."Sale"
FOR EACH ROW
EXECUTE PROCEDURE "public"."change_trigger"();

-- ----------------------------
-- Primary Key structure for table Sale
-- ----------------------------
ALTER TABLE "public"."Sale" ADD CONSTRAINT "Sale_pkey" PRIMARY KEY ("id_sale");

-- ----------------------------
-- Triggers structure for table SalesData
-- ----------------------------
CREATE TRIGGER "triger3" BEFORE INSERT OR UPDATE OR DELETE ON "public"."SalesData"
FOR EACH ROW
EXECUTE PROCEDURE "public"."change_trigger"();

-- ----------------------------
-- Primary Key structure for table SalesData
-- ----------------------------
ALTER TABLE "public"."SalesData" ADD CONSTRAINT "SalesData_pkey" PRIMARY KEY ("id_sales_data");

-- ----------------------------
-- Triggers structure for table SalesPoint
-- ----------------------------
CREATE TRIGGER "triger2" BEFORE INSERT OR UPDATE OR DELETE ON "public"."SalesPoint"
FOR EACH ROW
EXECUTE PROCEDURE "public"."change_trigger"();

-- ----------------------------
-- Primary Key structure for table SalesPoint
-- ----------------------------
ALTER TABLE "public"."SalesPoint" ADD CONSTRAINT "SalesPoint_pkey" PRIMARY KEY ("id_sales_point");

-- ----------------------------
-- Foreign Keys structure for table ProvidedProduct
-- ----------------------------
ALTER TABLE "public"."ProvidedProduct" ADD CONSTRAINT "ProvidedProduct_id_product_fkey" FOREIGN KEY ("id_product") REFERENCES "public"."Product" ("id_product") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Sale
-- ----------------------------
ALTER TABLE "public"."Sale" ADD CONSTRAINT "Sale_id_buyer_fkey" FOREIGN KEY ("id_buyer") REFERENCES "public"."Buyer" ("id_buyer") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."Sale" ADD CONSTRAINT "Sale_id_sales_data_fkey" FOREIGN KEY ("id_sales_data") REFERENCES "public"."SalesData" ("id_sales_data") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."Sale" ADD CONSTRAINT "Sale_id_sales_point_fkey" FOREIGN KEY ("id_sales_point") REFERENCES "public"."SalesPoint" ("id_sales_point") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table SalesData
-- ----------------------------
ALTER TABLE "public"."SalesData" ADD CONSTRAINT "SalesData_id_product_fkey" FOREIGN KEY ("id_product") REFERENCES "public"."Product" ("id_product") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table SalesPoint
-- ----------------------------
ALTER TABLE "public"."SalesPoint" ADD CONSTRAINT "SalesPoint_id_provided_fkey" FOREIGN KEY ("id_provided") REFERENCES "public"."ProvidedProduct" ("id_provided") ON DELETE CASCADE ON UPDATE CASCADE;
