(**************************************************************)
(** * Coq for Sigpl Folk *)
(**************************************************************)

(** Basic definitions of type and term constructions using
   inductive types and recursive function construction.

   Mostly written by Gyesik Lee based on the lecture notes
   by Sungwoo Park.
*)


(**************************************************************)
(** * Contents
   - Propositional Logic
    -- Natural deduction system
    -- Logical equivalence
   - First-Order Logic
    -- Universal quantification
    -- Existential quantification
   - Dataypes
    -- First-order logic with datatypes
    -- Inductive definitions
    -- Recursive functions
*)
(**************************************************************)

(** * Chapter 1 Propositional Logic. *)

(** We use sections to distinguish several similar cases *)

Section propositional_logic.  

(** ** 1.1 natural_deduction_system *)

(** We use propositional variables A, B, C, etc. *)

Variables A B C : Prop.

(** Sorts in Coq: there are three sorts

   - Prop : representing the class of logical statements,

   - Set : mainly used to describe data types and program specifications

   - Type : the sort "Set" itself is of type "Type",
   more accurately of type "Type_0".
   Then Type_0 is of type Type_1, and so on.
*)

(** Basic connectives are already implemented in Coq *)

Print conj.
Print and.
Print not.

Print and_ind.
Print and_rec.
Print and_rect.

(** Examples of inductive types and their induction principles.

   - If an inductive type is defined then some induction principles
   related to the inductive type are also automatically generated.

   - The induction principle corresponds to the elimination rules
   and will be used afterwards as the bases of the tactics such as
   induction or elim.
*)

(** *** Natural numbers *)

Inductive natural : Set :=
| nZ : natural
| nS : natural -> natural.

(** natural = nat *)

Print nat.

(** *** Implication
   The introductio rule for implication is a special case
   of dependent product types and already implemented in Coq.
*)

Lemma E_imp1 : A -> A.
Proof.
intro.
(** The tactic "[intro]" corresponds to introduction rule. *)
exact H.
(** "[exact]" means the exact proof term. *)
Qed.

Lemma E_imp2 : A -> B -> A.
intros.
exact H.
Qed.

Lemma E_imp3 : (A -> B) -> (A -> B).
intros H1 H2.
apply H1.
(** The tactic "[apply]" corresponds to elimination. *)
exact H2.
Qed.

(** *** Remark
   - Giving concrete names to the assumptions is recommended.

   - It is better for the computational part,
   names chosen by Coq could cause confusion.
*)

(** *** Conjunction *)

Print and.

Lemma E_imp_conj1 : (A -> (B -> C)) -> ((A /\ B) -> C).
intros H1 H2.
apply H1.

elim H2.
(** "[elim]" is based on the induction rule
   along the line of the corresponding inductive type.

   In this case, the elimination rule for the conjunction /\.
*)
intros H3 H4.
exact H3.

elim H2.
tauto.
(** "[tauto]" is a tactic which automatically proves
   propositional tautologies. 
*)
Qed.

Lemma E_imp_conj1' : (A -> (B -> C)) -> ((A /\ B) -> C).
intros H1 H2.
elim H2.
exact H1.
Qed.

Lemma E_imp_conj1'' : (A -> (B -> C)) -> ((A /\ B) -> C).
tauto.
(** [tauto] is relatively powerful. *)
Qed.

Lemma E_imp_conj : ((A /\ B) -> C) -> (A -> (B -> C)).
tauto.
Qed.

Lemma E_imp_conj' : ((A /\ B) -> C) -> (A -> (B -> C)).
intros.
apply H.
split.
(** "[split]" is a special case of the tactic "[constructor]"
   where there is only one constructor for inductive types

   [constructor] applies introduction rules for each constructor
   of an inductive type.
*)
exact H0.
exact H1.
Qed.

