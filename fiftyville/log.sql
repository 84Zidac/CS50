-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT description FROM crime_scene_reports WHERE month = 7 AND day = 28 AND street = "Humphrey Street";
| Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. |

 .schema bakery_security_logs


.schema interviews

SELECT name, transcript FROM interviews WHERE month = 7 AND day = 28 AND transcript LIKE "%bakery%";

| Ruth    | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
| Eugene  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
| Raymond | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |

SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit';
+---------------+
| license_plate |
+---------------+
| 5P2BI95       |
| 94KL13X       |
| 6P58WS2       |
| 4328GD8       |
| G412CB7       |
| L93JTIZ       |
| 322W7JE       |
| 0NTHK55       |
+---------------+

SELECT * FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit');

+--------+---------+----------------+-----------------+---------------+
|   id   |  name   |  phone_number  | passport_number | license_plate |
+--------+---------+----------------+-----------------+---------------+
| 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
| 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
| 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
| 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
| 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
| 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
| 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
| 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
+--------+---------+----------------+-----------------+---------------+


SELECT * FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit'));

+----------------+
|     caller     |
+----------------+
| (130) 555-0289 |
| (499) 555-9472 |
| (367) 555-5533 |
| (770) 555-1861 |
+----------------+


SELECT * FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit')));

+--------+--------+----------------+-----------------+---------------+
|   id   |  name  |  phone_number  | passport_number | license_plate |
+--------+--------+----------------+-----------------+---------------+
| 398010 | Sofia  | (130) 555-0289 | 1695452385      | G412CB7       |
| 514354 | Diana  | (770) 555-1861 | 3592750733      | 322W7JE       |
| 560886 | Kelsey | (499) 555-9472 | 8294398571      | 0NTHK55       |
| 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
+--------+--------+----------------+-----------------+---------------+

SELECT * FROM bank_accounts WHERE bank_accounts.person_id IN
(SELECT id FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit'))));

+----------------+-----------+---------------+
| account_number | person_id | creation_year |
+----------------+-----------+---------------+
| 49610011       | 686048    | 2010          |
| 26013199       | 514354    | 2012          |
+----------------+-----------+---------------+

SELECT * FROM atm_transactions WHERE year = 2021 AND month = 7 AND day = 28 AND transaction_type = "withdraw" AND atm_location = "Leggett Street" AND atm_transactions.account_number IN
(SELECT account_number FROM bank_accounts WHERE bank_accounts.person_id IN
(SELECT id FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit')))));

+-----+----------------+------+-------+-----+----------------+------------------+--------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     |
| 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     |
+-----+----------------+------+-------+-----+----------------+------------------+--------+


SELECT * FROM people WHERE people.id IN
(SELECT person_id FROM bank_accounts WHERE bank_accounts.person_id IN
(SELECT id FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit')))));

+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 514354 | Diana | (770) 555-1861 | 3592750733      | 322W7JE       |
| 686048 | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       |
+--------+-------+----------------+-----------------+---------------+

SELECT * FROM passengers WHERE passengers.passport_number IN
(SELECT passport_number FROM people WHERE people.id IN
(SELECT person_id FROM bank_accounts WHERE bank_accounts.person_id IN
(SELECT id FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit'))))));

+-----------+-----------------+------+
| flight_id | passport_number | seat |
+-----------+-----------------+------+
| 18        | 3592750733      | 4C   |
| 24        | 3592750733      | 2C   |
| 36        | 5773159633      | 4A   |
| 54        | 3592750733      | 6C   |
+-----------+-----------------+------+


SELECT * FROM flights WHERE year = 2021 AND month = 7 AND day = 29 AND flights.id IN
(SELECT flight_id FROM passengers WHERE passengers.passport_number IN
(SELECT passport_number FROM people WHERE people.id IN
(SELECT person_id FROM bank_accounts WHERE bank_accounts.person_id IN
(SELECT id FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit'))))))) ORDER BY hour LIMIT 1;

----+-------------------+------------------------+------+-------+-----+------+--------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+----+-------------------+------------------------+------+-------+-----+------+--------+
| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
+----+-------------------+------------------------+------+-------+-----+------+--------+




SELECT * FROM airports WHERE airports.id IN
(SELECT origin_airport_id FROM flights WHERE year = 2021 AND month = 7 AND day = 29 AND flights.id IN
(SELECT flight_id FROM passengers WHERE passengers.passport_number IN
(SELECT passport_number FROM people WHERE people.id IN
(SELECT person_id FROM bank_accounts WHERE bank_accounts.person_id IN
(SELECT id FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit'))))))) ORDER BY hour LIMIT 1);

+----+--------------+-------------------+---------------+
| id | abbreviation |     full_name     |     city      |
+----+--------------+-------------------+---------------+
| 4  | LGA          | LaGuardia Airport | New York City |
+----+--------------+-------------------+---------------+


SELECT * FROM airports WHERE airports.id IN
(SELECT origin_airport_id FROM flights WHERE year = 2021 AND month = 7 AND day = 29 AND flights.id IN
(SELECT flight_id FROM passengers WHERE passengers.passport_number IN
(SELECT passport_number FROM people WHERE people.id IN
(SELECT person_id FROM bank_accounts WHERE bank_accounts.person_id IN
(SELECT id FROM people WHERE people.phone_number IN
(SELECT DISTINCT(caller) FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit'))))))) ORDER BY hour LIMIT 1);
+----+--------------+-----------------------------+------------+
| id | abbreviation |          full_name          |    city    |
+----+--------------+-----------------------------+------------+
| 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
+----+--------------+-----------------------------+------------+



SELECT * FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60 AND phone_calls.caller IN
(SELECT phone_number FROM people WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15 AND activity = 'exit'));

+-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 221 | (130) 555-0289 | (996) 555-8899 | 2021 | 7     | 28  | 51       |
| 224 | (499) 555-9472 | (892) 555-8872 | 2021 | 7     | 28  | 36       |
| 233 | (367) 555-5533 | (375) 555-8161 | 2021 | 7     | 28  | 45       |
| 251 | (499) 555-9472 | (717) 555-1342 | 2021 | 7     | 28  | 50       |
| 255 | (770) 555-1861 | (725) 555-3243 | 2021 | 7     | 28  | 49       |
+-----+----------------+----------------+------+-------+-----+----------+

SELECT name FROM people WHERE phone_number = "(375) 555-8161";
