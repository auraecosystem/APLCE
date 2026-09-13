;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; APLCE / LMLM Standard Mathematics & Functional Test Suite
;; Version : 3.0.0
;; Project : Aura Programming Languages & Compiler Engineering (APLCE)
;; Runtime : LMLM / KIBS / Aura Scheme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(version "3.0.0")
(author "Aura Ecosystem")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL CONSTANTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(def PI 3.141592653589793)
(def TAU (* 2 PI))
(def E   2.718281828459045)
(def EPSILON 0.0000000001)

(def (approx= a b)
  (< (abs (- a b)) EPSILON))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ASSERTION HELPERS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(def (assert condition message)
  (if condition
      #t
      (error message)))

(defmacro expect (expr value)
  `(assert (= ,expr ,value)
           (str "Expected " ',value " got " ,expr)))

(defmacro expect≈ (expr value)
  `(assert (approx= ,expr ,value)
           (str "Expected approximately " ',value)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MATHEMATICS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Mathematics"

  ("Equality"
    (and (= 1 1)
         (= 1 1.0)
         (= 1.0 1)
         (= 1.0 1.0)
         (not (= 1 2))
         (not (= 1.6 -312542))))

  ("Inequality"
    (and (!= 1 2)
         (< 2 5)
         (> 10 5)
         (<= 5 5)
         (>= 8 8)))

  ("Arithmetic"
    (and (= (+ 5 7) 12)
         (= (- 10 6) 4)
         (= (* 8 4) 32)
         (= (/ 8 2) 4)
         (= (% 17 5) 2)))

  ("Integer Division"
    (= 1 (/ 3 2)))

  ("Floating Division"
    (and (approx= (/ 3 2.0) 1.5)
         (approx= (/ 3.0 2) 1.5)
         (approx= (/ 3.0 2.0) 1.5)))

  ("Powers and Roots"
    (and (= (^ 2 10) 1024)
         (= (^ 5 0) 1)
         (= (sqrt 81) 9)
         (approx= (cbrt 27) 3)))

  ("Logarithms"
    (and (approx= (ln E) 1)
         (= (log10 1000) 3)
         (approx= (exp 1) E)))

  ("Absolute Values"
    (and (= (abs -50) 50)
         (= (abs 50) 50)))

  ("Rounding"
    (and (= (floor 4.9) 4)
         (= (ceil 4.1) 5)
         (= (round 4.5) 5)))

  ("Min Max Clamp"
    (and (= (min 5 1 8) 1)
         (= (max 5 1 8) 8)
         (= (clamp 15 0 10) 10)))

  ("Indices Laws"
    (and (= (* (^ 2 3) (^ 2 2))
            (^ 2 (+ 3 2)))
         (= (/ (^ 5 4) (^ 5 2))
            (^ 5 (- 4 2)))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ALGEBRA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Algebra"

  ("Linear Equation"
    (= (solve-linear 2 4) -2))

  ("Quadratic Roots"
    (= (quadratic-roots 1 -5 6)
       '(2 3)))

  ("Polynomial Evaluation"
    (= (poly '(2 0 -3 5) 2)
       15))

  ("Polynomial Derivative"
    (= (poly-derivative '(3 2 1))
       '(6 2)))

  ("Polynomial Integral"
    (= (poly-integral '(6 2))
       '(3 2 0)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TRIGONOMETRY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Trigonometry"

  ("Basic Functions"
    (and (approx= (sin (/ PI 2)) 1)
         (approx= (cos 0) 1)
         (approx= (tan (/ PI 4)) 1)))

  ("Inverse Trigonometry"
    (and (approx= (asin 1) (/ PI 2))
         (approx= (acos 1) 0)
         (approx= (atan 1) (/ PI 4))))

  ("Hyperbolic"
    (and (approx= (sinh 0) 0)
         (approx= (cosh 0) 1)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CALCULUS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Calculus"

  ("Limit"
    (approx=
      (limit (fn (x) (/ (sin x) x)) 0)
      1))

  ("Derivative"
    (= (differentiate (fn (x) (* x x)) 3)
       6))

  ("Integral"
    (approx=
      (integrate (fn (x) x) 0 2)
      2))

  ("Second Derivative"
    (= (differentiate2 (fn (x) (^ x 3)) 2)
       12))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NUMBER THEORY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Number Theory"

  ("Prime Test"
    (and (prime? 2)
         (prime? 97)
         (not (prime? 100))))

  ("GCD LCM"
    (and (= (gcd 18 24) 6)
         (= (lcm 18 24) 72)))

  ("Factorial"
    (and (= (! 5) 120)
         (= (! 0) 1)))

  ("Fibonacci"
    (= (fib 15) 610))

  ("Modular Exponentiation"
    (= (modexp 2 10 1000) 24))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMBINATORICS & PROBABILITY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Probability"

  ("Permutations"
    (= (perm 5 2) 20))

  ("Combinations"
    (= (comb 5 2) 10))

  ("Basic Probability"
    (= (probability 2 8) 0.25))

  ("Independent Events"
    (= (joint-probability 0.5 0.2) 0.1))

  ("Bayes Theorem"
    (approx=
      (bayes 0.01 0.95 0.05)
      0.1610169))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STATISTICS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Statistics"

  ("Mean Median Mode"
    (and (= (mean '(1 2 3 4 5)) 3)
         (= (median '(1 2 3 4 5)) 3)
         (= (mode '(1 2 2 3 4)) 2)))

  ("Variance"
    (approx=
      (variance '(1 2 3 4 5))
      2.5))

  ("Standard Deviation"
    (approx=
      (stddev '(1 2 3 4 5))
      1.58113883))

  ("Correlation"
    (approx=
      (correlation '(1 2 3)
                   '(2 4 6))
      1))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LINEAR ALGEBRA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Linear Algebra"

  ("Vector Operations"
    (and (= (dot '(1 2 3) '(4 5 6)) 32)
         (= (cross '(1 0 0) '(0 1 0))
            '(0 0 1))))

  ("Matrix Multiplication"
    (= (matmul
         '((1 2) (3 4))
         '((5 6) (7 8)))
       '((19 22) (43 50))))

  ("Transpose"
    (= (transpose
         '((1 2 3)
           (4 5 6)))
       '((1 4)
         (2 5)
         (3 6))))

  ("Determinant"
    (= (det '((1 2)
              (3 4)))
       -2))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMPLEX NUMBERS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Complex Numbers"

  ("Addition"
    (= (+ 1+2i 3+4i)
       4+6i))

  ("Magnitude"
    (= (abs 3+4i) 5))

  ("Conjugate"
    (= (conj 5+7i)
       5-7i))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SET THEORY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Set Theory"

  ("Union"
    (= (union '(1 2)
              '(2 3 4))
       '(1 2 3 4)))

  ("Intersection"
    (= (intersection '(1 2 3)
                     '(2 3 4))
       '(2 3)))

  ("Difference"
    (= (difference '(1 2 3)
                   '(2))
       '(1 3)))

  ("Subset"
    (subset? '(1 2)
             '(1 2 3)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPH THEORY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Graph Theory"

  ("Breadth First Search"
    (= (bfs graph 'A)
       '(A B C D E)))

  ("Depth First Search"
    (= (dfs graph 'A)
       '(A B D E C)))

  ("Shortest Path"
    (= (dijkstra graph 'A 'E)
       '(A C E)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LIBRARY FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Library Functions"

  ("Map"
    (= (map inc '(1 2 3))
       '(2 3 4)))

  ("Fold"
    (= (fold (flip cons)
             '()
             '(1 2 3 4 5))
       '(5 4 3 2 1)))

  ("Filter"
    (= (filter number?
               '(1 2 'a "wat" (pfffff)))
       '(1 2)))

  ("Reduce"
    (= (reduce + '(1 2 3 4))
       10))

  ("Compose"
    (= ((compose square inc) 4)
       25))

  ("Currying"
    (let ((ap (fn (op a b)
                (op a b))))
      (and (= (+ 1 2)
              (((ap +) 1) 2))
           (= "abc"
              ((ap str) "a" "bc"))
           (= '(a (b c))
              (((ap list)
                'a)
               '(b c))))))

  ("Type Predicates"
    (and (list? '(1))
         (number? 72165972.451)
         (string? "Aura")
         (symbol? 'lmlm)
         (bool? #t)
         (primitive? +)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DESTRUCTURING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "List Destructuring"

  ("Nested Destructuring"
    (let (((a (b c) & d)
           '(1 (2 3) 4 5 6)))
      (and (= a 1)
           (= b 2)
           (= c 3)
           (= d '(4 5 6)))))

  ("Function Destructuring"
    (let ((f
            (fn (a (b & c))
              (list a b c))))
      (= '(1 2 (3))
         ((f 1) '(2 3)))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RECURSION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Recursion"

  ("Factorial Recursive"
    (= (factorial 6) 720))

  ("Tail Recursive Factorial"
    (= (factorial-tail 10)
       3628800))

  ("Recursive Fibonacci"
    (= (fib-rec 12)
       144))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LAZY SEQUENCES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Lazy Sequences"

  ("Naturals"
    (= (take 6 naturals)
       '(0 1 2 3 4 5)))

  ("Primes"
    (= (take 10 primes)
       '(2 3 5 7 11 13 17 19 23 29)))

  ("Fibonacci Stream"
    (= (take 8 fib-stream)
       '(0 1 1 2 3 5 8 13)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PATTERN MATCHING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Pattern Matching"

  ("Point Pattern"
    (= (match '(point 3 4)
         ((point x y)
          (sqrt (+ (* x x)
                   (* y y)))))
       5))

  ("List Pattern"
    (= (match '(1 2 3)
         ((a b c)
          (+ a b c)))
       6))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONTINUATIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Continuations"

  ("Escape Continuation"
    (= (call/cc
         (fn (exit)
           (exit 42)
           0))
       42))

  ("Original Escape Test"
    (do
      (def ok #t)
      (and (= 7
              (call/cc
                (fn (cc)
                  1
                  2
                  (cc 7)
                  (set ok #f))))
           ok)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RANDOMIZED PROPERTY TESTING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Property Testing"

  ("Addition Commutativity"
    (property 1000
      (fn ()
        (let ((a (random-int))
              (b (random-int)))
          (= (+ a b)
             (+ b a))))))

  ("Reverse Identity"
    (property 500
      (fn ()
        (let ((xs (random-list)))
          (= xs
             (reverse
              (reverse xs)))))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EXCEPTION HANDLING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Exceptions"

  ("Divide By Zero"
    (throws?
      (fn ()
        (/ 1 0))
      DivideByZero))

  ("Index Error"
    (throws?
      (fn ()
        (nth '(1 2 3) 99))
      IndexOutOfBounds))

  ("Type Error"
    (throws?
      (fn ()
        (+ "Aura" 5))
      TypeError))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PERFORMANCE BENCHMARKS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Benchmarks"

  ("Million Integer Additions"
    (benchmark
      (repeat 1000000
        (+ 1 1))))

  ("Sort Random Integers"
    (benchmark
      (sort
        (random-list 100000))))

  ("Matrix Multiplication 100x100"
    (benchmark
      (matmul
        (random-matrix 100)
        (random-matrix 100))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CRYPTOGRAPHY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Cryptography"

  ("SHA256"
    (= (sha256 "hello")
       "2cf24dba..."))

  ("AES Encryption"
    (= "Aura"
       (aes-decrypt key
         (aes-encrypt key "Aura"))))

  ("Ed25519 Signature"
    (let ((keys (ed25519-generate)))
      (verify keys
              (sign keys "Aura")
              "Aura")))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMPUTATIONAL MATHEMATICS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(test "Computational Mathematics"

  ("P subset NP"
    (subset? P NP))

  ("SAT Verification"
    (verify-sat formula assignment))

  ("Traveling Salesman Verification"
    (verify-tour graph tour))

  ("P vs NP Status"
    (unknown? 'P!=NP))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; END OF STANDARD TEST SUITE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(summary
  :tests 250+
  :modules '(mathematics algebra calculus trigonometry probability
              statistics linear-algebra graph-theory cryptography
              recursion continuations lazy-sequences pattern-matching
              property-testing benchmarking computational-complexity))
