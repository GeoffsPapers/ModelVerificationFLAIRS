%------------------------------------------------------------------------------
tff(person_type,type,        person: $tType ).
tff(bob_decl,type,           bob: person ).
tff(child_of_decl,type,      child_of: person > person ).
tff(is_descendant_decl,type, is_descendant: ( person * person ) > $o ).

tff(int_to_person_decl,type, int_to_person: $int > person ).

tff(people,interpretation,
%----Domain for type person is the integers
    ( ( ! [P: person] : ? [I: $int] : int_to_person(I) = P
%----The type promoter is a bijection (injective and surjective)
      & ! [I1: $int,I2: $int] : 
          ( int_to_person(I1) = int_to_person(I2) => I1 = I2 ) )
%----Mapping people to integers. Note that Bob's ancestors will be interpreted 
%----as negative integers.
    & ( bob = int_to_person(0)
      & ! [I: $int] : child_of(int_to_person(I)) = int_to_person($sum(I,1)) )
%----Interpretation of descendancy
    & ! [A: $int,D: $int] : 
        ( is_descendant(int_to_person(A),int_to_person(D)) <=> $less(A,D) ) ) ).

%------------------------------------------------------------------------------
