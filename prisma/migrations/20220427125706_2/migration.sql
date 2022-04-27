/*
  Warnings:

  - Added the required column `uri` to the `Picture` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Picture" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uri" TEXT NOT NULL,
    "itemId" INTEGER NOT NULL,
    CONSTRAINT "Picture_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Item" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Picture" ("id", "itemId") SELECT "id", "itemId" FROM "Picture";
DROP TABLE "Picture";
ALTER TABLE "new_Picture" RENAME TO "Picture";
CREATE UNIQUE INDEX "Picture_itemId_key" ON "Picture"("itemId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
