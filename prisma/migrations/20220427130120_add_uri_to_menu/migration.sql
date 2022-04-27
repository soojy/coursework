/*
  Warnings:

  - Added the required column `uri` to the `Menu` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Menu" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "restaurantId" INTEGER NOT NULL,
    "uri" TEXT NOT NULL,
    CONSTRAINT "Menu_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Menu" ("id", "published", "restaurantId", "title") SELECT "id", "published", "restaurantId", "title" FROM "Menu";
DROP TABLE "Menu";
ALTER TABLE "new_Menu" RENAME TO "Menu";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
