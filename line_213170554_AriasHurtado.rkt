#lang racket

;definicion: Función que permite crear una linea mediante la union de secciones
;dominio id (int) X name (string) X rail-type (string) X section* (* señala que se pueden agregar 0 o más tramos)
;recorrido: line

(require "section_213170554_AriasHurtado.rkt")

(define (line id-line name-line rail-type . section)
  (if (and (integer? id-line)
           (string? name-line)
           (string? rail-type)
           )
  (list id-line name-line rail-type section)
  null
  )
 )