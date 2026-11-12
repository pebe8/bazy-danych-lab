-- LAB0
-- Baza danych: sklep
-- Zadanie 1: Nazwy i ceny wszystkich produktów droższych niż 200 zł, posortowane malejąco po cenie
SELECT nazwa, cena
FROM produkty
WHERE cena > 200
ORDER BY cena DESC;

-- Zadanie 2: Imię, nazwisko i miasto klientów z Wrocławia lub Poznania
SELECT imie, nazwisko, miasto
FROM klienci
WHERE miasto IN ('Wrocław', 'Poznań');

-- Zadanie 3: 10 najtańszych produktów (nazwa, cena)
SELECT nazwa, cena
FROM produkty
ORDER BY cena ASC
LIMIT 10;

-- Zadanie 4: Zamówienia o statusie 'anulowane', posortowane po dacie zamówienia (najnowsze pierwsze)
SELECT *
FROM zamowienia
WHERE status = 'anulowane'
ORDER BY data_zamowienia DESC;

-- Zadanie 5: Produkty, których nazwa zaczyna się na literę „P”
SELECT *
FROM produkty
WHERE nazwa LIKE 'P%';

-- Zadanie 6: Produkty o niskim stanie magazynowym (ilosc_magazyn < 5)
SELECT *
FROM produkty
WHERE ilosc_magazyn < 5;

-- Zadanie 7: Klienci zarejestrowani w ciągu ostatnich 500 dni
SELECT *
FROM klienci
WHERE data_rejestracji > CURRENT_DATE - INTERVAL '500 days';

-- Zadanie 8: 5 najdroższych i 5 najtańszych produktów w jednym zestawieniu
(SELECT nazwa, cena FROM produkty ORDER BY cena DESC LIMIT 5)
UNION ALL
(SELECT nazwa, cena FROM produkty ORDER BY cena ASC LIMIT 5);

-- Zadanie 9: Produkty dodane w ciągu ostatnich 30 dni
SELECT *
FROM produkty
WHERE data_dodania >= CURRENT_DATE - INTERVAL '30 days';

-- Zadanie 10: Lista unikalnych miast, w których mieszkają klienci
SELECT DISTINCT miasto
FROM klienci;

-- Zadanie 11: Nazwiska klientów zapisane wielkimi literami obok oryginalnej wersji
SELECT nazwisko AS oryginalne_nazwisko, UPPER(nazwisko) AS nazwisko_wielkimi
FROM klienci;


-- Zadanie 12: Produkty z ceną po zaokrągleniu w przedziale 90-110 zł
SELECT nazwa, cena, ROUND(cena) AS cena_zakraglona
FROM produkty
WHERE ROUND(cena) BETWEEN 90 AND 110;

-- Zadanie 13: Klienci z nazwiskiem kończącym się na „ski” LUB imieniem zaczynającym się na „A”
SELECT *
FROM klienci
WHERE nazwisko LIKE '%ski' OR imie LIKE'A%';

-- Zadanie 14: 5 zamówień złożonych najwcześniej (najstarsze daty)
SELECT *
FROM zamowienia
ORDER BY data_zamowienia ASC
LIMIT 5;

-- Zadanie 15: Produkty z ceną NIEmieszczącą się w przedziale 100-300 zł
SELECT nazwa, cena
FROM produkty
WHERE cena NOT BETWEEN 100 AND 300;

-- Zadanie 16: Nazwa i liczba dni od dodania każdego produktu do dziś (posortowane malejąco)
SELECT nazwa, (CURRENT_DATE - data_dodania) AS dni_od_dodania
FROM produkty
ORDER BY dni_od_dodania DESC;