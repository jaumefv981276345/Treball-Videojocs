CREATE DATABASE IF NOT EXISTS videojocs;
USE videojocs;

CREATE TABLE jocs (
    id_joc INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    categoria ENUM('accio', 'aventura', 'esports', 'estrategia', 'simulacio', 'rol'),
    data_estrena DATE,
    preu DECIMAL(5,2),
    pegi ENUM('3', '7', '12', '16', '18')
);

CREATE TABLE nivells (
    id_nivell INT AUTO_INCREMENT PRIMARY KEY,
    id_joc INT,
    nom_nivell VARCHAR(50),
    dificultat ENUM('facil', 'normal', 'dificil', 'muy dificil', 'maximo'),
    FOREIGN KEY (id_joc) REFERENCES jocs(id_joc)
);

CREATE TABLE jugador (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    correu_electronic VARCHAR(100),
    data_naixement DATE,
    nivell INT,
    punts_experiencia INT
);

CREATE TABLE comentaris (
    id_comentari INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT,
    id_joc INT,
    text_comentari TEXT,
    data_comentari DATE,
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_joc) REFERENCES jocs(id_joc)
);

CREATE TABLE partides (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT,
    id_joc INT,
    hores_jugades INT,
    data_partida DATE,
    puntuacio INT,
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_joc) REFERENCES jocs(id_joc)
);

CREATE TABLE tornejos (
    id_torneig INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    premi DECIMAL(10,2),
    data_inici DATE,
    data_fi DATE
);

CREATE TABLE jugadors_tornejos (
    id_jugador INT,
    id_torneig INT,
    posicio INT,
    PRIMARY KEY (id_jugador, id_torneig),
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_torneig) REFERENCES tornejos(id_torneig)
);

CREATE TABLE configuracio (
    id_configuracio INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT,
    volum_so INT,
    resolucio VARCHAR(20),
    mode_fosc TINYINT(1),
    configuracio_completa TINYINT(1),
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador)
);

CREATE TABLE amistats (
    id_amistat INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador1 INT,
    id_jugador2 INT,
    data_amistad DATE,
    FOREIGN KEY (id_jugador1) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_jugador2) REFERENCES jugador(id_jugador)
);

CREATE TABLE recompenses (
    id_recompensa INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    tipus SET('bronze', 'plata', 'or', 'platinum'),
    valor DECIMAL(6,2)
);

CREATE TABLE jugadors_recompenses (
    id_jugador INT,
    id_recompensa INT,
    data_obtencio DATE,
    PRIMARY KEY (id_jugador, id_recompensa),
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_recompensa) REFERENCES recompenses(id_recompensa)
);