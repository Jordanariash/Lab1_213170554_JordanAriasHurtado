#lang racket

;definicion: Función que permite establecer enlaces entre dos estaciones
;dominio: point1 (station)  X point2 (station) X distance (positive-number) X cost (positive-number U {0})
;recorrido: section

(require "station_213170554_AriasHurtado.rkt")

(define (section point1 point2 distance cost)
  (if(and (> distance 0)
          (>= cost 0)
          )
     (list point1 point2 distance cost)
     null
     )
  )
