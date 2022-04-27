/*
  Warnings:

  - Added the required column `password` to the `Restaurant` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Restaurant" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL
);
INSERT INTO "new_Restaurant" ("email", "id", "name") SELECT "email", "id", "name" FROM "Restaurant";
DROP TABLE "Restaurant";
ALTER TABLE "new_Restaurant" RENAME TO "Restaurant";
CREATE UNIQUE INDEX "Restaurant_email_key" ON "Restaurant"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
