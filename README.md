# igraci-nogometnog-kluba-dinamo

Otvoreni skup podataka o 11 igrača Građanskog nogometnog kluba Dinamo Zagreb. Sadrži osnovne podatke o igračima, statistiku nastupa i golova te klubove u kojima su igrači ranije igrali. Izrađen je za 1. laboratorijsku vježbu iz predmeta Otvoreno računarstvo (FER, Zagreb).

## Licenca
Korištena je CC0 1.0 Universal licenca (Creative Commons, javno vlasništvo), jer su podaci prikupljeni vlastitim istraživanjem i ne želim ograničavati njihovu uporabu.

## Autor
Josip Duvančić

## Verzija podataka
2.0

## Jezik podataka
hrvatski

## Tema
igrači nogometnog kluba Dinamo

## Ključne riječi
nogomet, nogometni igrači, Dinamo

## Izvor podataka
https://gnkdinamo.hr/hr/momcad

## Formati i datoteke
- `data/igraci_dinama.csv` – igrač se ponavlja za svaki raniji klub
- `data/igraci_dinama.json` – raniji klubovi su ugniježđeno polje
- `data/igraci_dinama.sql` – dump baze (PostgreSQL)
- `schema.json` – metapodaci o strukturi JSON datoteke u obliku JSON Schema (draft-07)
- `index.html` – početna stranica s metapodacima i poveznicama za preuzimanje
- `datatable.html` – tablica s obrascem za filtriranje i preuzimanjem prikaza u CSV i JSON obliku
- `backend/` – pozadinski kôd (Node.js, Express, PostgreSQL)
- `js/`, `css/` – klijentski kôd
- `scripts/` – skripte za migraciju i automatizirani izvoz iz baze

Kodiranje znakova: UTF-8.

## Atributi
| Atribut | Opis |
|---|---|
| ime | Ime igrača |
| prezime | Prezime igrača |
| broj | Broj na dresu |
| pozicija | Pozicija na terenu |
| datum_rodenja | Datum rođenja (GGGG-MM-DD) |
| mjesto_rodenja | Mjesto rođenja |
| visina | Visina u cm |
| broj_nastupa | Ukupan broj nastupa |
| broj_golova | Ukupan broj golova |
| prethodni_klub | (CSV) Klub u kojem je igrač ranije igrao |
| grad_kluba | (CSV) Grad prethodnog kluba |
| prethodni_klubovi | (JSON) Polje objekata s ključevima `ime` i `grad` |

## Struktura baze podataka
Baza je u PostgreSQL-u i sastoji se od tablica `igraci`, `klubovi`, `gradovi` i `igrac_klub` (veza igrača i ranijih klubova). Gradovi su izdvojeni u zasebnu tablicu, a klub na grad upućuje stranim ključem `grad_id`, kako bi se gradovi mogli povezivati s drugim skupovima podataka.

## Frekvencija ažuriranja podataka
jednokratno

## Datum kada su izvedeni osnovni podaci
27.10.2024.

## Datum zadnje izmjene baze
13.11.2026.

## Pokretanje web sučelja
1. Učitajte dump `data/igraci_dinama.sql` u PostgreSQL bazu `igraci_dinama` (ako baza još nema tablicu `gradovi`, pokrenite `scripts/migracija.sql`).
2. U mapi `backend/` kopirajte `.env.example` u `.env` i upišite podatke za spajanje na bazu.
3. U mapi `backend/` pokrenite `npm install`, a zatim `npm start`.
4. Otvorite http://localhost:3000.

Filtrirani podaci dostupni su i izravno: `/api/igraci?q=zagreb&polje=sva` (JSON), `/api/igraci.csv?...` i `/api/igraci.json?...` (preuzimanje). Dopuštene vrijednosti parametra `polje`: `sva`, `ime`, `prezime`, `broj`, `pozicija`, `datum_rodenja`, `mjesto_rodenja`, `visina`, `broj_nastupa`, `broj_golova`, `prethodni_klub`, `grad_kluba`.