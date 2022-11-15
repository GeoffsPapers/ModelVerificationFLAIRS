%------------------------------------------------------------------------------
tff(person_type,type,        person: $tType ).
tff(bob_decl,type,           bob: person ).
tff(child_of_decl,type,      child_of: person > person ).
tff(is_descendant_decl,type, is_descendant: ( person * person ) > $o ).

tff(int_to_person_decl,type,   int_to_person: $int > person ).

tff(people,axiom,
    ( ( ! [P: person] : ? [I: $int] : int_to_person(I) = P
      & ! [I1: $int,I2: $int] : 
          ( int_to_person(I1) = int_to_person(I2) => I1 = I2 ) )
    & ( bob = int_to_person(0)
      & ! [I: $int] : child_of(int_to_person(I)) = int_to_person($sum(I,1)) )
    & ! [A: $int,D: $int] : 
        ( is_descendant(int_to_person(A),int_to_person(D)) <=> $less(A,D) ) ) ).

tff(prove_formulae,conjecture,
    ( ! [A: person,D: person] : ( is_descendant(A,D) => A != D )
    & ! [A: person,C: person,G: person] :
        ( ( is_descendant(A,C) & is_descendant(C,G) ) => is_descendant(A,G) )
    & ! [P: person] : is_descendant(P,child_of(P))
    & ! [P: person] : ? [C: person] : C = child_of(P) ) ).

%------------------------------------------------------------------------------
