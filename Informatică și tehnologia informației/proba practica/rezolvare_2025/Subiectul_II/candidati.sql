-- SUBIECTUL II (2 puncte) - 2025
-- Baza de date: Candidati
-- Tabela: Candidati

-- Crearea tabelei cu structura corespunzătoare:
-- CodCandidat (Numeric, 5), NumePrenume (Text, 50), CNP (Text, 13), NotaPractica (Numeric, 2), NotaTeorie (Numeric, 2)
-- Notă: În sistemele SGBD (de ex. MySQL, PostgreSQL, Access), tipurile de date sunt reprezentate astfel:
-- INT pentru cod numeric (5 cifre), VARCHAR pentru text și DECIMAL(4,2) pentru note (grade cu zecimale, ex: 8.50 sau 10.00).

CREATE TABLE Candidati (
    CodCandidat INT PRIMARY KEY,
    NumePrenume VARCHAR(50) NOT NULL,
    CNP VARCHAR(13) NOT NULL UNIQUE,
    NotaPractica DECIMAL(4,2),
    NotaTeorie DECIMAL(4,2)
);

-- Inserarea a minim 5 înregistrări în tabelă:
INSERT INTO Candidati (CodCandidat, NumePrenume, CNP, NotaPractica, NotaTeorie) VALUES
(10001, 'Popescu Ionel', '1950812123456', 8.50, 9.20),  -- Corespunde criteriilor (> 7 la ambele)
(10002, 'Ionescu Maria', '2970514123456', 6.80, 8.00),  -- Nu corespunde (NotaPractica <= 7)
(10003, 'Vasilescu Radu', '1920320123456', 9.00, 7.50), -- Corespunde criteriilor (> 7 la ambele)
(10004, 'Georgescu Elena', '2941125123456', 7.10, 6.50),-- Nu corespunde (NotaTeorie <= 7)
(10005, 'Dumitru Vasile', '1890203123456', 9.50, 9.80);  -- Corespunde criteriilor (> 7 la ambele)

-- Interogare pentru afișarea numelui și notelor obținute de candidații care au obținut peste 7 la ambele probe,
-- în ordine alfabetică a numelui:
SELECT NumePrenume, NotaPractica, NotaTeorie
FROM Candidati
WHERE NotaPractica > 7.00 AND NotaTeorie > 7.00
ORDER BY NumePrenume ASC;
