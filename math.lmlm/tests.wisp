(test "complexity theory"

  ("P subset NP"
    (subset? P NP))

  ("SAT verification"
    (verify-sat assignment formula))

  ("P != NP unresolved"
    (unknown? 'P!=NP)))
