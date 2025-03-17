CREATE TABLE Categorias (
    IdCategoria INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(255) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE TiposArchivos (
    IdTipoArchivo INT AUTO_INCREMENT PRIMARY KEY,
    TipoArchivo VARCHAR(255) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE Usuarios (
    IdUsuario INT AUTO_INCREMENT PRIMARY KEY,
    CodigoUsuario VARCHAR(255) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    FechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    IdRol INT,
    Estado TINYINT(1) DEFAULT 1
);

CREATE TABLE Roles (
    IdRol INT AUTO_INCREMENT PRIMARY KEY,
    Rol VARCHAR(100) NOT NULL
);

CREATE TABLE Archivos (
    IdArchivo INT AUTO_INCREMENT PRIMARY KEY,
    NombreArchivo VARCHAR(255) NOT NULL,
    IdUsuario INT NOT NULL,
    FechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    IdTipoArchivo INT NOT NULL,
    Descripcion TEXT,
    IdCategoria INT NOT NULL,
    Imagen VARCHAR(255),
    RutaArchivo VARCHAR(255) NOT NULL,
    Estado TINYINT(1) DEFAULT 1,
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdTipoArchivo) REFERENCES TiposArchivos(IdTipoArchivo),
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria)
);

CREATE TABLE Comentarios (
    IdComentario INT AUTO_INCREMENT PRIMARY KEY,
    IdArchivo INT NOT NULL,
    IdUsuario INT NOT NULL,
    Comentario TEXT NOT NULL,
    Estado TINYINT(1) DEFAULT 1,
    FechaComentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdArchivo) REFERENCES Archivos(IdArchivo),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);

CREATE TABLE ArchivoLiked (
    IdLiked INT AUTO_INCREMENT PRIMARY KEY,
    IdArchivo INT NOT NULL,
    IdUsuario INT NOT NULL,
    FechaLiked DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdArchivo) REFERENCES Archivos(IdArchivo),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);

CREATE TABLE UsuarioFollow (
    IdFollow INT AUTO_INCREMENT PRIMARY KEY,
    IdUsuarioSeguidor INT NOT NULL,
    IdUsuarioPerfil INT NOT NULL,
    FechaFollow DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdUsuarioSeguidor) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdUsuarioPerfil) REFERENCES Usuarios(IdUsuario)
);

CREATE TABLE TipoSuscripción (
    IdTipoSuscripción INT AUTO_INCREMENT PRIMARY KEY,
    Suscripción VARCHAR(255) NOT NULL,
    Descripción TEXT,
    Precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Suscripción (
    IdSuscripción INT AUTO_INCREMENT PRIMARY KEY,
    IdUsuario INT NOT NULL,
    IdTipoSuscripción INT NOT NULL,
    Estado TINYINT(1) DEFAULT 1,
    FechaAlta DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdTipoSuscripción) REFERENCES TipoSuscripción(IdTipoSuscripción)
);

-- Inserción de Roles
INSERT INTO Roles (Rol) VALUES ('Administrador'), ('Usuario'), ('Moderador');

-- Inserción de Usuarios
INSERT INTO Usuarios (CodigoUsuario, Email, FechaAlta, IdRol, Estado) 
VALUES 
('user01', 'user01@example.com', NOW(), 2, 1),
('admin01', 'admin01@example.com', NOW(), 1, 1),
('mod01', 'mod01@example.com', NOW(), 3, 1);

-- Inserción de Categorías
INSERT INTO Categorias (Categoria, Descripcion) 
VALUES 
('Tecnología', 'Archivos relacionados con tecnología'),
('Arte', 'Archivos relacionados con arte'),
('Ciencia', 'Archivos relacionados con ciencia');

-- Inserción de Tipos de Archivos
INSERT INTO TiposArchivos (TipoArchivo, Descripcion) 
VALUES 
('PDF', 'Documento en formato PDF'),
('Imagen', 'Archivos de imágenes como JPG, PNG'),
('Video', 'Archivos de video en MP4, AVI');

-- Inserción de Archivos
INSERT INTO Archivos (NombreArchivo, IdUsuario, FechaAlta, IdTipoArchivo, Descripcion, IdCategoria, Imagen, RutaArchivo, Estado) 
VALUES 
('Manual de MySQL', 1, NOW(), 1, 'Documento sobre MySQL', 1, NULL, '/archivos/mysql.pdf', 1),
('Pintura Digital', 2, NOW(), 2, 'Imagen de arte digital', 2, '/imagenes/arte.png', '/archivos/arte.png', 1),
('Explicación de Física Cuántica', 3, NOW(), 1, 'Documento de ciencia avanzada', 3, NULL, '/archivos/cuantica.pdf', 1);

-- Inserción de Comentarios
INSERT INTO Comentarios (IdArchivo, IdUsuario, Comentario, Estado, FechaComentario) 
VALUES 
(1, 2, 'Excelente documento, me ha servido mucho.', 1, NOW()),
(2, 1, 'Muy buena imagen, gran calidad.', 1, NOW()),
(3, 3, 'Interesante contenido sobre física cuántica.', 1, NOW());

-- Inserción de Me gusta en Archivos
INSERT INTO ArchivoLiked (IdArchivo, IdUsuario, FechaLiked) 
VALUES 
(1, 2, NOW()),
(2, 1, NOW()),
(3, 3, NOW());

-- Inserción de Seguimiento de Usuarios
INSERT INTO UsuarioFollow (IdUsuarioSeguidor, IdUsuarioPerfil, FechaFollow) 
VALUES 
(1, 2, NOW()),
(2, 3, NOW()),
(3, 1, NOW());

-- Inserción de Tipos de Suscripción
INSERT INTO TipoSuscripción (Suscripción, Descripción, Precio) 
VALUES 
('Básica', 'Acceso limitado a ciertos archivos', 5.99),
('Premium', 'Acceso total a la plataforma', 15.99),
('VIP', 'Acceso total y beneficios exclusivos', 25.99);

-- Inserción de Suscripciones de Usuarios
INSERT INTO Suscripción (IdUsuario, IdTipoSuscripción, Estado, FechaAlta) 
VALUES 
(1, 2, 1, NOW()),
(2, 3, 1, NOW()),
(3, 1, 1, NOW());

