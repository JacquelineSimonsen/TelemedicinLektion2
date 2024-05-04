/*
  Warnings:

  - You are about to drop the `Dairy` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Dairy" DROP CONSTRAINT "Dairy_authorId_fkey";

-- DropTable
DROP TABLE "Dairy";
