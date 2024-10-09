-- Looge User tabel
CREATE TABLE "User" (
    "id" SERIAL PRIMARY KEY,
    "email" VARCHAR(255) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" VARCHAR(50) NOT NULL
);

-- Looge Profile tabel
CREATE TABLE "Profile" (
    "id" SERIAL PRIMARY KEY,
    "bio" TEXT,
    "userId" INT UNIQUE,
    FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE
);

-- Looge Customer tabel
CREATE TABLE "Customer" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) UNIQUE NOT NULL,
    "phone" VARCHAR(50),
    "userId" INT,
    FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL
);

-- Looge Treatment tabel
CREATE TABLE "Treatment" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT
);

-- Looge Feedback tabel
CREATE TABLE "Feedback" (
    "id" SERIAL PRIMARY KEY,
    "comment" TEXT NOT NULL,
    "rating" INT NOT NULL,
    "customerId" INT,
    FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE
);

-- Looge LoyaltyPoint tabel
CREATE TABLE "LoyaltyPoint" (
    "id" SERIAL PRIMARY KEY,
    "points" INT NOT NULL,
    "customerId" INT,
    FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE
);