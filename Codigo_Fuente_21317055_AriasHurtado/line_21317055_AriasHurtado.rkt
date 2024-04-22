#lang racket


(require "section_21317055_AriasHurtado.rkt")
(require "station_21317055_AriasHurtado.rkt")
(provide (all-defined-out))

#|
Representacion: Este TDA representa la union de 2 estaciones, en la cual se registran
ambas estaciones, la distancia entre ellas, y el costo monetario que conlleva ir de una
estacion a otra
|#



;Constructores

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


;Pertenencia

#|
Descripcion:;funcion de pertenencia que compara que 2 secciones no sean iguales
Dominio: section1(section) section2(section)
Recorrido: boolean
|#

(define (compare-two-section section1 section2)
  (not (and(member-station (get-point1-section section1) section2)
           (member-station (get-point2-section section1) section2)
           )
       )
 )

#|
Descripcion:;funcion de pertenencia que compara la primera seccion con el resto de secciones de la linea
Dominio: section(section) sections(list)
Recorrido: boolean
Recursion: natural
|#

(define (compare-section section sections)
  (and (compare-two-section section (car sections))
       (compare-section section (cdr sections))
      )
  )

#|
Descripcion:;funcion de pertenencia que compara todas las secciones con el resto para ver si hay repetidas
Dominio: section(section) sections(list)
Recorrido: boolean
Recursion: natural
|#

(define (repite-section? sections)
  (and (compare-section (car sections) (cdr sections))
       (repite-section? (cdr sections))
       )
  )

#|
Descripcion:;funcion de pertenencia que verifica si 2 seccione de la linea estan conectadas directamente
Dominio: section(section) section2(section)
Recorrido: boolean
|#

(define (directly-connected section1 section2)
  (or (equal? (get-point1-section section1)(get-point1-section section2))
      (equal? (get-point1-section section1)(get-point2-section section2))
      (equal? (get-point2-section section1)(get-point1-section section2))
      (equal? (get-point2-section section1)(get-point2-section section2))
      )
  )




;Pertenencia
(define (get-sections line)
  (cadddr line))


(define (get-distance-line sections)
  (map caddr sections)
)

(define (get-distance-total sections)
  (apply + (get-distance-line sections))
  )
 

(define (get-cost-line sections)
  (map cadddr sections)
)

(define (get-first-cost sections)
  (car sections))
(define (get-rest-cost sections)
  (cdr sections))



(define (get-cost-total sections)
  (if (null? (get-cost-line sections))
      0
      (+ (get-first-cost (get-cost-line sections))
         (get-cost-total (get-rest-cost sections))
      )
  )
)


;Otras funciones

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

