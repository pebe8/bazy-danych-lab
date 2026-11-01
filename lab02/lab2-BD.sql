-- Pokoje
CREATE TABLE pokoje (
    id              SERIAL PRIMARY KEY,
    numer_pokoju    INTEGER NOT NULL UNIQUE,
    typ             VARCHAR(60) NOT NULL,
    z_balkonem      BOOLEAN DEFAULT TRUE,
    widok_na_morze  BOOLEAN DEFAULT FALSE,
    cena_za_noc     NUMERIC(6,2) NOT NULL,
    dostepny        BOOLEAN DEFAULT TRUE
);

-- Rezerwacje
CREATE TABLE rezerwacje (
    id              SERIAL PRIMARY KEY,
    imie_goscia     VARCHAR(50) NOT NULL,
    nazwisko_goscia VARCHAR(50) NOT NULL,
    pokoj_id        INTEGER REFERENCES pokoje(id),
    data_przyjazdu  DATE NOT NULL,
    data_wyjazdu    DATE NOT NULL,
    liczba_gosci    INTEGER DEFAULT 1
);

-- Dane: pokoje
INSERT INTO pokoje (numer_pokoju, typ, z_balkonem, widok_na_morze, cena_za_noc, dostepny) VALUES
    (101, 'Jednoosobowy Comfort', FALSE, TRUE,  280.00, TRUE),
    (102, 'Dwuosobowy Standard',  TRUE,  FALSE, 350.00, FALSE),
    (103, 'Dwuosobowy Standard',  FALSE, FALSE, 320.00, TRUE),
    (104, 'Apartament Deluxe',   TRUE,  TRUE,  850.00, FALSE),
    (201, 'Jednoosobowy Comfort', FALSE, FALSE, 260.00, TRUE),
    (202, 'Dwuosobowy Deluxe',    TRUE,  TRUE,  520.00, TRUE),
    (203, 'Dwuosobowy Deluxe',    TRUE,  FALSE, 480.00, FALSE),
    (204, 'Apartament Deluxe',   TRUE,  TRUE,  950.00, TRUE),
    (301, 'Junior Suite',        TRUE,  TRUE,  620.00, TRUE),
    (302, 'Junior Suite',        FALSE, FALSE, 580.00, FALSE);

-- Dane: rezerwacje
INSERT INTO rezerwacje (imie_goscia, nazwisko_goscia, pokoj_id, data_przyjazdu, data_wyjazdu, liczba_gosci) VALUES
    ('Jan', 'Kowalski', 2, '2026-10-01', '2026-10-07', 2),
    ('Anna', 'Nowak', 4, '2026-10-10', '2026-10-17', 4),
    ('Piotr', 'Wiśniewski', 7, '2026-10-20', '2026-10-27', 2),
    ('Maria', 'Wójcik', 10, '2026-11-01', '2026-11-08', 3),
    ('Krzysztof', 'Kowalczyk', 1, '2026-11-10', '2026-11-15', 1),
    ('Agnieszka', 'Kamińska', 3, '2026-11-18', '2026-11-25', 2),
    ('Tomasz', 'Lewandowski', 5, '2026-12-01', '2026-12-06', 1),
    ('Ewa', 'Zielińska', 6, '2026-12-10', '2026-12-17', 2),
    ('Michał', 'Szymański', 8, '2026-12-20', '2026-12-27', 2),
    ('Karolina', 'Dąbrowska', 9, '2026-12-28', '2026-12-31', 3);

SELECT * FROM pokoje;
SELECT * FROM rezerwacje;