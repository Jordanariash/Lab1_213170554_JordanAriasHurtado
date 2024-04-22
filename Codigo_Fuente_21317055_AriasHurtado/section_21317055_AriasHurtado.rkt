#lang racket

(provide (all-defined-out))
(require "station_21317055_AriasHurtado.rkt")


#|
Representacion: Este TDA representa la union de 2 estaciones, en la cual se registran
ambas estaciones, la distancia entre ellas, y el costo monetario que conlleva ir de una
estacion a otra
|#


;Constructores

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

;Pertenencia

#|
Descripcion: funcion de pertenencia para verificar si la seccion creada es valida
Dominio: station (station)
Recorrido: boolean
|#
(define (section? section)
  (and (station? (get-point1-section section))
       (station? (get-point2-section section))
       (> (get-distance-section section) 0)
       (>= (get-cost-section section) 0)
          )
     )

#|
Descripcion: funcion de pertenencia para verificar si las estaciones de la seccion no
poseen el mismo id y nombre
Dominio: point1 (station) point2(station)
Recorrido: boolean
|#
(define (repite-station? point1 point2)
  (and  (not(= (get-id-station point1) (get-id-station point2)))
        (not(equal? (get-name-station point1)(get-name-station point2)))
           )
  )

#|
Descripcion: funcion de pertenencia para verificar que en una seccion, no se repita la estacion
Dominio: station (station) section(section)
Recorrido: boolean
|#
(define (member-station station section)
  (or (repite-station? station (get-point1-section section))
      (repite-station? station (get-point2-section section))
      )
  )


;Selectores

(define (get-point1-section section)
  (car section))

(define (get-point2-section section)
  (cadr section))

(define (get-distance-section section)
  (caddr section))

(define (get-cost-section section)
  (cadddr section))

;Modificadores

;Otras funciones