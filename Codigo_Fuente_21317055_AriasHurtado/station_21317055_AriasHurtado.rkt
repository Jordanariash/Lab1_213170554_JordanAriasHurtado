#lang racket

(provide (all-defined-out))

#|
Representacion: Este TDA representa la unidad mas basica de una linea de metro, las estaciones.
las cuales poseen un identificador unico, un nombre, el tipo, en que dependiendo si son de recorrido,
terminal, combinacion, o mantencion, se pueden realizar ciertas operaciones, y el tiempo que se detiene
el tren en cada estacion
|#



;Constructores

#|
Descripcion: Función constructora de una estación de metro, las que pueden ser del tipo: regular, mantención ,combinación, o terminal
Dominio: id (int) X name (String)  X type (station-type) X stop-time (positive integer)
Recorrido: station
|#
(define (station id-station name-station type stop-time)
  (if (and (integer? id-station)
           (string? name-station)
           (station-type type)
           (integer? stop-time) (> stop-time 0)
           )
      (list id-station name-station type stop-time)
      null)
  )


;Pertenencia

#|
Descripcion: funcion de pertenencia para verificar si la estacion creada es valida
Dominio: station (station)
Recorrido: boolean
|#
(define (station? station)
  (and (integer? (get-id-station station))
       (string? (get-name-station station))
           (station-type (get-type-station station))
           (integer? (get-stop-time-station station)) (> (get-stop-time-station station) 0)
           ) 
   )
 

;Selectores

(define (get-id-station station)
  (car station))

(define (get-name-station station)
  (cadr station))

(define (get-type-station station)
  (caddr station))

(define (get-stop-time-station station)
  (cadddr station))

(define (get-r valid)
  (car valid))

(define (get-m valid)
  (cadr valid))

(define (get-c valid)
  (caddr valid))

(define (get-t valid)
  (cadddr valid))

;Modificadores

;Otras funciones

(define r "r")
(define m "m")
(define c "c")
(define t "t")

(define valid
  (list r m c t)
  )

(define (station-type type)
  (or (equal? type (get-r valid))
      (equal? type (get-m valid))
      (equal? type (get-c valid))
      (equal? type (get-t valid))
  )
)
