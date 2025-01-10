-- Exercici 1: Afegir una columna a la taula Jugadors per emmagatzemar el país del jugador.
ALTER TABLE jugador ADD COLUMN pais VARCHAR(50);

-- Exercici 2: Eliminar la columna nivell de la taula Jugadors.
ALTER TABLE jugador DROP COLUMN nivell;

-- Exercici 3: Canviar el tipus de dades de la columna preu de la taula Jocs per augmentar la precisió.
ALTER TABLE jocs MODIFY COLUMN preu DECIMAL(6,3);

-- Exercici 4: Afegir una columna estat a la taula Tornejos amb valors (Programat, obert, en competició, tancat) i que per defecte sigui 'Obert'.
ALTER TABLE tornejos ADD COLUMN estat ENUM('Programat', 'obert', 'en competició', 'tancat') DEFAULT 'obert';

-- Exercici 5: Eliminar la taula Configuració completament.
DROP TABLE configuracio;

-- Exercici 6: Afegir una restricció UNIQUE a la columna nom de la taula Jocs.
ALTER TABLE jocs ADD CONSTRAINT unique_nom UNIQUE (nom);

-- Exercici 7: Eliminar la restricció CHECK a la columna premi de la taula Tornejos.
-- Abans hauria de posar: ALTER TABLE tornejos ADD CONSTRAINT check_premi CHECK (premi > 0);
ALTER TABLE tornejos DROP CONSTRAINT check_premi;

-- Exercici 8: Canviar el nom de la taula Jugadors_Recompenses a Historial_Recompenses.
RENAME TABLE jugadors_recompenses TO historial_recompenses;

-- Exercici 9: Canviar el nom de la columna hores_jugades a temps_jugat a la taula Partides.
ALTER TABLE partides CHANGE COLUMN hores_jugades temps_jugat INT;

-- Exercici 10: Afegir una columna descripcio a la taula Recompenses.
ALTER TABLE recompenses ADD COLUMN descripcio TEXT;

-- Exercici 11: Eliminar la columna configuracio_completa de la taula Configuracio.
ALTER TABLE configuracio DROP COLUMN configuracio_completa;

-- Exercici 12: Modificar la columna categoria de la taula Jocs per incloure una nova categoria 'Educatiu'.
ALTER TABLE jocs MODIFY COLUMN categoria ENUM('accio', 'aventura', 'esports', 'estrategia', 'simulacio', 'rol', 'educatiu');

-- Exercici 13: Afegir una columna nivell_partida a la taula Partides per emmagatzemar la dificultat seleccionada pel jugador.
ALTER TABLE partides ADD COLUMN nivell_partida ENUM('facil', 'normal', 'dificil', 'molt dificil', 'maxim');

-- Exercici 14: Eliminar la taula Amistats completament.
DROP TABLE amistats;

-- Exercici 15: Afegir una columna equip a la taula Jugadors_Tornejos per identificar a quin equip pertany el jugador en el torneig.
ALTER TABLE jugadors_tornejos ADD COLUMN equip VARCHAR(50);

-- Exercici 16: Eliminar la restricció UNIQUE de la columna correu_electronic de la taula Jugadors.
-- Abans hauria de posar: ALTER TABLE jugador ADD CONSTRAINT unique_correu_electronic UNIQUE (correu_electronic);
ALTER TABLE jugador DROP INDEX unique_correu_electronic;

-- Exercici 17: Afegir una columna data_creacio a la taula Nivells per emmagatzemar quan es va crear el nivell.
ALTER TABLE nivells ADD COLUMN data_creacio DATE;

-- Exercici 18: Afegir una restricció NOT NULL a la columna data_partida de la taula Partides.
ALTER TABLE partides MODIFY COLUMN data_partida DATE NOT NULL;

-- Exercici 19: Canviar el nom de la taula Jugadors a Usuaris per reflectir un nom més genèric.
RENAME TABLE jugador TO usuaris;

-- Exercici 20: Afegir una columna data_creacio a la taula Comentaris per registrar la data en què es va fer el comentari, amb el valor per defecte la data actual.
ALTER TABLE comentaris ADD COLUMN data_creacio DATE;
