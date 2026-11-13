BEGIN;

CREATE TABLE gradovi (
    id SERIAL PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO gradovi (naziv)
SELECT DISTINCT TRIM(grad) FROM klubovi
WHERE grad IS NOT NULL AND TRIM(grad) <> '-'
ORDER BY 1;

ALTER TABLE klubovi ADD COLUMN grad_id INTEGER REFERENCES gradovi(id);

UPDATE klubovi k SET grad_id = g.id
FROM gradovi g WHERE TRIM(k.grad) = g.naziv;

ALTER TABLE klubovi DROP COLUMN grad;

COMMIT;