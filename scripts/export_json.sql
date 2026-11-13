SELECT json_agg(row_to_json(t) ORDER BY t.prezime)
FROM (
  SELECT i.*,
    (SELECT COALESCE(json_agg(json_build_object('ime', k.ime, 'grad', g.naziv)), '[]'::json)
     FROM igrac_klub ik
     JOIN klubovi k ON k.ime = ik.ime_kluba
     LEFT JOIN gradovi g ON g.id = k.grad_id
     WHERE ik.prezime = i.prezime AND k.ime <> '-') AS prethodni_klubovi
  FROM igraci i
) t;