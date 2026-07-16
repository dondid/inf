-- SUBIECTUL II (2 puncte) - 2026
-- Baza de date: Magazin
-- Tabela: Magazin

-- Crearea tabelei cu structura corespunzătoare:
-- idProdus (Numeric, 5), Denumire (Text, 50), Cantitate (Numeric, 5), Pret (Numeric, 5, 2), Data_expir (Date)
-- Notă: În SGBD-urile moderne, tipurile corespunzătoare sunt INT, VARCHAR(50), INT, DECIMAL(5,2), DATE.

CREATE TABLE Magazin (
    idProdus INT PRIMARY KEY,
    Denumire VARCHAR(50) NOT NULL,
    Cantitate INT,
    Pret DECIMAL(5,2),
    Data_expir DATE
);

-- Inserarea a minim 4 înregistrări în tabelă:
INSERT INTO Magazin (idProdus, Denumire, Cantitate, Pret, Data_expir) VALUES
(20001, 'Lapte Proaspat 1.5%', 20, 7.50, '2026-07-25'),  -- Pret <= 35
(20002, 'Ulei de Masline Extra Virgin', 15, 45.00, '2027-06-30'), -- Pret > 35 (se va afisa)
(20003, 'Ceaun de Fonta', 5, 120.00, '2030-01-01'),        -- Pret > 35 (se va afisa)
(20004, 'Paine Integral', 50, 4.20, '2026-07-18'),        -- Pret <= 35
(20005, 'Cafea Arabica Premium 500g', 12, 38.50, '2027-03-15'); -- Pret > 35 (se va afisa)

-- Interogare pentru afișarea alfabetică a tuturor produselor cu prețul mai mare decât 35:
SELECT idProdus, Denumire, Cantitate, Pret, Data_expir
FROM Magazin
WHERE Pret > 35.00
ORDER BY Denumire ASC;
