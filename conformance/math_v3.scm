;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; APLCE / LMLM Mathematical Foundation Standard v2.0
;; Aura Programming Languages & Compiler Engineering
;; Mathematical Runtime Validation Suite
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(suite "APLCE Mathematical Standard v2.0")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 1 — Arithmetic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Arithmetic"
  ("Equality"
    (and
      (= 1 1)
      (= 1 1.0)
      (= 0 -0)
      (= (/ 6 3) 2)
      (= (+ 2 3) 5)
      (= (- 8 3) 5)
      (= (* 4 5) 20)
      (= (/ 9 3) 3)))
  ("Inequality"
    (and
      (!= 1 2)
      (> 8 4)
      (< 4 8)
      (>= 5 5)
      (<= 5 5)
      (not (> 3 5))
      (not (< 9 2))))
  ("Modulo"
    (and
      (= (% 10 3) 1)
      (= (% 8 2) 0)
      (= (% 15 4) 3)))
  ("Absolute Value"
    (and
      (= (abs -8) 8)
      (= (abs 8) 8))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 2 — Integer & Floating Arithmetic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Division"
  ("Integer Division"
    (= (div 9 2) 4))
  ("Floating Division"
    (and
      (= (/ 9 2.0) 4.5)
      (= (/ 9.0 2) 4.5)
      (= (/ 9.0 2.0) 4.5))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 3 — Powers, Roots, Indices
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Indices"
  ("Exponentiation"
    (and
      (= (^ 2 10) 1024)
      (= (^ 5 0) 1)
      (= (^ 2 -2) 0.25)))
  ("Square Roots"
    (and
      (= (sqrt 81) 9)
      (= (sqrt 16) 4)))
  ("Cube Roots"
    (= (cbrt 27) 3)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 4 — Logarithms & Constants
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Logarithms"
  ("Natural Constants"
    (and
      (= (round pi 5) 3.14159)
      (= (round e 5) 2.71828)))
  ("Logarithms"
    (and
      (= (log10 1000) 3)
      (= (ln e) 1)
      (= (exp 1) e))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 5 — Trigonometry
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Trigonometry"
  ("Basic Functions"
    (and
      (= (sin 0) 0)
      (= (cos 0) 1)
      (= (tan 0) 0)))
  ("Pythagorean Identity"
    (= (+ (^ (sin pi) 2)
          (^ (cos pi) 2))
       1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 6 — Algebra
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Algebra"
  ("Quadratic Formula"
    (= (quadratic 1 -5 6)
       '(2 3)))
  ("Linear Equation"
    (= (solve-linear 2 8)
       4)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 7 — Sequences & Series
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Sequences"
  ("Arithmetic Sequence"
    (= (nth-arithmetic 2 3 5)
       14))
  ("Geometric Sequence"
    (= (nth-geometric 2 3 5)
       162))
  ("Factorials"
    (and
      (= (! 5) 120)
      (= (! 0) 1)))
  ("Fibonacci"
    (= (fib 10) 55)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 8 — Sets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Set Theory"
  ("Union"
    (= (union '(1 2 3) '(3 4))
       '(1 2 3 4)))
  ("Intersection"
    (= (intersection '(1 2 3) '(3 4 5))
       '(3)))
  ("Difference"
    (= (difference '(1 2 3) '(2))
       '(1 3))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 9 — Probability
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Probability"
  ("Basic Probability"
    (= (probability 1 6)
       (/ 1 6)))
  ("Conditional Probability"
    (= (conditional-probability
          (/ 1 12)
          (/ 1 3))
       (/ 1 4)))
  ("Bayes Theorem"
    (= (bayes 0.8 0.1 0.2)
       0.32)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 10 — Statistics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Statistics"
  ("Mean"
    (= (mean '(1 2 3 4 5))
       3))
  ("Median"
    (= (median '(1 2 3 4 5))
       3))
  ("Mode"
    (= (mode '(1 2 2 3 3 3 4))
       3))
  ("Variance"
    (= (variance '(2 4 4 4 5 5 7 9))
       4))
  ("Standard Deviation"
    (= (std '(2 4 4 4 5 5 7 9))
       2)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 11 — Matrices
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Matrices"
  ("Addition"
    (= (matrix+
         '((1 2) (3 4))
         '((5 6) (7 8)))
       '((6 8) (10 12))))
  ("Multiplication"
    (= (matrix*
         '((1 2) (3 4))
         '((2 0) (1 2)))
       '((4 4) (10 8))))
  ("Determinant"
    (= (det '((1 2)(3 4)))
       -2)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 12 — Vectors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Vectors"
  ("Magnitude"
    (= (magnitude '(3 4))
       5))
  ("Dot Product"
    (= (dot '(1 2 3) '(4 5 6))
       32))
  ("Cross Product"
    (= (cross '(1 0 0)
              '(0 1 0))
       '(0 0 1))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 13 — Calculus
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Calculus"
  ("Derivative"
    (= ((derivative (fn (x) (^ x 2))) 5)
       10))
  ("Integral"
    (= (integrate (fn (x) x) 0 2)
       2)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 14 — Number Theory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Number Theory"
  ("Prime Numbers"
    (and
      (prime? 2)
      (prime? 97)
      (not (prime? 100))))
  ("Greatest Common Divisor"
    (= (gcd 54 24)
       6))
  ("Least Common Multiple"
    (= (lcm 6 8)
       24))
  ("Modular Arithmetic"
    (= (mod-exp 2 10 1000)
       24)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 15 — Graph Theory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Graph Theory"
  ("Breadth First Search"
    (= (bfs graph 'A)
       '(A B C D E)))
  ("Shortest Path"
    (= (shortest-path graph 'A 'E)
       '(A C E))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 16 — Boolean Algebra
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Boolean Algebra"
  ("Logic"
    (and
      (true? (and #t #t))
      (false? (and #t #f))
      (true? (or #t #f))
      (true? (xor #t #f))
      (false? (xor #t #t)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 17 — Lambda Calculus
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Currying & Composition"
  ("Currying"
    (let ((sum (fn (a b c) (+ a b c))))
      (= (((sum 1) 2) 3)
         6)))
  ("Composition"
    (= ((compose sqrt abs) -81)
       9))
  ("Map Filter Fold"
    (and
      (= (map inc '(1 2 3))
         '(2 3 4))
      (= (filter even? '(1 2 3 4 5 6))
         '(2 4 6))
      (= (fold + 0 '(1 2 3 4))
         10))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 18 — Type Theory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Type System"
  ("Primitive Types"
    (and
      (number? 3.14)
      (integer? 7)
      (float? 7.5)
      (string? "Aura")
      (bool? #t)
      (symbol? 'web4)
      (list? '(1 2 3))))
  ("Higher Types"
    (and
      (function? map)
      (vector? #(1 2 3))
      (matrix? '((1 2)(3 4))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 19 — Continuations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Continuations"
  ("call/cc escape"
    (do
      (def escaped #f)
      (= (call/cc
           (fn (exit)
             (set escaped #t)
             (exit 42)
             99))
         42))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 20 — Complexity Theory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "P vs NP"
  ("Complexity Classes"
    (and
      (= (complexity quicksort)
         'O(n log n))
      (= (complexity mergesort)
         'O(n log n))
      (= (complexity bubblesort)
         'O(n²))
      (= (class SAT)
         'NP-Complete)
      (= (class TravelingSalesman)
         'NP-Complete)
      (= (class ShortestPath)
         'P))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 21 — Cryptographic Mathematics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Cryptography"
  ("Modular Inverse"
    (= (mod-inverse 3 11)
       4))
  ("Euler Totient"
    (= (phi 9)
       6))
  ("RSA Example"
    (= (rsa-encrypt 65 public-key)
       cipher-text)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 22 — AI Mathematics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Artificial Intelligence"
  ("Sigmoid"
    (= (round (sigmoid 0) 5)
       0.5))
  ("Softmax"
    (= (sum (softmax '(2 3 5)))
       1))
  ("Mean Squared Error"
    (= (mse '(1 2 3) '(1 3 2))
       (/ 2 3)))
  ("Gradient Descent"
    (= (gradient-step 5 0.1 2)
       4.8)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 23 — Information Theory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Entropy"
  ("Binary Entropy"
    (= (entropy '(0.5 0.5))
       1))
  ("Cross Entropy"
    (= (cross-entropy
          '(1 0)
          '(0.8 0.2))
       0.22314)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECTION 24 — Runtime Precision
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(test "Numerical Stability"
  ("Floating Precision"
    (< (abs
         (- (+ 0.1 0.2)
            0.3))
       1e-12))
  ("Infinity and NaN"
    (and
      (infinite? (/ 1 0))
      (nan? (/ 0 0)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; END OF STANDARD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
