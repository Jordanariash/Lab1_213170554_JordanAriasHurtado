#lang racket

;Definicion: Función que permite establecer enlaces entre dos estaciones
;Dominio: point1 (station)  X point2 (station) X distance (positive-number) X cost (positive-number U {0})
;Recorrido: section

(provide (all-defined-out))
(require "station_213170554_AriasHurtado.rkt")



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




(define (get-point1-section section)
  (car section))

(define (get-point2-section section)
  (cadr section))

(define (get-distance-section section)
  (caddr section))

(define (get-cost-section section)
  (cadddr section))






(define (section? section)
  (and (station? (get-point1-section section))
       (station? (get-point2-section section))
       (> (get-distance-section section) 0)
       (>= (get-cost-section section) 0)
          )
     )




;verifica que en una estacion, no se repitan sus id y nombre
(define (repite-station? point1 point2)
  (and  (not(= (get-id-station point1) (get-id-station point2)))
        (not(equal? (get-name-station point1)(get-name-station point2)))
           )
  )


;verifica que en una seccion, no se repitan sus estaciones,  osea que 1-2, es lo mismo que 2-1
(define (member-station station section)
  (or (repite-station? station (get-point1-section section))
      (repite-station? station (get-point2-section section))
      )
  )


