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

 Date: 18/02/2022 23:44:41
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
