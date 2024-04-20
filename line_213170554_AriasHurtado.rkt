#lang racket

;Definicion: Función que permite crear una linea mediante la union de secciones
;Dominio id (int) X name (string) X rail-type (string) X section* (* señala que se pueden agregar 0 o más tramos)
;Recorrido: line

(provide (all-defined-out))
(require "section_213170554_AriasHurtado.rkt")
(require "station_213170554_AriasHurtado.rkt")


(define (line id-line name-line rail-type . section)
  (if (and (integer? id-line)
           (string? name-line)
           (string? rail-type)
           
           )
  (list id-line name-line rail-type section)
  null
  )
 )



(define (compare-two-section section1 section2)
  (not (and(member-station (get-point1-section section1) section2)
           (member-station (get-point2-section section1) section2)
           )
       )
 )


(define (compare-section section sections)
  (and (compare-two-section section (car sections))
       (compare-section section (cdr sections))
      )
  )
  

(define (repite-section? sections)
  (and (compare-section (car sections) (cdr sections))
       (repite-section? (cdr sections))
       )
  )



;Creación de Línea 1 con todos los tramos
(define l1 (line 1 "Línea 1" "UIC 60 ASCE" s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15))
;Creación de Línea 2 sin incluir tramos
(define l2 (line 2 "Línea 2" "100 R.E."))

