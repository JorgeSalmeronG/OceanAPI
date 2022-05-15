-- CreateTable
CREATE TABLE "explorer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "mission" VARCHAR(255) NOT NULL,
    "azureCertification" BOOLEAN NOT NULL DEFAULT false,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "explorer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "student" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lang" VARCHAR(50) NOT NULL,
    "missionCommander" VARCHAR(50) NOT NULL,
    "enrollments" INTEGER,
    "hasCertification" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "missionCommander" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "mainStack" VARCHAR(50) NOT NULL,
    "currentEnrollment" BOOLEAN NOT NULL DEFAULT false,
    "hasAzureCertification" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "missionCommander_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sitios_prioritarios" (
    "id" SERIAL NOT NULL,
    "sitio_prioritario" VARCHAR(255) NOT NULL,
    "perimetro" DOUBLE PRECISION,
    "area_hectareas" DOUBLE PRECISION,
    "ecorregion" VARCHAR(255) NOT NULL,
    "fisiografia" VARCHAR(255) NOT NULL,
    "formas_emergentes" VARCHAR(255) NOT NULL,
    "formas_sumergidas" VARCHAR(255) NOT NULL,
    "habitat" VARCHAR(255) NOT NULL,
    "importancia" VARCHAR(255) NOT NULL,

    CONSTRAINT "sitios_prioritarios_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "explorer_name_key" ON "explorer"("name");

-- CreateIndex
CREATE UNIQUE INDEX "student_name_key" ON "student"("name");

-- CreateIndex
CREATE UNIQUE INDEX "missionCommander_name_key" ON "missionCommander"("name");