Lemma E_imp_conj'' : ((A /\ B) -> C) -> (A -> (B -> C)).
intros.
apply H.
split; [exact H0 | exact H1].
(** " [;]" is a kind of tactical, i.e., combination of
   tactics which should be applied continuously. 

   [ [... | ... | ... ] ] depends on how may subgoals are
   created after the previous tactic.
*)
Qed.

Lemma E_imp_conj2 : ((A /\ B) -> C) -> (A -> (B -> C)).
intros.
apply H.
split; assumption.
Qed.

Lemma E_imp_conj2' : ((A /\ B) -> C) -> (A -> (B -> C)).
tauto.
Qed.

(** *** Disjuction
   Disjuction has two constructors 
*)

Print or.
Check or_ind.
Print or_ind.

Lemma E_or1 : A -> (A \/ B).
intro H.
left.
(** [left] or [right] is the introduction rule
   where there are two constructor. 
*)
exact H.
Qed.

Lemma E_or1' : A -> (A \/ B).
tauto.
Qed.

(** ** Remark
   Basic way of using proof tactics

   - bottom-up proof: introduction first, then elimination

   - It is because a normalized proof has a form of a sandglass.

   - Cf. The Sandglass Theorem. 
*)

(** The following example shows the the order of tactics
   is important.
*)

Lemma E_or2' : A \/ B -> B \/ A.
intro H.
left.
(* got stuck *)
Admitted.

(** [Admitted] denotes that we assume that the claim is accepted. *)

Lemma E_or2 : A \/ B -> B \/ A.
intro H.
elim H.

intro H1.
right; assumption.
(** [assumption] tries to find some assumptions whose type
   matches exactly modulo beta-conversion to the conclusion.

   But it is recommended to avoid using [assumption] if you
   want to have a more efficient proof terms.
   Instead, use [exact].

   The same holds for [tauto] or [auto] which will be introduced
   later.
*)

tauto.
Qed.

(** *** Truth and Falsehood *)
Print True.
Print False.

(** Elimination rule for True is not interesting. *)

Print True_ind.

(** Elimination rule for False is omnipotent *)

Print False_ind.

(** The following lemma is called "intuitionistic" falsehood rule. *)

Lemma false_all : False -> C.
intro.
elim H.
(** Look at the induction principle for False
   by using [Print False].
*)
Qed.

(**  A <-> B stands for A -> B and B -> A *)

Lemma and_true : A /\ True <-> A.
split.
intro H; elim H; intros; assumption.

intro; split.
exact H.

exact I.
Qed.

Lemma or_false : A \/ False <-> A.
tauto.
Qed.

(** *** Negation of a proposition *)

Print not.

Lemma absurdity' : A -> ~ A -> False.
intros H1 H2.
unfold not in H2.
apply H2; exact H1.
Qed.

Lemma absurdity'' : A -> ~ A -> False.
intros H1 H2.
contradiction.
(** [contradiction] looks for a assumption
   which is equivalent to [False] 
*)
Qed.


(** ** 1.2 Logical equivalence *)

(** Triple negation is equivalent to one simple negation. *)

Lemma triple_non : ~ ~ ~ A <-> ~ A.
split; intro H1.
intro H2.
elim H1.
intro H3.
contradiction.

intro H2.
contradiction.
Qed.

End propositional_logic.

(** * Chapter 2. Proof Terms *)

(** ** Proof Terms *)

Section proof_terms.

(** Print shows the proof terms constructed
   by exactly following the term construction rules.
*)

Variables A B C : Prop.

(** Elimination rule for conjuction *)

Lemma E_conj : A /\ B -> A.
intro H1.
elim H1.
intros H2 H3.
exact H2.
Qed.

Print E_conj.

(** Compare E_conj with and_ind. *)

Check and_ind.

(** *** [prod] type vs. [and] type *)

Print prod.

Print fst.
Print snd.

Print prod_ind.
Check and_ind.

(** lambda abstraction corresponds to [fun] syntax in Coq *)

Lemma identity : A -> A.
intro x.
exact x.
Qed.

Print identity.

(** *** alpha-conversion
   alpha-conversion is already implemented 
*)

