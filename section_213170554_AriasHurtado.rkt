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

(define (repite-station? point1 point2)
  (and  (not(= (get-id-station point1) (get-id-station point2)))
        (not(equal? (get-name-station point1)(get-name-station point2)))
           )
  )

(define (member-station station section)
  (or (repite-station? station (get-point1-section section))
      (repite-station? station (get-point2-section section))
      )
  )


;Tramos Línea 1
(define s0 (section e0 e1 4 15))
(define s1 (section e1 e2 3 14))
(define s2 (section e2 e3 2.5 10))
(define s3 (section e3 e4 4.5 17))
(define s4 (section e4 e5 4.7 18))
(define s5 (section e5 e6 4.3 17))
(define s6 (section e6 e7 3.8 12))
(define s7 (section e7 e8 2.5 10))
(define s8 (section e8 e9 4.5 17))
(define s9 (section e9 e10 4.7 18))
(define s10 (section e10 e11 4.3 17))
(define s11 (section  e11 e12 3.8 12))
(define s12 (section e12 e13 4.5 17))
(define s13 (section e13 e14 4.7 18))
(define s14 (section e14 e15 4.3 17))
(define s15 (section e15 e16 4.2 17))

;enlace cochera
(define s16 (section e1 e17 3.8 12))

;Tramos Línea 2, línea circular
(define s17 (section e18 e19 4 15))
(define s18 (section e19 e20 3 12))
(define s19 (section e20 e21 5 18))
(define s20 (section e21 e22 4.5 16))
(define s21 (section e22 e10 4.2 16))
(define s22 (section e10 e23 4.2 16))
(define s23 (section e23 e24 4.2 16))
(define s24 (section e24 e18 28 90))


