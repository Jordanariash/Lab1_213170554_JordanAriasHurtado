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
           (compare-two-section )
           )
  (list id-line name-line rail-type section)
  null
  )
 )



;compara que 2 secciones no sean iguales, e1 ab =! e2 ab
(define (compare-two-section section1 section2)
  (not (and(member-station (get-point1-section section1) section2)
           (member-station (get-point2-section section1) section2)
           )
       )
 )

;compara el primer elemento con el resto
(define (compare-section section sections)
  (and (compare-two-section section (car sections))
       (compare-section section (cdr sections))
      )
  )
  
;compara todos los elementos con el llamado recursivo
(define (repite-section? sections)
  (and (compare-section (car sections) (cdr sections))
       (repite-section? (cdr sections))
       )
  )



(define (get-station stations)
  (car stations))

(define (get-other-stations stations)
  (car(cdr stations)))

(define (get-routes stations)
  (if (stations? stations)
      ((get-other-stations stations))
      (error)
   )
 )

(define (get-station-candidate-route candidate-route)
  (car candidate-route))

(define (get-stations-candidate-route candidate-route)
  (cdr candidate-route))

(define (get-first-route routes)
  (car routes))

(define (get-second-route routes)
  (cdr routes))

(define (get-first-station stations)
  (caar stations))

(define (get-second-station stations)
  (cadr stations))

(define (get-stations-without-first stations)
  (cdr stations))





(define (remove-visited-stations stations visited-stations)
  stations(filter  (lambda (x) (not (or (exist-in-line? (x) visited-stations)
                                        (exist-in-line? (x) visited-stations)
                                    )
                    )
           )stations)
  )


(define (other-route routes station)
  (if (equal? (get-first-route routes) station)
      (get-second-route routes)
      (get-first-route routes)
  )
)


(define (get-first-possible-candidates possible-candidates-routes)
  (car possible-candidates-routes))

(define (get-other-possible-candidates possible-candidates-routes)
  (cdr possible-candidates-routes))

(define (go-through-stations stations possible-candidates-routes station-start station-end visited-stations)
  (if (null? possible-candidates-routes)
      #f
      (if (posible-to-arrive? stations (other-route (get-first-possible-candidates possible-candidates-routes) station-start) station-end visited-stations)
          #t
          (go-through-stations stations (get-other-possible-candidates possible-candidates-routes) station-end visited-stations)
      )
  )
)


(define (directly-connected? stations station-start station-end)
  (if (null? stations)
      #f
      (if (or (and(equal?((get-first-station stations) station-start)(equal?(get-second-station stations)station-end))
              (and(equal?((get-first-station stations) station-end)(equal?(get-second-station stations)station-start))
                  )))
           #t
           (directly-connected? (get-stations-without-first stations) station-start station-end) 
           )
       ) 
  )

(define (stations? stations)
  (list? stations))


;verificar si la seccion esta en la linea
(define (exist-in-line? station sections)
  (if (equal? (member station sections) #f)
      #f
      #t)
  )


;funcion para ver si es posible llegar de una estacion a otra
(define (posible-to-arrive? stations station-start station-end visited-stations)
                              (if (and (exist-in-line? station-start (get-station stations))
                                       (exist-in-line? station-end (get-station stations))
                                       )
                                  (if (equal? station-start station-end)
                                      #t
                                      (if (directly-connected? stations station-start station-end)
                                          #t
                                          (go-through-stations
                                           stations
                                           (remove-visited-stations (other-route (get-routes stations) station-start) visited-stations)
                                           station-start
                                           station-end
                                           (cons station-start visited-stations)
                                           )
                                       )
                               )
                               (raise "no es posible llegar a la estacion")   
         )
 )