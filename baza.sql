-- Utwórz bazę danych
CREATE DATABASE IF NOT EXISTS kino_db;
USE kino_db;

-- Tabela użytkowników
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela filmów
CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela zamówień/biletów
CREATE TABLE tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Wstaw przykładowe filmy
INSERT INTO movies (title, description, price, image_url) VALUES
('Avengers: Koniec Gry', 'Fantastyczny film akcji z superbohaterami Marvela. Ostatnia bitwa o przyszłość wszechświata.', 25.00, 'https://via.placeholder.com/400x300/007bff/ffffff?text=Avengers'),
('Avatar: Istota Wody', 'Kontynuacja epickiej opowieści z planety Pandora. Niesamowite efekty wizualne i poruszająca historia.', 28.00, 'https://via.placeholder.com/400x300/dc3545/ffffff?text=Avatar'),
('John Wick 4', 'Kolejna odsłona przygód legendarnego zabójcy Johna Wicka. Pełna akcji i niesamowitych scen walki.', 23.00, 'https://via.placeholder.com/400x300/28a745/ffffff?text=John+Wick'),
('Oppenheimer', 'Historia życia J. Roberta Oppenheimera i jego roli w stworzeniu bomby atomowej.', 26.00, 'https://via.placeholder.com/400x300/ffc107/000000?text=Oppenheimer');

-- Wstaw przykładowego użytkownika (hasło: admin123)
INSERT INTO users (firstname, lastname, email, password, phone) VALUES
('Admin', 'Kino', 'admin@kino.pl', 'admin123', '123-456-789');

-- Sprawdź czy dane zostały poprawnie wstawione
SELECT * FROM users;
SELECT * FROM movies;