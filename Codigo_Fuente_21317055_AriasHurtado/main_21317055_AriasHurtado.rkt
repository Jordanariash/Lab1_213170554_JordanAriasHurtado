#lang racket

(require "station_21317055_AriasHurtado.rkt")
(require "section_21317055_AriasHurtado.rkt")
(require "line_21317055_AriasHurtado.rkt")
(provide (all-defined-out))

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

;Definicion: Función que permite establecer enlaces entre dos estaciones
;Dominio: point1 (station)  X point2 (station) X distance (positive-number) X cost (positive-number U {0})
;Recorrido: section


(define (section point1 point2 distance cost)
  (if(and (station? point1)
          (station? point2)
          (> distance 0)
          (>= cost 0)
          )
     (list point1 point2 distance cost)
     null
     )
  )

;Definicion: Función que permite crear una linea mediante la union de secciones
;Dominio: id (int) X name (string) X rail-type (string) X section* (* señala que se pueden agregar 0 o más tramos)
;Recorrido: line

(define (line id-line name-line rail-type . section)
  (if (and (integer? id-line)
           (string? name-line)
           (string? rail-type)
           )
  (list id-line name-line rail-type section)
  null
  )
 )

#|
Descripcion: Funcion para calcular el largo total de una linea
Dominio: line(line)
Recorrido: positive number
|#

(define (line-lenght line)
  (get-distance-total (get-sections line)))

#|
Descripcion: Funcion para calcular el costo total de una linea
Dominio: line(line)
Recorrido: positive number
Recursividad: natural
|#

(define (line-cost line)
  (get-cost-total (get-sections line))
  )