Lemma alpha_conv : (forall x: Prop, x) -> forall y:Prop, y.
intro H.
exact H.
Qed.

(** however ... *)

Lemma alpha_conv' : forall x: Prop, x -> forall y:Prop, y.
intros.
(* no chance, so be careful with parentheses *)
Admitted.

Lemma E_imp5 : A -> A.
intro x; assumption.
Qed.

Print E_imp5.

Lemma E_imp5' : A -> A.
auto.
(** "[auto]" has the ability of using proved lemmas from
   the uploaded library.
*)
Qed.

Print E_imp5'.

Lemma or_left : A -> A \/ B.
intro x.
left.
exact x.
Qed.

Print or_left.

Lemma or_right : B -> A \/ B.
Admitted.

Check or_ind.

Lemma truth : True.
exact I.
Qed.

Print truth.

Lemma falsehood : False -> C.
intro e; elim e.
Qed.

Print falsehood.
Check False_ind.

End proof_terms.

(** * Chapter 3. First order Logic *)

(** ** 3.1 Terms *)


(** Loading standard or personal libraries are
   sometimes necessary 
*)

Require Import Arith.
Require Import Bool.

Section Terms.

(** Constructors for natural numbers are O and S *)

Print nat.

(** Constructor for boolean values are true and false.

   Don't confuse them with True and False. 
*)

Print bool.

End Terms.

(** ** 3.3 Universal quantification *)

Section universal.

Print eq.
Check (@eq nat).

Lemma zero_zero : 0 = 0.
reflexivity.
Qed.

Lemma one_one : 1 = 1.
auto.
Qed.

(** and so on, however how to prove
   n = n for all natural numbers?

   We need quantification. 
*)

Lemma all_all : forall (n : nat), n = n.
intro n.
(** This means that n is arbitrary, but fixed. *)
reflexivity.
Qed.

(** substitution is already implemented *)

Variables  A B : nat -> Prop. 

Lemma all_and :
  (forall x:nat, A x /\ B x) ->
  (forall x:nat, A x) /\ (forall x:nat, B x). 

intro H; split; intro x.

cut (A x /\ B x).
tauto.
apply H.

elim (H x).
tauto.
Qed.

End universal.

(** ** 3.4 Existential quantification *)

Section existential.

Variables A B C : nat -> Prop.

Print ex. 

(** exists (x:A), P  = ex A (fun x:A => P x) *)

Theorem ex_imp_ex : 
  forall (A : Type) (P Q :A -> Prop),
    (exists x, P x) -> (forall x:A, P x -> Q x) -> (exists x, Q x).

intros A' P Q H H0.
elim H.
intros a H1.
exists a.
(** Instantiation of a concrete example. Then a proof that
   the instnatiation satisfies the required property should follow.
*)
apply H0.
exact H1.
Qed.

Lemma exnot_notall : 
  (exists x, ~ A x) -> ~ forall x, A x.

intro H1. 
red.
intro H2.
elim H1.
(** This corresponds to [ex_ind] *)
intros x H3.
apply H3.
apply H2.
Qed.

End existential.

(** ** 3.5 Examples *)

Section examples.

Variables A B : Type.

Print nat.
Print eq.
Check (@eq nat).

Lemma eq_reflexive : forall x:A, x = x.
intro x; reflexivity.
Qed.

Check refl_equal.

Lemma eq_transitive : forall l m n : A, l = n -> n = m -> l = m.
intros l m n H1 H2.
rewrite H1.
rewrite H2.
reflexivity.
Qed.

Check trans_equal.
  
Lemma eq_transitive' : forall l m n : A, l = n -> n = m -> l = m.
intros l m n H1 H2.
subst l.
assumption.
Qed.

Check sym_eq.

Print le.
Print lt.

Print le_n_Sn.

Lemma le_n_Sn' : forall n:nat, n <= S n.
intro n.
apply le_S.
apply le_n.
Qed.

