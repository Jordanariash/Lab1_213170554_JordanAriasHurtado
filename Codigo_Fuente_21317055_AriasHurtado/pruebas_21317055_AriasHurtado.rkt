#lang racket

(require "station_21317055_AriasHurtado.rkt")
(require "section_21317055_AriasHurtado.rkt")
(require "line_21317055_AriasHurtado.rkt")
(provide (all-defined-out))

;Script de pruebas

;station
(define e0 (station 0 "San Pablo" t 90))
(define e1 (station 1 "Neptuno" r 45))
(define e2 (station 2 "Pajaritos" c 45))
(define e3 (station 3 "Las Rejas" r 45))
(define e4 (station 4 "Ecuador" r 60))
(define e5 (station 5 "San Alberto Hurtado" r 40))

(define e6 (station 12 "Cuatro Caminos" t 55))
(define e7 (station 13 "Canal" r 80))
(define e8 (station 14 "San Bernardo" c 55))
(define e9 (station 15 "Noviciado" r 45))
(define e10 (station 16 "Opera" r 90))
(define e11 (station 17 "Sol" c 75))

(define e14 (station 37 "Bond Street" c 64))
(define e16 (station 39 "Goodge Street" r 96))
(define e12 (station 35 "Lancaster Gate" r 36))
(define e15 (station 38 "Oxford Circus" c 81))
(define e13 (station 36 "Marble arch" r 74))
(define e17 (station 40 "Holborn" m 25))



;section
(define s0 (section e0 e1 4 15))
(define s1 (section e1 e2 3 14))
(define s2 (section e2 e3 2.5 10))
(define s3 (section e3 e4 4.5 17))
(define s4 (section e4 e5 4.7 18))

(define s5 (section e6 e7 2.7 12))
(define s6 (section e7 e8 3.4 18))
(define s7 (section e8 e9 4.2 15))
(define s8 (section e9 e10 2.5 11))
(define s9 (section e10 e11 1.8 19))

(define s10 (section e12 e13 3.8 14))
(define s11 (section e13 e14 2.3 17))
(define s12 (section e14 e15 4.5 13))
(define s13 (section e15 e16 2.9 16))
(define s14 (section e16 e17 3.2 20))


;line
(define l1 (line 1 "Línea 1" "UIC 60 ASCE" s0 s1 s2 s3 s4))
(define l2 (line 4 "Línea 3 Madrid" "UIC 54" s5 s6 s7 s8 s9))
(define l3 (line 7 "Line 6 London" "BS 113A" s10 s11 s12 s13 s14))

;line-lenght
(define largo-l1 (line-lenght l1))
(define largo-l2 (line-lenght l2))
(define largo-l3 (line-lenght l3))

;line-cost
(define costo-l1 (line-cost l1))
(define costo-l2 (line-cost l2))
(define costo-l3 (line-cost l3))
