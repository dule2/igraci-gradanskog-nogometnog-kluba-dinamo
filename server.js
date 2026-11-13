const express = require('express');
const { Pool, types  } = require('pg');
const cors = require('cors');
const path = require('path');

types.setTypeParser(1082, v => v);

const app = express();
const port = 3000;

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'igraci_dinama',
    password: process.env.PGPASSWORD,
    port: 5434,
});

app.use(cors());

app.use(express.static(__dirname));

app.get('/players', async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT 
                igraci.ime, 
                igraci.prezime, 
                igraci.broj, 
                igraci.pozicija, 
                igraci.datum_rodenja, 
                igraci.mjesto_rodenja, 
                igraci.visina, 
                igraci.broj_nastupa, 
                igraci.broj_golova, 
                STRING_AGG(igrac_klub.ime_kluba || ' (' || COALESCE(gradovi.naziv, '-') || ')', ', ') AS klubovi
            FROM igraci
            JOIN igrac_klub ON igraci.prezime = igrac_klub.prezime
            JOIN klubovi ON igrac_klub.ime_kluba = klubovi.ime
            LEFT JOIN gradovi ON klubovi.grad_id = gradovi.id
            GROUP BY igraci.ime, igraci.prezime, igraci.broj, igraci.pozicija, igraci.datum_rodenja, igraci.mjesto_rodenja, igraci.visina, igraci.broj_nastupa, igraci.broj_golova
        `);
        res.json({ data: result.rows });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error retrieving data from database');
    }
});


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});


