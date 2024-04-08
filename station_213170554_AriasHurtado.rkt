#lang racket

;descripcion: Función constructora de una estación de metro, las que pueden ser del tipo: regular, mantención ,combinación, o terminal
;Dominio: id (int) X name (String)  X type (station-type) X stop-time (positive integer)
;Recorrido: station

(provide (all-defined-out))

(define valid '(r m c t))

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
