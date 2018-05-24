Section PartOne.

Variables A B C D : Prop. 

Theorem impl_distr : (A -> B) -> (A -> C) -> A -> B -> C.
Proof.
Qed.

Theorem impl_comp : (A -> B) -> (B -> C) -> A -> C.
Proof.
Qed.

Theorem impl_perm : (A -> B -> C) -> B -> A -> C. 
Proof.
Qed.

Theorem impl_conj : A -> B -> A /\ B. 
Proof.
Qed.

Theorem conj_elim_l : A /\ B -> A. 
Proof.
Qed.

Theorem disj_intro_l : A -> A \/ B.
Proof.
Qed.

Theorem disj_elim : A \/ B -> (A -> C) -> (B -> C) -> C. 
Proof.
Qed.

Theorem diamond : (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D.
Proof.
Qed.

Theorem weak_peirce : ((((A -> B) -> A) -> A) -> B) -> B.
Proof.
Qed.

Theorem disj_impl_dist : (A \/ B -> C) -> (A -> C) /\ (B -> C).
Proof.
Qed.
 
Theorem disj_impl_dist_inv : (A -> C) /\ (B -> C) -> A \/ B -> C.
Proof.
Qed.

Theorem curry : (A /\ B -> C) -> A -> B -> C.
Proof.
Qed.

Theorem uncurry : (A -> B -> C) -> A /\ B -> C.
Proof.
Qed.

End PartOne.

Section PartTwo.

Variables A B C D : Prop. 

(* 
 * Negation 
 *)

Theorem contrapositive : (A -> B) -> (~B -> ~A). 
Proof.
Qed.

Theorem neg_double : A -> ~~A.
Proof.
Qed.

Theorem tneg : ~~~A -> ~A.
Proof.
Qed.

Theorem weak_dneg : ~~(~~A -> A).
Proof.
Qed. 

(* 
 * Classical logic 
 *)

Theorem em_peirce : A \/ ~A -> ((A -> B) -> A) -> A.
Proof.
Qed.

Theorem peirce_dne : (((A -> False) -> A) -> A) -> ~~A -> A.
Proof.
Qed.

Theorem dne_em : (~~(B \/ ~B)-> (B \/ ~B)) -> B \/ ~B.
Proof.
Qed.

End PartTwo.

Section PartThree.

Variables A B C D : Prop. 

(* 
 * 
 *)

Definition impl_distr : (A -> B) -> (A -> C) -> A -> B -> C := .

Definition impl_comp : (A -> B) -> (B -> C) -> A -> C := .

Definition impl_perm : (A -> B -> C) -> B -> A -> C := . 

Definition impl_conj : A -> B -> A /\ B := . 

Definition conj_elim_l : A /\ B -> A := . 

Definition disj_intro_l : A -> A \/ B := .

Definition disj_elim : A \/ B -> (A -> C) -> (B -> C) -> C := . 

Definition diamond : (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D := .

Definition weak_peirce : ((((A -> B) -> A) -> A) -> B) -> B := .

Definition disj_impl_dist : (A \/ B -> C) -> (A -> C) /\ (B -> C) := .
 
Definition disj_impl_dist_inv : (A -> C) /\ (B -> C) -> A \/ B -> C := .

Definition curry : (A /\ B -> C) -> A -> B -> C := .

Definition uncurry : (A -> B -> C) -> A /\ B -> C := .

(* 
 * Negation 
 *)

Definition contrapositive : (A -> B) -> (~B -> ~A) := . 

Definition neg_double : A -> ~~A := .

Definition tneg : ~~~A -> ~A := .

Definition weak_dneg : ~~(~~A -> A) := .

(* 
 * Classical logic 
 *)

Definition em_peirce : A \/ ~A -> ((A -> B) -> A) -> A := .

Definition peirce_dne : (((A -> False) -> A) -> A) -> ~~A -> A := .

Definition dne_em : (~~(B \/ ~B)-> (B \/ ~B)) -> B \/ ~B := .

End PartThree. 

Section PartFour.

Variable Term : Set.

Variable O : Term.
Variable S : Term -> Term.

Variable Nat : Term -> Prop.
Variable Eq : Term -> Term -> Prop.
Variable Lt : Term -> Term -> Prop.

(* 
 * Axioms
 *)

Hypothesis Zero : Nat O.
Hypothesis Succ : forall x : Term, Nat x -> Nat (S x).
Hypothesis Eqi : forall x : Term, Eq x x.
Hypothesis Eqt : forall (x : Term) (y : Term) (z: Term), (Eq x y /\ Eq x z) -> Eq y z.
Hypothesis Lts : forall x : Term, Lt x (S x).
Hypothesis Ltn : forall (x : Term) (y : Term), Eq x y -> ~ Lt x y.

(* 
 * 
 *)

Theorem Nat_ex : forall x : Term, Nat x -> exists y : Term, Nat y /\ Eq x y.
Proof.
Qed.

Theorem Eq_refl : forall (x : Term) (y : Term), Eq x y -> Eq y x.
Proof.
Qed.

Theorem Eq_not : ~ exists x : Term, Eq x O /\ Eq x (S O).
Proof.
Qed.

(*
 * 
 *)

Theorem Nat_succ2 : forall x : Term, Nat x -> Nat (S (S x)).
Proof.
Qed.

Theorem Lt_Neq : forall (x : Term) (y : Term), Lt x y -> ~ Eq x y.
Proof.
Qed.

Theorem Not_EqLt : ~ exists x : Term, exists y : Term, Eq x y /\ Lt x y.
Proof.
Qed.

End PartFour.

Section PartFive.

Inductive nat : Set := 
| O : nat
| S : nat -> nat.

Fixpoint plus (m n:nat) {struct m} : nat :=
match m with
| O => n
| S m' => S (plus m' n)
end.

(* Problem 1 *)

Fixpoint plus2 (m:nat) {struct m} : nat -> nat :=
match m with
  ...
end.

Fixpoint double (m:nat) {struct m} : nat :=
match m with
  ...
end.

Fixpoint mult (m n:nat) {struct m} : nat :=
match m with
  ...
end.

Fixpoint sum_n (n:nat) {struct n} : nat :=
match n with
  ...
end.

(* Problem 2 *)

Lemma plus_n_0 : forall n:nat, n = plus n O.
Proof.
  ...
Qed.

Lemma plus_n_S : forall n m:nat, S (plus n m) = plus n (S m).
Proof.
  ...
Qed.

Lemma plus_com : forall n m:nat, plus n m = plus m n.
Proof.
  ...
Qed.

Lemma plus_assoc : forall (m n l:nat), plus (plus m n) l = plus m (plus n l).
Proof.
  ...
Qed.

(* Problem 3 *)

Theorem sum_n_plus : forall n:nat, double (sum_n n) = plus n (mult n n).
Proof.
  ...
Qed.

End PartFive.

Section PartSix. 

Inductive nat : Set := 
| O : nat
| S : nat -> nat.

Inductive lt : nat -> nat -> Prop :=
| lt_O : forall n:nat, lt O (S n)
| lt_S : forall (m:nat) (n:nat), lt m n -> lt (S m) (S n).

Inductive eq : nat -> nat -> Prop :=
| eq_O : eq O O
| eq_S : forall (m n:nat), eq m n -> eq (S m) (S n).

(**********)
(* 1 *)
(**********) 

Lemma lt_one_two : lt (S O) (S (S O)).
Proof.
Qed.

Lemma no_lt_zero : forall (m:nat), ~(lt m O).
Proof.
Qed.

Lemma exists_greater : forall (x:nat), exists y:nat, lt x y.
Proof.
(* use nat_ind; do not use elim/induction. *)
Qed.

Lemma exists_greater' : forall (x:nat), exists y:nat, lt x y.
Proof.
(* may use elim/induction. *)
Qed.

Lemma eq_nat : forall x:nat, eq x x.
Proof.
(* use nat_ind; do not use elim/induction. *)
Qed.

Lemma eq_nat' : forall x:nat, eq x x.
Proof.
(* may use elim/induction. *)
Qed.

Lemma eq_trans : forall (x y z:nat), eq x y -> eq y z -> eq x z.
Proof.
Qed.

Lemma eq_succ : forall x:nat, ~(eq x O) -> exists y:nat, eq (S y) x.
Proof.
Qed.

(**********)
(* 2 *)
(**********) 

Inductive le : nat -> nat -> Prop :=
| le_n : forall n, le n n
| le_S : forall (m n:nat), le m n -> le m (S n).

Lemma le_zero : forall n:nat, le O n.
Proof.
Qed.

Lemma le_n_S : forall n m:nat, le n m -> le (S n) (S m).
Proof.
(* use le_ind; do not use elim/induction. *)
Qed.

Lemma lt_le : forall (m n:nat), lt m n -> le m n.
Proof.
(* use lt_ind; do not use elim/induction. *)
Qed.

Lemma lt_le' : forall (m n:nat), lt m n -> le m n.
Proof.
(* may use elim/induction. *)
Qed.

(**********)
(* 3 *)
(**********) 

Theorem le_lt_eq : forall (m n:nat), le m n -> lt m n \/ eq m n.
Proof.
Qed.

(**********)
(* 4 *)
(**********) 

Inductive le' (n:nat) : nat -> Prop :=
| le_n' : le' n n
| le_S' : forall m:nat, le' n m -> le' n (S m).

Lemma le_le' : forall (m n:nat), le m n -> le' m n.
Proof.
Qed.

Lemma le'_le : forall (m n:nat), le' m n -> le m n.
Proof.
Qed.

End PartSix.


Section Paren. 

Inductive E : Set :=
| LP : E
| RP : E.

Inductive S : Set := 
| eps : S
| cons : E -> S -> S.

Fixpoint concat (s1 s2:S) {struct s1} : S :=
match s1 with
| eps => s2
| cons e s2' => cons e (concat s2' s2) end.

Inductive mparen : S -> Prop :=
(* fill in the definition *) 

Inductive lparen : S -> Prop :=
(* fill in the definition *) 

Theorem mparen2lparen : forall s:S, mparen s -> lparen s.
Proof.
Qed.

Theorem lparen2mparen : forall s:S, lparen s -> mparen s.
Proof.
Qed.

End Paren.

Section CompleteInduction.

Inductive nat : Set :=
| O : nat
| S : nat -> nat.

Inductive lt : nat -> nat -> Prop :=
| lt_O : forall n:nat, lt O (S n)
| lt_S : forall (m:nat) (n:nat), lt m n -> lt (S m) (S n).

Variable P : nat -> Prop.

Theorem nat_complete_ind : P O -> (forall n:nat, (forall z:nat, lt z n -> P z) -> P n) -> forall x:nat, P x.
Proof.
Qed.

End CompleteInduction.

