# igraci-nogometnog-kluba-dinamo

Otvoreni skup podataka o 11 igrača Građanskog nogometnog kluba Dinamo Zagreb. Sadrži osnovne podatke o igračima, statistiku nastupa i golova te klubove u kojima su igrači ranije igrali. Izrađen je za 1. laboratorijsku vježbu iz predmeta Otvoreno računarstvo (FER, Zagreb).

## Licenca
Korištena je CC0 1.0 Universal licenca (Creative Commons, javno vlasništvo), jer su podaci prikupljeni vlastitim istraživanjem i ne želim ograničavati njihovu uporabu.

## Autor
Josip Duvančić

## Verzija podataka
1.0

## Jezik podataka
hrvatski

## Tema
igrači nogometnog kluba Dinamo

## Ključne riječi
nogomet, nogometni igrači, Dinamo

## Izvor podataka
https://gnkdinamo.hr/hr/momcad

## Formati i datoteke
- `data/igraci_dinama.csv` - igrač se ponavlja za svaki prethodni klub
- `data/igraci_dinama.json` - prethodni klubovi su ugniježđeno polje
- `data/igraci_dinama.sql` - dump baze (PostgreSQL 15)
- `scripts/` - skripte za automatizirani izvoz iz baze

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

## Frekvencija ažuriranja podataka
jednokratno

## Datum kada su izvedeni osnovni podaci
27.10.2024.

## Datum zadnje izmjene baze
28.10.2026.