Lemma le_n_Sn'' : forall n:nat, n <= S n.
intro n.
constructor 2.
constructor.
(** [constructor] applies the constructors used for
   the definition of inductive types.
*)
Qed.

Lemma le_n_Sn3 : forall n:nat, n <= S n.
intro n.
repeat constructor.
Qed.

Lemma eq_not_lt : forall n m, n = m -> ~ n < m.
intros n m H.
apply le_not_lt.
rewrite H.
(** [rewrite] corresponds to [eq_ind]. *)
constructor.
Qed.

Lemma eq_not_lt' : forall n m, n = m -> ~ n < m.
intros n m H1 H2.
subst n.
unfold lt in H2.
(** Unfolding definitions. *)
Admitted.

(** *** Inductively defined predicates *)

(** Nat predicate *)

Inductive Nat : nat -> Prop :=
| Zero : Nat 0
| Succ : forall n:nat, Nat n -> Nat (S n).

Check Nat_ind.

Lemma Nat2 : Nat (S (S 0)).
apply Succ.
apply Succ.
apply Zero.
Qed.

Lemma Nat2' : Nat (S (S 0)).
repeat constructor.
Qed.

Lemma Nat_all : forall x:nat, Nat x.
intro x.
induction x; constructor; try assumption.
Qed.

Lemma Nat_eq : forall x:nat, Nat x -> exists y, Nat y /\ x = y.
intros x H.
exists x; split.
exact H.
reflexivity.
Qed.

Check sym_eq.

Lemma not_zero_succ : ~ (exists x:nat, x = 0 /\ x = S 0).
intro H.
elim H.
intros x H1.
elim H1.
intros H2 H3.
subst x.
(* elim n_Sn with 0.*)
elim eq_not_lt with 0 1.
exact H3.
unfold lt.
apply le_n.
Qed.

End examples.

(** ** 3.6 Proof terms *)

Print Nat_eq.

Print not_zero_succ.

(** * Chapter 4. Datatypes *)

(** ** 4.1 Basic constructors for datatypes *)

(** -> : function type is a special case of \Pi (x:A). B where
   x does not occur free in B *)

Print prod.
Print fst.
Print snd.

(** *** Disjoint sum *)

Print sum.
Check sum_ind.

(** *** unit *)

Print unit.
Check unit_ind.
Check unit_rect.

(** *** empty type
   Not really interesting. False is much more important. 
*)

Print Empty_set.
Check Empty_set_ind.

(** *** sumbool : if ... then ... else
   if...then...else is a case distinction based on
   inductive types which has exactly two constructors.
*)

Print sumbool.

Check eq_nat_dec.
Lemma eq_bool_dec : forall t s : bool, {t = s} + {t <> s}.

double induction t s.

left; reflexivity.
right; discriminate.
(** [discriminate] compares the head of terms.
   The comparison is made purely syntactically.

   That, different name, then different. 
*)
right; discriminate.
left; reflexivity.
Defined.

(** There is a difference between [Qed] and [Defined].

   [Qed] makes the proof opaque while [Defined] makes it transparent.
   
   This difference will be clear when one wants to
   use some information from proofs.

   In this tuturial, however, not discussed in detail.
*)

Check bool_dec.

(** Some functions on boolean values from the library Init.Datatyes *)

Print orb.
Print andb.
Print implb.

(** The following two definitions are equivalent. *)

Fixpoint neg_bool (n:nat) : bool :=
  if n then false else true.

Fixpoint neg_bool' (n:nat) : bool :=
  if (eq_nat_dec n 0) then false else true.

