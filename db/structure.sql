CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "identities" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "uid" varchar, "provider" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar, "last_name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar);
CREATE TABLE IF NOT EXISTS "accomplishments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "title" varchar, "effect" varchar, "date_time" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "day" varchar);
CREATE TABLE IF NOT EXISTS "days" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "day_accomplishments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "day_id" integer, "accomplishment_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20180528021607'),
('20180528022256'),
('20180528162134'),
('20180528234043'),
('20180528234146'),
('20180601032456'),
('20180601193441');


