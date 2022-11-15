%------------------------------------------------------------------------------
tff(man_type,type, man: $tType ).
tff(grade_type,type, grade: $tType ).
tff(john_decl,type, john: man ).
tff(a_decl,type, a: grade ).
tff(f_decl,type, f: grade ).
tff(grade_of_decl,type, grade_of: man > grade ).
tff(created_equal_decl,type, created_equal: ( man * man ) > $o ).

tff(d_man_type,type, d_man: $tType ).
tff(d_grade_type,type, d_grade: $tType ).
tff(d_to_man_decl,type, d_to_man: d_man > man ).
tff(d_to_grade_decl,type, d_to_grade: d_grade > grade ).
tff(d_john_decl,type, d_john: d_man ).
tff(d_got_A_decl,type, d_got_A: d_man ).
tff(d_a_decl,type, d_a: d_grade ).
tff(d_f_decl,type, d_f: d_grade ).

tff(equality_lost,axiom,
    ( ( ! [X: d_man] : ( X = d_john | X = d_got_A )
      & ! [X: d_man,Y: d_man] : ( d_to_man(X) = d_to_man(Y) => X = Y )
      & ! [X: man] : ? [DX: d_man] : d_to_man(DX) = X 
      & d_john != d_got_A
      & ! [X: d_grade] : ( X = d_a | X = d_f )
      & ! [X: d_grade,Y: d_grade] : ( d_to_grade(X) = d_to_grade(Y) => X = Y )
      & ! [X: grade] : ? [DX: d_grade] : ( d_to_grade(DX) = X )
      & d_a != d_f )
    & ( a = d_to_grade(d_a)
      & f = d_to_grade(d_f)
      & john = d_to_man(d_john)
      & grade_of(d_to_man(d_john)) = d_to_grade(d_f)
      & grade_of(d_to_man(d_got_A)) = d_to_grade(d_a) )
    & ( created_equal(d_to_man(d_john),d_to_man(d_john))
      & created_equal(d_to_man(d_john),d_to_man(d_got_A))
      & created_equal(d_to_man(d_got_A),d_to_man(d_john))
      & created_equal(d_to_man(d_got_A),d_to_man(d_got_A)) ) ) ).

tff(prove_formulae,conjecture,
    ( ! [H1: man,H2: man] : created_equal(H1,H2)
    & grade_of(john) = f
    & ? [H: man] : ( grade_of(H) = a )
    & a != f 
    & ~ ! [H1: man,H2: man] : ( created_equal(H1,H2) <=> H1 = H2 ) ) ).

%------------------------------------------------------------------------------