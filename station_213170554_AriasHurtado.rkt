#lang racket

;Descripcion: Función constructora de una estación de metro, las que pueden ser del tipo: regular, mantención ,combinación, o terminal
;Dominio: id (int) X name (String)  X type (station-type) X stop-time (positive integer)
;Recorrido: station

(provide (all-defined-out))

(define valid '("r" "m" "c" "t"))

(define (station-type type)
  (member type valid)
  )

(define (station id-station name-station type stop-time)
  (if (and (integer? id-station)
           (string? name-station)
           (station-type type)
           (integer? stop-time) (> stop-time 0)
           )
      (list id-station name-station type stop-time)
      null)
  )



(define (get-id-station station)
  (car station))

(define (get-name-station station)
  (cadr station))

(define (get-type-station station)
  (caddr station))

(define (get-stop-time-station station)
  (cadddr station))





(define (station? station)
  (and (integer? (get-id-station station))
       (string? (get-name-station station))
           (station-type (get-type-station station))
           (integer? (get-stop-time-station station)) (> (get-stop-time-station station) 0)
           ) 
   )
 


;Estaciones L1 simplificada metro santiago
(define e0 (station 0 "San Pablo" "t" 90))
(define e1 (station 1 "Neptuno" "r" 45))
(define e2 (station 2 "Pajaritos" "c" 45))
(define e3 (station 3 "Las Rejas" "r" 45))
(define e4 (station 4 "Ecuador" "r" 60))
(define e5 (station 5 "San Alberto Hurtado" "r" 40))
(define e6 (station 6 "Universidad de Santiago de Chile" "c" 40))
(define e7 (station 7 "Estación Central" "c" 45))
(define e8 (station 8 "Unión Latinoamericana" "r" 30))
(define e9 (station 9 "República" "r" 40))
(define e10 (station 10 "Los Héroes" "c" 60))
(define e11 (station 11 "La Moneda" "r" 40))
(define e12 (station 12 "Universidad de Chile" "c" 90))
(define e13 (station 13 "Santa Lucía" "r" 40))
(define e14 (station 14 "Universidad Católica" "c" 60))
(define e15 (station 15 "Baquedano" "r" 40))
(define e16 (station 16 "Los Dominicos" "t" 90))
(define e17 (station 17 "Cochera Neptuno" "m" 3600))

;Estaciones L2 simplificada metro santiago, para una versión circular
(define e18 (station 18 "El Llano" "r" 60))
(define e19 (station 19 "Franklin" "r" 50))
(define e20 (station 20 "Rondizzoni" "r" 55))
(define e21 (station 21 "Parque O'Higgins" "r" 65))
(define e22 (station 22 "Toesca" "r" 65))
(define e23 (station 23 "Santa Ana" "c" 65))
(define e24 (station 24 "Puente Cal y Canto" "r" 65))