Eval compute in (neg_bool 0).
Eval compute in (neg_bool 1).
Eval compute in (neg_bool' 0).
Eval compute in (neg_bool' 1).

(** ** 4.3 Primitive recursion *)

(** Recursive definition of a function is always made
   along the line of an inductive type. *)

Fixpoint double (n:nat) : nat :=
  match n with
    | 0 => 0
    | S m => S (S (double m))
  end.

Print plus.

(** When there are more than one inductive types in arguments,
   then the argument on which the recursion is based should be
   mentioned concretely by using [struct] 
*)

Fixpoint plus' (n m : nat){struct n} :=
  match n with
    | 0 => m
    | S p => S (plus p m)
  end.

Print plus.

(** *** Lists *)

Require Import List.

(** list is a polymorphic type *)

Print list.

Check list_ind.
Check list_rect.
Check list_rec.

(** append is predefined in the List library *)

Print app.

Fixpoint append (A:Type) (l m : list A) {struct l}: list A :=
  match l with
  | nil => m
  | a :: l1 => a :: app l1 m
  end.

(** [length] measures the lengths of lists. *)

Print length.

(** ** 4.4 First-order logic with datatypes *)

(** This part is already done above because in CIC, everything has a type. *)

(** *** 4.5 Natural deduction for perdicates
   and 4.6 Induction on terms *)

(** *** [less than] and [equal to] *)

(** "less than" is already defined, but new, equivalent definition is
   of course possible. *)

Print lt.
Print le.

Inductive LT : nat -> nat -> Prop :=
| Zlt : forall n, LT 0 (S n)
| Slt : forall n m, LT n m -> LT (S n) (S m).

(** Elimination rule for LT *)

Check LT_ind.
 
Lemma LT_n_Sn : forall n, LT n (S n).

induction n; constructor; try assumption.
Defined.

Lemma LT_S_m : forall n m, LT n m -> LT n (S m).
intros n m.
induction 1; constructor.

assumption.
Defined.

(** lt and LT are equivalent *)

Lemma lt_LT : forall n m : nat, n < m <-> LT n m.
unfold lt.
intros n m; split. 

(* left to right *)
induction 1. 
apply LT_n_Sn.

apply LT_S_m; exact IHle.

(* right to left *)
induction 1 as [ | n m H IH];apply le_n_S; [apply le_O_n | assumption].
(** induction ... as [...  | ...] uses the introduction patter
   for variables and assumptions which should be introduced.
*)
Defined.

(** Attention: In the name of a theorem,
   O is the capital alphabet O, not the numeral 0.
*)

(** elimination of LT *)

Lemma not_LT_m_O : forall (m:nat), LT m O -> False.
intros m H.
cut (m < O).
apply lt_n_O.
elim lt_LT with m O; intros.
exact (H1 H).
Defined.

Lemma not_LT_m_O' : forall (m:nat) (P:Prop), LT m O -> P.
intros m P H.
elim not_LT_m_O with m.
exact H.
Defined.

(** *** EQ : equality *)

(** [eq] is a polymorphic type which stands for the
   equality modulo beta-conversion of two terms of the same type.
*)

Print eq.

Definition Eq := @eq nat.

Inductive EQ : nat -> nat -> Prop :=
| Zeq : EQ O O
| Seq : forall n m, EQ n m -> EQ (S n) (S m).

(** Eq and eq are equivalent *)

Lemma EQ_n : forall n, EQ n n.
induction n as [ | n IH]; constructor; apply IH.
Defined.

Lemma Eq_EQ : forall n m : nat, Eq n m <-> EQ n m.
unfold Eq.
intros n m; split.

(* left to right *)
induction 1.

apply EQ_n.

(* right to left *)
induction 1.

exact (refl_equal O).

rewrite IHEQ.
reflexivity.
Defined.

Lemma not_EQ_S_O : forall m, ~ EQ O (S m).
(* similar to not_LT_m_O *)
Admitted.

Lemma not_EQ_O_S : forall m, ~ EQ (S m) O.
(* similar to not_LT_m_O *)
Admitted.

(** ** 4.6 Induction on terms *)

(** Each inductive type usually has induction principles
   for each sort: Prop, Set, Type.

   The induction principles will be automatically created by Coq
   when an inductive type is defined.
*)

Check nat_ind.
Check nat_rec.
Check nat_rect.

Check LT_ind.
Check le_ind.

Check bool_ind.

(** Some examples of proofs using induction. *)

Lemma le_n' : forall n, n <= n.
induction n; constructor.
Defined.

(** *** 4.7 Examples
   and 4.8 Induction on predicates 
*)

Lemma Exp1 : forall n : nat, EQ n n.
induction n as [| n IHn]; constructor; exact IHn.
Defined.

(** however, eq don't need induction *)

Lemma Exp1' : forall n : nat, n = n.
intro n; exact (refl_equal n).
Defined.

Lemma Exp2 : forall x y z : nat, x = y -> y = z -> x = z.

(* in fact, no need for induction *)
intros x y z H1 H2.
rewrite H1; rewrite <- H2.
reflexivity.
Defined.

(** However, rewrite tactic use an induction on eq.
   Look at the proof term of Exp2 such as eq_ind. *)

Print Exp2.
Check eq_ind.
Check eq_ind_r.

(** Working with EQ, we need induction *)

Lemma Exp2' : forall x y , EQ x y -> forall z:nat, EQ y z -> EQ x z.

(** the following proof differs from that of the text

   Note that we start with induction on the first premise
   instead of using induction on x.

   This corresponds to Section 4.8 Induction n predicates *)

induction 1.

tauto.

destruct z; intro H1.
elim (not_EQ_O_S) with m.
exact H1.

constructor.
apply IHEQ.
inversion H1.
(** [inversion] derives all necessary conditions for each
   constructor of an inductive type.
*)
exact H3.
Defined.

(** Compare Exp2 and Exp2' *)

Print Exp2'.
Print Exp2.

(** Caution: the following way should be handled with care
   
   It also demonstrates that arbitrary use of "intros" could
   cause problems. *)


Lemma Exp2'' : forall x y z, EQ x y -> EQ y z -> EQ x z.
induction 1.
admit.
(** [admit] is a tactic to assume that a case is resolved.

   In this case we used [admit] since it is easy to prove.

   But the next inductive case is problematic.
*)

induction z.

admit.
intro.
constructor.
(** and ??? *)
Admitted.

(** here is the solution *)

Lemma Exp2''' : forall x y z, EQ x y -> EQ y z -> EQ x z.
intros x y z H.

(** The problem above is caused by the position of "z"
   that is, it is general enough.

   If you use "intro z" then it means that "z" is arbitrary,
   but it is fixed.
   But the proof above demands that some induction hypothesis
   should hold for "all z".

   That is z is made fixed too early, and we need to revoke
   the introduction of z. *)

generalize z; clear z.

(** or simply use [generalize dependent z]. *)

(** now we can do the same proof as for Exp' *)
induction H.

tauto.
Admitted.

(** ** Induction on inductive predicates *)

Lemma lt_le : forall n p : nat, n < p -> n <= p.
unfold lt.
intros n p H.

induction H.

repeat constructor.

constructor.
exact IHle.
Qed.

(** The following lemma shows why induction on inductive predicates
   is important. 
*)

Lemma lt_le' : forall n p : nat, n < p -> n <= p.
unfold lt.
intros n p H.
induction n. admit.

induction p.
elim (le_Sn_O (S n)).
exact H.
(* don't know how to go further ... *)
Admitted.

(** *** 4.9 Definitional equality *)

(** This section corresponds to Section 7.1.2.2 Conversion Strategies
   in Coq'Art *)

(** There are 4 conversion forms of reductions to perfom:

   - beta to reduce all expressions of the form "(fun x : T => e) v",

   - delta to reduce definitions of constants and functions,

   - iota to reduce pattern matching expressions and recursive functions,

   - zeta to reduce expressions of the form "let x = v in e".
*)

Lemma simpl_pattern_example : 3 * 3 + 3 * 3 = 18.
simpl (3 * 3) at 2.

lazy beta iota delta [mult].
cbv beta iota delta [plus].
reflexivity.
Qed.

Lemma simpl_pattern_example' : 3 * 3 + 3 * 3 = 18.
simpl; reflexivity.
Qed.



