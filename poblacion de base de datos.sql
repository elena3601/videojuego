create database juego;

use  juego;

INSERT INTO juego.jugador(id_jugador, usuario, email, contrasenia)
VALUES (1,"Eder Ulises game", "eder@gmail.com", "12345678" ),
(2, "Elena", "elena@gmail.com", "12345678"),
(3, "Davis", "david@gmail.com", "12345678");

INSERT INTO juego.puntaje(id_puntaje, puntos)
VALUES (1, 100),
(2, 543),
(3, 548),
(4, 548),
(5,1034),
(6, 456),
(7, 435),
(8, 748),
(9, 643),
(10, 560),
(11, 023),
(12, 974),
(13, 548),
(14,864),
(15, 234);

INSERT INTO juego.niveles(id_nivel, descripcion, fk_puntuacion)
VALUES (1, "En el nivel 1 el objetivo es sobrevivir ", 1),
(2, "En el nivel 2 el objetivo es superar lo 2000 puntos", 2),
(3, "En el nivel 3 el objetivo es matar a todo lo que se mueva", 3);


INSERT INTO juego.partidas(id_partidas, estado, fecha, fk_nivel, fk_usuario, fk_puntaje)
VALUES (1, "Jugando", "2022-10-10 09:11:59", 1, 1, 1),
(2, "Finalizada", "2022-10-19 05:35:15 ", 1, 1, 2),
(3, "Pausada", "2022-08-19 03:11:02", 1, 1, 3),
(4, "Jugando", "2022-10-11 22:32:58", 1, 1, 4),
(5, "Finalizada", "2022-10-09 09:54:36", 1, 1, 5),
(6, "Jugando", "2022-06-19 15:32:59", 2, 2, 6),
(7, "Pausada", "2022-03-06 20:47:31", 2, 2, 7),
(8, "Finalizada", "2022-05-28 16:38:10", 2, 2, 8),
(9, "Jugando", "2022-09-25 03:11:02", 2, 2, 9),
(10, "Pausada", "2022-07-21 13:52:30", 2, 2, 10),
(11, "Finalizada", "2022-03-18 15:54:30", 3, 3, 11),
(12, "Jugando", "2022-10-15 18:31:24", 3, 3, 12),
(13, "Pausada", "2022-10-12 22:21:30", 3, 3, 13),
(14, "Finalizada", "2022-10-02  09:16:34", 3, 3, 14),
(15, "Jugando", "2022-10-13  09:11:55", 3, 3, 15);




