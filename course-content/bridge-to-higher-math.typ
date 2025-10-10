//#import "@preview/kunskap:0.1.0": *
#import "@preview/grape-suite:3.1.0": exercise
#import exercise: project


#show: project.with(
    title: [Bridge to Higher Mathematics],
    seminar: [Math065],
    faculty: [George McNinch],
    semester: [Fall 2025, Tufts University],
    date: datetime.today().display("[month repr:long] [day], [year]")
)

#import "@preview/ctheorems:1.1.3": *
#show: thmrules

// #let question = thmbox("question", "Question", base_level: 0, fill: rgb("#4d9bdb25"))
#let question = thmbox("question", "Question", base_level: 0, fill: rgb("#155DFC33"))



#import "@preview/cetz:0.4.1" // drawing like tikz

#import "@preview/commute:0.3.0": node, arr, commutative-diagram

#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))

#let corollary = thmplain(
    "theorem",
    "Corollary",
    base: "theorem",
    titlefmt: strong
)
#let definition = thmbox("theorem", "Definition", inset: (x: 1.2em, top: 1em), fill: rgb("#eeffee"))

#let proposition = thmbox("theorem", "Proposition", inset: (x: 1.2em, top: 1em), fill: rgb("#eeffee"))

#let proof = thmproof("proof", "Proof")

#let remark = thmplain("theorem","Remark", inset: (x: 0em, top: 0em))

// .with(numbering: none)

#let example = thmplain("theorem","Example", inset: (x: 0em, top: 0em))

#let fact = thmbox("theorem","Fact", inset: (x: 1.2em, top: 1em), fill: rgb("#eeffee"))

#set enum(numbering: "(a).")  


#outline(depth: 2)
#pagebreak()

= Week 1 (week of 2025-09-01) 
== Logical propositions and quantifiers

When writing about mathematics, we will often use the language of
#highlight[predicate logic] or #highlight[first-order logic].

First of all, a #highlight[proposition] is a statement that can be
classified as either true or false.

We can combine proposition to form new ones:
#definition[
Let $P$ and $Q$ be propositions:

    - the proposition $P and Q$ (read: "$P$ and $Q$") is true if both $P$ and $Q$ are true.
    - the proposition $P or Q$ (read: "$P$ or $Q$") is true if either $P$ is true or $Q$ is true (or both, of course).
    - the proposition $not P$ (read: "not $P$") is true if $P$ is false.
    - the proposition $P => Q$ (read: "$P$ implies $Q$") is equivalent to $Q or not P$.
]

For example:

- $2 > 0$ is a proposition (and it is true).
- $3 = 0$ is a proposition (and it is false).
- The proposition $(2 > 0) and (3 = 0)$ is false, while $(2 > 0) or (3 = 0)$ is true.

#definition[
    A logical predicate is family of propositions depending on a variable.

    More precisely, if $a$ is a variable, we can consider a
    proposition $Phi a$ for each possible value of $a$; we say that
    $Phi a$ is a predicate. ]

For example:

- the statement $a^2 - 1 < 0$ is a predicate $Phi a$ depending on the
  variable $a$. For real numbers $a$, the corresponding proposition
  $Phi a$ is true for $a$ in the interval $(-1,1)$ and false
  otherwise.

#definition[ If $a$ is a _variable_ and $Phi$ is a logical _predicate_
    which depends on $a$, we write

    - $forall a, Phi a$ for the proposition that $Phi a$ holds
      #highlight[for all] possible value of the variable $a$.

    - $exists a, Phi a$ for the proposition that #highlight[there
      exists] _some_ value of the variable $a$ for which the
      proposition $Phi a$ is true.

    - $exists ! a, Phi a$ for the proposition that #highlight[there
      exists a _unique_] value of the variable $a$ for which the
      proposition $Phi a$ is true.  ]<defn:quantifiers>

Here are some examples:

- The proposition $forall a in RR, a^2 >= 0$ means that for all real
  numbers $a$, the condition $a^2 >= 0$ holds. This proposition is
  true!

- The proposition $exists a in RR, a^2 - 4 = 0$ means that there
  exists real numbers $a$ for which the condition $a^2 - 4 = 0$. In
  fact, $a = 2$ and $a = -2$ both work, so the proposition is true.

- The proposition $exists ! a in RR, a^3 = -8$ means that there exists
  a unique real number $a$ satisfying the indicated equation. In fact
  $a= -2$ is the only solution, so the proposition is true.


== Sets

We now introduce the language of set theory which is the basic notation
used for reading and writing Mathematics.
 
We need to start somewhere, so although this is not a proper
definition, we call a collection of objects a #highlight[set].

For example:

- the collection of all students in our class is a set

- the collection of all negative real numbers is a set

  the collection of all pairs $(n,m)$ of natural numbers is a set

=== Notations for standard mathematical sets

There are some sets of numbers that are used over and over in Math and
we reserve some particular letters to design them.

- $NN={ 0, 1, 2, 3, ... }$ is the set of #highlight[natural numbers].
- $ZZ = { ... -2, -1, 0, 1, 2, ... }$ is the set of #highlight[integers] ("_zahlen_" in German).

- $QQ$, the set of #highlight[rational numbers] is

  $ QQ = { n slash m | "for integers" n,m "with" m != 0}, $

  where fractions satisfy the condition $n slash m = a slash b$ if and
  only if $n b = m a$.

  ($QQ$ as in "q" for "quotient").

- $RR$, the set of #highlight[real numbers] that you know from calculus. 
- $CC$, the set of #highlight[complex numbers], where a complex number $z$ has the
  form $z = a + b i$ for real numbers $a$ and $b$.


=== Basic properties of sets.

We indicate that an object $a$ is a member of a set $A$ using the
symbol $a in A$. For example $2 in NN$ and $-2 in ZZ$, while
$1 slash 2 in QQ$ but $1 slash 2 in.not ZZ$.

By convention, we will normally denote sets with capital letters, and
elements with lower-case letters. Thus $a,b in A$.

For sets with a finite number of elements, we can specify the set by
just listing the elements. For example, if $A$ denotes the set
consisting of the first three letters of the English alphabet, then we
can simply write $A = {a,b,c\}.$

Sometimes we specify a set using #highlight[set builder notation]. This means
that we indicate some #highlight[predicate] required for membership in the set.
Thus $ B = { a in A | Phi a} $ is the set of all elements $a$ in
$A$ for which the predicate $Phi$ is true.

This should be read: "$B$ is the set of all $a$ in $A$ _such that_
$Phi a$ holds."
    
For example, the set $E$ of even integers can be expressed in set
builder notation using the predicate "is even"; thus we can write $ E
= { x in ZZ | x "is even"} $ read this as: "$E$ is the set of all $x$ in $ZZ$
_such that_ $x$ is even".

#definition[
    If $A$ and $B$ are sets, then $A = B$ provided that $x in A <=> x in B$
]

#definition[
    When every element of a set $A$ is also an element of another set $B$,
    we say that $A$ is a #highlight[subset] of $B$ and write $A subset.eq B$.

    A more precise statement is as follows: if $forall a in A$ we
    have $a in B$, then $A subset.eq B$.

    Note that $A subset.eq B$ allows the possibility that $A$ and $B$
    are equal. The condition $A subset B$ -- or more precisely $A subset.neq B$ --
    is defined by $A subset.eq B$ and $exists b in B, b in.not A$.
].<defn:subset>


#example[
    + The number 2 is a natural number. We say that 2 #highlight[is an
        element of] -- or #highlight[is a member of] - the set of
        natural numbers, and we indicate this by writing $2 in NN$.
    
    + The notation ${ 2 }$ means a set whose only element is the
       number 2.  It is not correct to write that ${ 2} in NN$. Instead,
       we write ${ 2} subset.eq NN$.

    + There are natural inclusions $ NN subset.eq ZZ subset.eq QQ
       subset.eq RR subset.eq CC $ In fact, all these sets are
       different, so we could also write

       $ NN subset.neq ZZ subset.neq QQ subset.neq RR subset.neq CC
       $

    + The empty set is the set that has no elements. It is denoted
      with the symbol $emptyset$. So, $emptyset ={}$.  

    +  Any set $A$ has the empty set as a subset: $emptyset subset.eq A$.
    + And any set $A$ has itself as a subset: $A subset.eq A$.

    
]

=== Equality of sets <sec:equality-of-sets>

Two sets $A$ and $B$ are equal provided they have precisely the same
elements. Thus we have
$ A = B <=> (A subset.eq B) "and" (B subset.eq A) $

#example[
+ Define $ A={x in RR | x^3-3x^2+2x=0}, "and" B={0, 1, 2}. $
  We argue that $A=B$.

  First we show that $B subset.eq A$.  As $B$ is given as a finite collection of
  real numbers, we can just check that all elements in $B$ satisfy the
  condition that is required for a real number to be in $A$.
  
  That is, we need to see that each $0,1,2$ satisfy the condition for membership
  in $A$.  Thus we must confirm that $ 0^3-3 times 0^2+2 times 0=0, #h(1cm)
  1^3-3 times 1^2+2 times 1=0 , #h(1cm) 2^3-3 times 2^2+2 times 2=0. $ These
  equalities are all satisfied, so indeed $B subset.eq A$.

  We now need to prove the converse inclusion, i.e. that $A
  subset.eq B$.  Essentially, this means finding the solutions to
  the equation $x^3-3x^2+2x=0$ and proving that these solutions
  are among $0,1,2$.

  Factoring the polynomial, we find $
  x^3-3x^2+2x=x(x^2-3x+2)=x(x-1)(x-2) $ For a product to be 0, one
  of the factors needs to be zero. This leads us to $x=0, x=1,$ or
  $x=2$ as required.

+ Define $ C={x in RR | x^3-3x^2+2x>0}, #h(5mm) D={x in RR | 0<x<1
  "or" 2<x<infinity} $ Let us show that $C=D$.

  We saw already seen the factorization $ x^3-3x^2+2x=x(x-1)(x-2)$;
  thus $ C = { x in RR | x(x-1)(x-2) > 0 }. $ A 
  product of three numbers is positive if all of them are positive
  or two of them are negative and one positive. Now,
    - $x-1>0$ is equivalent to $x>1$,
    - $x-2>0$ is equivalent to $x>2$, and of course
    - $x>0$ is equivalent to $x>0$.
  So a real number $x$ is a member of the set $C$ if all three of these
  three inqualities hold, or if exactly one of these inequalities hold. So,
  all three factors are positive for $x>2$ while two of the factors are
  negative and the third positive for $0<x<1$. Using interval notation as in
  Calculus, the two sets are $(2,infinity)$ and  $(0,1)$ respectively. The
  set $C$ is then composed of these two pieces (we will introduce notation
  for this soon) and this is precisely the way $D$ was defined.  

] <ex:equality-of-sets>

=== Operations on sets <sec:operations-on-sets>

In this section, we introduce some basic operations. Let $A$ and $B$ be sets.

#definition[
The #highlight[union] $A union B$ is the set whose
elements are in either $A$ or $B$ (or both). In symbols,
$  A union B= { x |  x in A "or" x in B }. $
]

#definition[
The #highlight[intersection] $A inter B$ is the set whose
elements are in both $A$ and $B$. In symbols,
$  A inter B= { x |  x in A "and" x in B }. $
]

#definition[
$A$ and $B$ are said to be #highlight[disjoint] if their intersection is the
empty set -- i.e if $A inter B = emptyset$.

If $A$ and $B$ are disjoint, the union $A union B$ is sometimes called a #highlight[disjoint union], since an element $x in A union B$ satisfies either $x in A$ or $x in B$ but not both.
]

#definition[
 The #highlight[difference] $A - B$ of the sets $A$ and $B$ is the set of
 elements that are in the first set and not in the second set:
 $  A - B= { x | x in A "and" x in.not B }. $
]

#definition[
If the set $A$ is a subset of a set $U$, the #highlight[complement] of $A$
(in $U$)  is defined to be the set
 $ dash(A) = { x in U | x in.not A }=U-A. $
]

#remark[
Unions and intersections can be taken for several (more than two)
sets, even for infinite collections.
]

Set operations are sometimes represented and visualized using _Venn
Diagrams_; each set is represented as a shape, and the results of the
set operations are represented by certain regions, as in @figure:venn-diagrams.

#figure(
[#cetz.canvas({
  import cetz.draw: *
  let fillA = (0,2,4)
  let fillB = (1,2)
  let fillAnBred = (3,)
  let fillAnBwhite = (4,)
  for base in range(5) {
    let num = base*3.5
    rect((num,0),(num+2,1.5), fill: if base in fillA {red} else {none})
    rect((num+1,.2),(num+2.75,1.3), fill: if base in fillB {red} else {none}) 
    rect((num+1,.2),(num+2,1.3), fill: if base in fillAnBred {red} else 
                                       if base in fillAnBwhite {white} else {none})

    content((num+.4,.75),"A")
    content((num+2.4,.75),"B")
  }
})],
caption: [From left to right: $A$, $B$, $A union B$, $A inter B$, $A - B$]
) <figure:venn-diagrams>

#example[ 
  + In @ex:equality-of-sets, we showed that $C=D$. By its definition, the set $D$ is 
    equal to the union $(0,1) union (2,infinity)$. Thus, this set is the union of two intervals in the real line. 
     
  + The intersection of $(0,1)$ and $(2,infinity)$ is empty; i.e. $(0,1) inter
    (2,infinity)=emptyset$. So , the
    expression $C=(0,1) union (2,infinity)$ shows that $C$ is the #highlight[disjoint
    union] of two open intervals in the real line.   

  + For every $n in NN-{ 0}$ define the semiopen
    interval of the real line $A_n$ by $A_n=(-1/n,n]$.
    The parentheses $($ on the left indicates that $-1/n$ is
    not in the set while the bracket $]$ means that $n$ is.  Then
    $ inter.big_(n in NN-{ 0}) A_n=[0,1]  $ 
    
    First of all $[0,1]$ is
    contained in each $A_n$ and therefore in its intersection.  Also
    any real number greater than 1 is not contained in $A_1$ and
    therefore not contained in the intersection of all $A_n$.  
    
    Now, the sequence ${-1/k}$ has limit zero.
    Thus for any strictly negative number $x$, we can find
    some $k$ such that $x$ is smaller than $-1/k$ and
    therefore $x in.not A_k$ and _a fortiori_ $x$ is not in the intersection of
    all of the $A_n$.

    Similarly, we can compute the union: $ union.big_(n in NN-{0}) A_n=(-1,infinity). $ 
    
    No number smaller than or equal to -1 is
    in any $A_k$, therefore, it cannot be in its union. The numbers
    between $-1$ and 0 are in $A_1$ and therefore in the union.

    Any positive number is smaller than some natural number $m$ and
    therefore it is in $A_m$.

    ] <ex:unions-and-intersections>

#definition[
The #highlight[cartesian product] $A times B$ of the sets $A$ and $B$
is the set whose elements are ordered pairs of elements with the first one in $A$
the second one in $B$: $  A times B= { (x,y) | x in A "and" y in B }. $
] <defn:cartesian-product>


#example[
  + You are already familiar with at least one cartesian product.
    The set of real numbers is represented geometrically as a real line. The
    cartesian product of two real lines is the set of pairs of real numbers.
    This is a representation of the points in the plane  with each point
    determined by its two coordinates.  That is,  $RR times RR = RR^2$ is the set
    of points in the plane.

  + If $A = { a_1, a_2, ..., a_n}$ and $B = {b_1,b_2,...,b_m}$ for natural numbers 
    $n,m in NN$, then $ A times B = { (a_s,b_t) : 1 <= s <=n, 1<= t <= m}$.

  + Let $A={x in RR | x^3-3x^2+2x=0 }, B= {x in RR |
    x^2-4=0}$. We have seen in @ex:equality-of-sets that  $A$ may written 
    $A={0,1,2}$. Similarly, $ B={2,-2}$. Therefore, $ A times B= {
    (0,2), (1,2), (2,2), (0,-2), (1,-2), (2,-2) }. $ 

] <ex:cartesian-product>

#definition[
  The #highlight[power set] $cal(P)(A)$ of a set $A$ is the set consisting
  of all subsets of $A$:
  $  cal(P)(A)={ B |  B subset.eq A } $
] <defn:power-set>

#example[
+ Take $A=emptyset$. Then, $ cal(P)(emptyset )={
  emptyset }$. This is a set whose only element is the empty set.
  In particular, $ cal(P)(emptyset ) != emptyset $, as it
  contains one element.
+ If $A={a}$ is a singleton set -- i.e. a set with exactly one element -- then $cal(P)(A)={ emptyset , {a}}$ contains exactly 2 elements.
+ If $A={a,b}$ is a set with exactly two elements, then $cal(P)(A)={ emptyset, {a},{b},{a,b}}$ contains exactly $4 = 2^2$
  elements.
+ We see from the previous examples that every time that we add
  a new element to a set, we double the number of elements in
  $cal(A)$. We should expect that if $A$ has exactly $n$
  elements, then $cal(P)(A)$ has exactly $2^n$ elements. 
  
  We can see this as follows: to construct a subset of $A$, we must decide for each element of $A$ whether or not the element belongs to the subset. This gives two options for each element. These options can
  be combined in any arbitrary way, so there are in total $2^n$
  possibilities.
] <ex:power-set>

#pagebreak()

= Week 2 (week of 2025-09-08)

== About proofs


In Mathematics, a Theorem is a statement that it is known to be true. A proof is the formal evidence for the validity of the Theorem.

Proofs begin from some definitions and some results known to be true or that you accepts as a "axioms";
from there, the proof gives  logical steps demonstrating the stated result.

There is a hierarchy among Theorems, less important ones are usually called Propositions and Lemmas. 

The word Lemma is normally used for a result that will later be used to prove another result. 
And the word Corollary is usually used for a result which is (relatively straightforward) consequence of some other Theorem.

But what is a Proposition, a Lemma, a Corollary, or a Theorem varies depending on your point of view or your needs.

This course is meant to make you acquainted with proof techniques that work in a number of settings.
But this course will teach you to prove everything you might want!
Nobody knows how to prove everything. 

Every problem requires specific ideas and methods. 
The more time you spend working out similar problems, the more likely you are to have seen something 
similar and come up with an idea that will help you in a proof.

== Some building-block results for proof
 

#fact[
  In this course, we will freely use basic properties of addition and product of numbers 
  in the sets $NN, ZZ, QQ, RR, CC$ including the following. To state them, we use the symbol 
  $R$ to mean one of the sets of numbers $NN, ZZ, QQ, RR, CC$.
  + Associative law: $forall a,b,c in R$ 
    $ (a+b)+c = a+(b+c), a (b c)=(a b) c. $
  + Commutative laws: $forall a,b in R$ 
    $ a+b=b+a "and"  a b=b a. $
  + Additive and multiplicative identity elements exist: 
    $exists 0 in R$ and $exists 1 in R$ such that $forall a in R$ one has
    $ a+0=a "and" a times 1=a. $
  + Distributive property: for all $a,b,c in R$
    $ a(b+c)=a b + a c $
  + Existence of additive inverses: Suppose that $R$ is not $NN$.
    $forall a in R$, there is another element in $R$ that we call $-a$
    such that $a+(-a)=0$.
  + Existence of multiplicative inverses: Suppose that $R$ is not $NN$ or $ZZ$.
    $forall a in R$ such that $a eq.not 0$, there is another element in $R$ that we 
    call $a^(-1) = 1 slash a$ such that 
    $ a dot a^(-1) = a dot 1 slash a = 1 $.
  + Existence of an order: for $R$ one of the sets of numbers 
    $NN, ZZ, QQ, RR$ (but not $CC$): 
    
    - for any two distinct elements $a,b in R$, either $a<b$ or $b<a$.
    
    - Conversely, $a,b in R$ and  $a<b$, then $a eq.not b$.
      
    - Moreover,  if $a,b,c in R$, $a<b$ and $b<c$, then $a<c$.
    
    - If $a,b,c in R$ and $a<b$, then $a+c<b+c$. 
    
    - If $a,b,c in R$, $a<b$ and $c>0$, then $a c < b c$.
] <fact:number-axioms>

== Some examples of proofs

#definition[ Let $a,b in ZZ.$
+  The integer $a$ is said to #highlight[divide] $b$ if there exists 
   a third integer $c in ZZ$ such that  $b=a c$. 
   In this situation, we also say that $b$ is 
   #highlight[divisible by] $a$.

   We write $a divides b$ to indicate that $a$ divides $b$.
+  $b$ is said to  be #highlight[even] if $2 divides b$.
   Equivalently,  $b$ is even if there $exists c in ZZ$ such that  
   $b=2c$. 
+  $b$ is said to  be #highlight[odd] if $not (b "is even")$ i.e. if $b$ is 
   not even. 
] <defn:even-and-odd>


#remark[ Of course, one knows 
  for $b in ZZ$, that $b$ is odd if and only if 
  $exists c in ZZ, b = 2c + 1.$

  This is a consequence of "division with remainder": $forall b in ZZ, exists c in ZZ "and " r in {0,1}$ such that $b = 2 c + r.$
] <remark:odd-characterized>

We are going to prove:
#proposition[
  + The sum of two even integers is even.
  + The sum of two odd integers is even.
  + The sum of an even and an odd integer is odd.
]

#proof[
  Let $a,b in ZZ$.

  For (a), suppose that $a,b$ are even. Thus by @defn:even-and-odd, 
  $exists c,d in ZZ$ such that
  $a = 2c$ and $b = 2d$. Using the distributive law @fact:number-axioms(d) we find that
  $ a + b = 2c + 2d = 2(c+d). $
  Thus $a + b$ is indeed even.

  For (b), suppose $a,b$ are odd. Using @remark:odd-characterized, $exists c,d in ZZ$
  such that $a = 2c +1$ and $b = 2d+1$. 
  Using the distributive law  
  We find that
  #align(left, $ 
  & a + b &&= (2c + 1) + (2d + 1)  
  &       &&= 2c + 2d + 2 
  &       &&= 2(c+d + 1)
  $)
  where the equality in the second line holds since addition is associative and commutative @fact:number-axioms(a,b), and the equality in the third line holds by the distributive law @fact:number-axioms(d).

  For (c), without loss of generality we can assume $a$ is even and $b$ is odd. As before, we can use @defn:even-and-odd and @remark:odd-characterized to find $c,d in ZZ$ such that $a = 2c$ and $b = 2d + 1$. Again using the distributive law @fact:number-axioms(d), we find that
  $ a + b = 2c + 2d + 1 = 2(c+d) + 1 $
  so that $a + b$ is indeed odd.
  
]

#definition[
  Let $n in NN$. 
  
  The number $n$ is #highlight[prime] if $n eq.not 1$ and if $forall m in NN, m divides n$ implies that $m =1 "or" m=n.$

  The number $n$ is #highlight[composite] if $n eq.not 1$ and if $n$ is not prime.

] <defn:prime-number>

#proposition[ Let $n in NN$ and suppose that $n >= 2$.
+  If $n$ is a natural number greater than or equal than 3, then $n^2-1$ is composite.
+  If $n$ is a natural number greater than or equal than 2, then $n^3+1$ is composite.
]

#proof[
  (a) Using the equation for the difference of squares we find  for $n in NN$ that $ n^2 - 1 = (n-1)(n+1). $

  Note that while this seems to suggest that $n^2 -1$ is always composite, that is only true if neither factor is equal to 1. So the required condition is that $n-1>1$ or - since $n$ is a natural number - equivalently $n => 3.$

  We remark that the condition that $n =>3$ can't be omitted; when $n =2$, 
  $n^2 -1 = 4-1 = 3$ is prime and thus not composite
  
  (b) We can write $n^3 + 1 = (n+1)(n^2 - n + 1)$ as you can confirm using the distributive law for the expression on the right-hand-side.
  This shows that $n^3 +1$ is composite provided that $n+1 > 1$ -- i.e. $n >= 2$ -- and
  that $n^2 - n + 1 > 1$.

  The condition $n^2 - n + 1 > 1$ is equivalent to $n(n-1) = n^2 - n > 0$ by @fact:number-axioms(g), and this inequality is true for any real number outside the interval $[0,1]$. In particular, both inequalities hold when $n >= 2$, as required.
]

== The importance of quantifiers



Sometimes we use several quantifiers in a sentence. The order in which we use them is important

#example[
+  Consider the two statements: 
   - $ forall a in ZZ, exists b in ZZ "such that" a+b=0 $
   - $ exists b in ZZ "such that" forall a  in ZZ, a+b=0 $

  The first statement is true, it is the existence of inverse for addition; this follows from @fact:number-axioms(e) taking $b=-a$. You notice that this $b$ depends on $a$.
  
  Now this is fine because once we fix our attention on a particular $a$, we choose the $b$ that works.

  The second statement is false, however. This statement claims that there is can find a single interger that is inverse of _every element_ in $ZZ$. 

  While we can individually find additive inverses, no number will do the job for all integers at once.

+ When the two quantifiers are of the same type, then the order does    
  not matter.
  For example the two statements below are equivalent (and are true by the commutative property @fact:number-axioms(b).

  $ forall a in ZZ, forall b  in ZZ, 3a+5b=5b+3a $
  $ forall b in ZZ, forall a  in ZZ, 3a+5b=5b+3a $

  Similarly, the two statements below 
  $ exists a in ZZ "such that"  exists b  in ZZ "with" 3a+2b=1 $
  $ exists b in ZZ "such that" exists a  in ZZ "with" 3a+2b=1 $
  are equivalent and true taking for instance $a=1, b=-1$.
]

#example[
Note that when you want to negate a sentence that contains a quantifier, you will need to change the quantifier. Here are some examples:

+ Consider the statement $ (suit.club) #h(3mm) forall a in ZZ,  2a>a. $
  The statement $(suit.club)$ is false because there is at least one $a$ that does not satisfy the condition.
  The statement that is correct is the negation of $(suit.club)$.
  Saying that $(suit.club)$ is not true is the same as saying that 
  at least one integer does not satisfy the condition.
  Therefore, the negation of the above statement is 
  $  exists a in ZZ,  2a <= a. $
  We could take $a=-1$ to verify the statement.

+ Consider the statement 
  $ (suit.heart) #h(3mm) exists a in NN,  2a<a. $
  $(suit.heart)$ is false because no natural number $a$ satisfies the condition.
  The statement that is correct is  the negation of $(suit.heart)$ which may be 
  re-stated
  $ forall a in NN,  2a>= a. $
  This statement is equivalent to $a>= 0$ and every natural number satisfies the condition.

+ Consider the statement 
  $(suit.diamond) #h(3mm) forall a in QQ, exists b in QQ  "such that" a b=1 $.
  This statement is false because there is one $a in QQ$ that does not satisfy the condition (namely, $a=0$).

  The statement that is correct is the negation of $(suit.diamond)$, which may be stated
  $ exists a in QQ  "such that" forall b in QQ, a b eq.not 1. $
  If we  take $a=0$, then for all $b$ rational, $a b=0 eq.not 1$.

+ Consider the statement 
  $ (suit.spade) #h(3mm) exists a in QQ-{0} "such that" forall b in QQ -{0}, a b> 0. $
  This statement is false because no matter which $a in QQ- {0}$ we can always find some b with the opposite sign that will not satisfy the condition.
  The statement that is correct is the negation of $(suit.spade)$ which may be stated
  $  forall a in QQ -{0}  exists b in QQ - {0}  " such that " a b <= 0. $
  Given  $a in QQ - {0}$, we can choose  $b=-a$ and  $a b=-a^2$.
  A square of a non-zero number is always greater than 0 (see below) and therefore the negative of a square is greater than 0.
  
  Let us check that the square of a non-zero number is always greater than 0: using 
  @fact:number-axioms(g),  if $a eq.not 0$ either $a>0$ or $a<0$.
  If $a>0$, using (g) again find that $a times a>a times 0=0$.
  If $a<0$,  adding $-a$ to both sides of the inequality and using (g) again, we obtain $0=a-a<0-a=-a$.
  Multiplying both sides of the inequality $0<-a$ by $-a$, we obtain $0<a^2$ as we claimed 
]

== Propositional logic, again

Recall that we said a (logical) proposition is a statement that is either true or false (and not both).

And we described various ways of combining propositions, using 
- and, i.e. $and$
- or, i.e. $or$
- not, i.e. $not$
- implies, i.e. $->$


In this section, we point out that one can "calculate" the truth value of an expression involving propositions combined with these symbols.


#table(columns: 6,
inset: 10pt,
align: horizon,
table.header(
  [p], [q], [not p], [p and q], [p or q], $p -> q$),
  ..for p in (true, false) {
    for q in (true, false) {
    ([#p] , [#q], [#(not p)], [#(p and q)], [ #(p or q)], [#(not p or q)])
    }
  }
)

Notice that we can for example also handle cases with 3 propositional variables:

#table(columns: 5,
inset: 10pt,
align: horizon,
table.header(
  [p], [q], [r], [$(p and q) or r$], $(p or r) -> q$),
  ..for p in (true, false) {
    for q in (true, false) {
    for r in (true, false) {
    ([#p] , [#q], [#r], [ #((p and q) or r)], [#((not (p or r)) or q)])
    }
   }
  }
)

#example[
  Consider the propositions
  - $p$: "I like hiking"
  - $q$: "tomato plants need at least 6 hours of sun each day"
  - $r$: "$3 + 5 = 8$"
  - $s$: "$3 >= 8$""

  Let's write English sentences describing some of our propositional operations:
  - The proposition $not p$ is: "I don't like hiking".
  - The proposition $r and s$ is: "$3+5 = 8$ and $3 >= 8$.
  - The proposition $p or q$ is: "I like hiking, or tomato plants need at least 
    6 hours of sun each day."
  - The proposition $r -> s$ is: "If $3+5=8$ then $3 >= 8$"
]



The most interesting logical equivalences for us will be the ones that allow us to prove things in different ways.


In particular, we have the following:

#proposition[
  + $p => q$ is equivalent to $not p or  q$.
  + $not ( p => q)$ is equivalent to $p and not q$
  + $p => q$ is equivalent to $not q=>  not p$
    (contrapositive).
] <prop:prop-logic-identities>



#proof[
  + By definition, both of $p=>q$ and $not p or q$ are 
    always true when $p$ is false. Moreover, 
    $p=>q$ and $not p or q$ are both always true when $q$ is true.
    The only remaining situation is: "$p$ true and $q$ false";
    in this case, both $p=>q$ and $not p or q$ are false. Since the two propositions take the same truth values, they are equivalent. 
  + For (b) and (c) we simply confirm these identities 
    by checking that it holds for all possible 
    values of $p$ and $q$:
    #table(columns: 6,
      inset: 10pt,
      align: horizon,
      table.header(
        [p], [q], [$p => q$], [$not p or q$], [$not q => not p$], [$p and not q$]),
        ..for p in (true, false) {
          for q in (true, false) {
          ([#p] , [#q], [ #((not p) or q)], [#(not p or q)], [#(q or not p)], [#(p and not q)])
          }
        }
      )

]



Finally, we consider the logic underlying "proof by contradiction".

#proposition[ Let $p$ be a proposition.
  + $p => #false$ is equivalent to $not p$.
  + $not not p => p$.
] <prop:proof-by-contradiction>

#proof[
  For (a), we just check that the statement $p => #false$ is equivent to $not p$

  For (b), we just check that the statement $not not p  => p$ is always true.

  We carry out these checks in the following table:

    #table(columns: 5,
    inset: 10pt,
    align: horizon,
    table.header(
      [p], [$not p$], [$not not p$], [$not not p => p$], [$p => #false$]),
      ..for p in (true, false) {
        ([#p] , [ #(not p)], [#(not not p)], [#true], [#(not p and true)])
        }
    )
]

#remark[
  Here is the logic behind a proof by contradiction.
  - the goal is to prove that $p$ holds
  - proceed by assuming that $p$ is false, i.e. that $not p$ holds.
  - prove that $not p$ leads to a falsehood; in other words, prove that
    $not p => #false.$ This is often done by deriving two mutually contradictory assertions $q$ and $not q$ and appealing to that fact that $q and not q => #false$. 
  - Since $not p => #false$, we conclude that $not not p$ is $#true$. Since 
    $not not p => p$, we finally conclude that $p$ is $#true$.
]

#example[
    + Let us show that in the set of real numbers, the function 
      $f(x)=3x+5$   
      has no  repeated images; that is, no two real numbers map to the same real number.

      We can write this symbolically as follows 
      $ forall x_1,x_2 in RR, "if" x_1 eq.not x_2 , "then" f(x_1) eq.not f( x_2) $
  
      If  $p$ is the proposition $x_1 eq.not x_2$ and $q$ is the proposition 
      $f(x_1) eq.not f(x_2)$, then the statement takes the form $p  => q$.
      
      We carry out a proof by contraposition.

      We know that $p  => q$ is logically equivalent to $not q  => not p$. The proposition $not q  => not p$ takes the form 
      $ forall x_1,x_2 in RR, "if " f(x_1)= f(x_2) , "then " x_1= x_2   $
      Let us prove this statement: we assume we have two real numbers $x_1,x_2 in RR$ such that $ f(x_1)= f(x_2). $
      From the definition of $f$, this means that 
      $ 3x_1+5=3x_2+5  $
      As we are working with numbers in $RR$, each number has an additive inverse and  we can subtract 5 from both sides and get 
      $ 3x_1=3x_2 $
      We can multiply this equality by $1 slash 3$ and obtain 
      $ x_1 = x_2 $
      which is precisely what we were after.

    + We are going to show that if an integer is a square then two more than this integer 
      is not a square. 
      We can write this symbolically as follows 
      $  forall x in ZZ, "if"  exists  a in ZZ,  "such that" x=a^2, "then" exists.not b in ZZ "such that" x+2=b^2  $
      Fix an $x in ZZ$.
      Let  $p$ be the proposition $ exists a in ZZ, "such that" x=a^2. $
      Let  $q$ be the proposition $ exists.not b in ZZ, "such that" x+2=b^2. $

      We want to prove the statement $p  => q$. We will use a proof by contradiction.

      Namely, we will assume that $not (p => q)$ and prove $#false$.

      Now, According to @prop:prop-logic-identities, $not (p => q)$ is equivalent to $p and not q$; thus we assume that $x$ is a square and that $x+2$ is a square.

      We know that $p  => q$ is logically equivalent to $(  p and not q )<=> F$. 
      The statement $ p and not q $ takes the form 
      $ exists  a in ZZ, "such that" x=a^2 and exists b in ZZ "such that" x+2=b^2 $

      Our assumption leads to the existence of $a,b  in ZZ$ with $a^2 = x$ and $b^2 = x+2$.
      Since $(-z)^2 = z^2$, we may as well suppose that $a$ and $b$ are non-negative.

      Now $ 2 = x+2 - x = b^2 - a^2 = (b-a)(b+a). $
      Since $a$ and $b$ are non-negative, we have $b-a <= b+a$. Since $2$ is prime,
      we conclude that $b-a=1$ and $b+a=2$; adding these equations, we find that 
      $2b = 3$ or $b = 3 slash 2$. 

      Now we have arrived at a contradiction; namely, by assumption $b in ZZ$, but we just argued that $b = 3 slash 2 in QQ - ZZ$ so that $b in.not ZZ$.

      This contradiction proves that $not (p=>q)$ implies $#false$; thus we have proved $not not (p => q)$ -- see @prop:proof-by-contradiction(a) --  by @prop:proof-by-contradiction(b) 
      we deduce that $p => q$ as required.

    + The square root of 2 is not rational.

      Let  $p$ be the proposition $x= sqrt(2)$.
      Let  $q$ be the proposition $x in.not QQ$.
      We want to prove the statement $p  => q$. We will do a proof by contradiction.

      Thus we are going to suppose $not(p => q)$. Now, @prop:prop-logic-identities shows
      that $not (p => q)$ is logically equivalent to $p and not q$. Thus we suppose that
      $x = sqrt(2)$ and that $x in QQ$, and we must deduce a contradiction.

      Since $x in QQ$, $exists a, b in ZZ$ with $b eq.not 0$ and 
      $ (suit.club) #h(3mm) sqrt(2) = x = a slash b. $

      We may suppose that the integers $a,b$ have no common factor.

      Now, squaring each side of $(suit.club)$, we find
      $ 2 = a^2 slash b^2 => 2 b^2 = a^2. $

      The prime factors of $a^2$ are the same as the prime factors of $a$, just with twice the exponent.
      It follows that, 2  must divide $a$. Then, $ a=2c, "so" 2b^2=a^2=4c^2. $ Dividing both sides by 2, find that 
      $ b^2=2c^2 $
      which now shows that $2$ must divide $b$.
      We have arrived at a contradiction; on the one hand, we assume that $a$ and $b$ have no common factors, but on the other hand we just proved that $2 | a$ and $2 | b$.
      This contradiction proves $p => q$, thus $sqrt(2) in.not QQ.$

]

#example[
  Here is an example of a _non-constructive_ proof.

  Claim: $exists a,b in RR$ such that $a,b in.not QQ$ and $a^b in QQ.$

  #proof[We say above that $sqrt(2) in.not RR.$ Consider the number $sqrt(2)^(sqrt(2))$.

  If this number is rational, the proof is complete.

  Otherwise, if $sqrt(2)^sqrt(2)$ is irrational, set $a = sqrt(2)^sqrt(2)$ and $b = sqrt(2).$ 

  Then
  $ a^b = (sqrt(2)^sqrt(2))^sqrt(2) = (sqrt(2))^(sqrt(2)dot sqrt(2)) = (sqrt(2))^2 = 2 in QQ. $

  Thus, whether or not $sqrt(2)^sqrt(2)$ is irrational, we have in all cases found $a,b in RR$ with the desired properties.]

  This proof is _non-constructive_ since it does not explicitly tell its reader which elements $a,b$ work!

  In fact, there are constructive proofs of the given statement. For example $a=sqrt(2)$ and $b = log_2(9)$ are both easily shown to be irrational, and $a^b=3$.
]

#pagebreak()

= Week 3

== Induction

Consider a family $P(n)$ of propositions indexed by natural numbers $n in NN$.


Mathematical Induction -- when it can be applied - is a technique for
proving all statements $P(n)$ at once, without having to give in
finitely many proofs.

The basis of the proof is the following property of $NN$.

#fact[
    *(The well-ordering principle)* Every non-empty subset of the
    set of natural numbers has a minimum element.
] <fact:well-ordering>



#proposition[ (*The principle of mathematical induction*) Given a
    family of propositions $P(n)$ for $n in NN$, suppose the
    following:

    + $P(0)$ (i.e. suppose that $P(0)$ is true).
    + $forall m  in NN, P(m) => P(m+1)$. 
    Then we can conclude that $P(n)$ holds for every $n in NN$.
] <prop:math-induction>

#proof[
    We need to prove: $forall n, P(n)$. We use a proof by contradiction. Thus
    we suppose $not (forall n, P(n))$, i.e. we suppose
    $ exists n, not P(n). $

    This shows that $S = { n in NN | not P(n) }$ is a non-empty subset of $NN$.
    By @fact:well-ordering, this set $S$ has a _smallest_ element $n$.
    
    - Assumption (a) shows that $P(0)$ is true, so that $0 in.not
      S$. Thus $n>0$ so that $n$ has the form $k + 1$ for $k in NN$.

    - Since $n=k+1$ is the smallest value of $S$, we know $k in.not S$
      so that we know that $P(k)$ holds. But now (b) shows that
      $P(k+1)$ holds. On the other hand, since $k+1 in S$, $not
      P(k+1)$ holds.  Thus we have proved $ P(k+1) and not P(k+1). $

    This contradiction proves that $P(n)$ holds for every $n$.  ]

#remark[

    + Note that the analogue of the well-ordering principle fails
      for $ZZ$; for example, the set of even integers
      ${...,-4,-2,0,2,4,...}$ does not have a smallest element.

    + The situation is even worse for rational or real numbers: even
      if a subset of $QQ$ or of $RR$ is bounded below, it does not in
      general have a minimal element.  For example, the open interval
      of the real line $(0,1)$ does not have a minimal element because
      0 is not in the set $(0,1)$ contains elements arbitrarily close
      to $0$
    
    
    + For an integer $k$, we can carry out induction on sets of the
      form $X_k = {n in NN | k <= n}$.  Namely, given a family of
      propositions $P(n)$ for $n in X_k$, if we prove that $P(k)$ is
      true, and if we prove that $forall m in X_k, P(m) => P(m+1)$
      then we can conclude that $P(n)$ is true for every $n in X_k$.

    + When proving in (b) that $P(m) => P(m+1)$, the validity of
      $P(m)$ is often referred to as the _induction hypothesis_.

]

== The size of the power set, using mathematical induction

#definition[
    For a set $A$,
    the #highlight[power set] of $A$ is the set
    $ cal(P)(A) = { B | B subset.eq A }; $
    in words, $cal(P)(A)$ consists of all subsets of $A$.
] <defn:power-set>

#example[
    + If $A = emptyset$ then $cal(P)(A) = {emptyset}$. In particular, $cal(P)(emptyset)$ contains one element.
    
    + If $A = {a,b,c}$ then $ cal(P)(A) ={ emptyset, {a}, {b}, {c},
      {a,b}, {a,c}, {b,c}, {a,b,c} }. $ In particular,
      $cal(P)({a,b,c})$ contains $8=2^3$ elements.  ]

#proposition[
    If $A$ is a finite set with $n$ elements, then $cal(P)(A)$ has $2^n$ elements.
]

#proof[ 
    Let us write $n(A) in NN$ for the number of elements in $A$.
    We write $P(n)$ for the proposition
    $ P(n): #h(1cm) forall A, (n(A) = n) => (n(cal(P)(A)) = 2^n). $

    We are going to prove that $P(n)$ holds using @prop:math-induction.

    For this we must do two things:

    - First, we must show that $P(0)$ holds. For this, we suppose that
      $n(A) = 0$ and we must show that $n(cal(P)(A)) = 2^0 = 1$. Now,
      $n(A) = 0 => A = emptyset$ and we already computed that
      $cal(P)(emptyset)$ has precisely one element, as required.

    - Second, we must show that $forall m in NN, P(m) => P(m+1)$.
      Thus, let $m in NN$ and assume $P(m)$. In other words, we assume that
      $ forall A, (n(A) = m) => (n(cal(P)(A)) = 2^m). $

      We must prove that $P(m+1)$ holds; i.e. that $ forall A, (n(A) =
      m+1) => (n(cal(P)(A)) = 2^(m+1)). $ So, let $A$ be a finite set
      with $n(A) = m+1$, and let $x in A$. Then $A = {x} union A'$
      where $A'$ is a subset of $A$ with $n(A') = m$.

      We apply the induction hypothesis $P(m)$ to $A'$ to learn that
      $n(cal(P)(A')) = 2^m$.

      For any subset $B$ of $A$, either $x in B$ or $x in.not B$.

      If $x in.not B$, then $B subset.eq A' => B in cal(P)(A')$, and
      it follows that there are $2^m$ such subsets $B$.

      If $x in B$, then $B$ has the form $B = {x} union B'$ where $B'$
      is a subset of $A'$; thus $B' in cal(P)(A')$.  It again follows
      that there are $2^m$ such subsets $B$.

      Thus there are $2^m + 2^m = 2 dot 2^m = 2^(m+1)$ subsets of $A$, so that indeed
      $n(cal(P)(A)) = 2^(m+1)$. We have now proved that $P(m+1)$ is true. 

    Now @prop:math-induction shows that $P(n)$ holds for every $n in NN$, as required.
    
]


== More examples of induction

#proposition[
    Let $n in NN$ and put
    $display(S_n = sum_(i=0)^n i)$. Then $S_n = display(n(n+1)/2)$.
] <prop:sum-to-n>

#proof[

    We give a proof by mathematical induction. Let $P(n)$ be the
    proposition $S_n = display(n(n+1)/2)$. To prove that $P(n)$ holds
    for every $n$, we are going to apply @prop:math-induction.

    We must first confirm that $P(0)$ holds. On the one hand,
    $S_0 = sum_{i=0}^0$ is the sum of no terms, and is thus $0$. On the other hand,
    $0dot (0+1) slash 2 = 0$. This confirms $P(0)$.
    
    We now confirm that $forall m, P(m) => P(m+1)$. Let $m in NN$ and suppose that
    $P(m)$ holds. Thus we know that
    $ S_m = m(m+1) / 2 $
    We must prove that $P(m+1)$ holds. Notice that by definition, we have
    $ S_(m+1) = (m+1) + S_m. $
    Using the induction hypothesis $P(m)$, we can replace $S_m$ in the right-hand side to find that
    #align(center,$
        S_(m+1) & = (m+1) + m(m+1) / 2 \
        & = (2(m+1)) /2 + m(m+1) / 2 \
        & = (m^2 + 3m + 2)/2 \
        & = ((m+1)(m+2))/2.$)
    
    This confirms that $P(m+1)$ holds. Now $P(n)$ holds for each $n$ by @prop:math-induction.
]

In fact, we can give a proof of @prop:sum-to-n without using induction, as follows

#proof[
    _Alternate proof_.

    We write this sum $S_n$ twice, once in ascending order and once in descending order
    #align(center,$
        0&+&1&+& dots  &+& (n-2) &+&(n-1)&+&n \
        n&+&(n-1)&+& dots &+&2&+&1&+&0$)
    
  If we add each term in the second row to the one above it, we get
  always $n$. There are $n+1$ terms in $S_n$. So twice $S_n$ is
  $n(n+1)$.  Then $S_n=n(n+1) slash 2$.

]


#proposition[
    Let $n in NN$. Then $4^n -1$ is divisible by $3$.
]

#proof[
    We proceed by induction on $n$.

    We must first prove the _base case_, namely the case $n = 0$. When $n=0$, we have
    $4^n -1 = 1 - 1=0$. Now we know that $0 = 0 times 3$ so indeed $3 divides 0 = 4^0 -1$.

    We now suppose that $m in NN$ and that $4^m - 1$ is divisible by $3$. We must prove that
    $4^(m+1) - 1$ is divisible by $3$.

    Well,
    $ 4^(m+1) - 1 = 4 dot 4^m - 1 = 4 dot 4^m - 4 + 4 - 1 = 4(4^m - 1) + (4-1) #h(3mm) (suit.club) $
    If $4^m -1 = 3a$ we see that
    $ (suit.club) #h(3mm) = 4 dot 3a + 3 = 3(4a + 1) $
    which confirms that $3 divides 4^(m+1) - 1$.

    Now it follows by @prop:math-induction that $3 divides 4^n -1$ for every $n in NN$.
]

== Strong induction

#proposition[
    (*Strong mathematical induction principle*)
    Let $P(n)$ be a family of propositions indexed by $n in NN$.

    For $n in NN$ write $Q(n)$ for the proposition  $ forall k in NN, k <= n => P(k); $
    thus $Q(n)$ is the proposition that $P(k)$ holds for every $k <= n$.
    
    Assume the following:

    + $P(0)$ is true, and
    + $forall m, Q(m) => P(m+1)$

    Then $P(n)$ holds for every $n in NN$.
] <prop:strong-math-induction>

#proof[
    We proceed as before; thus let $S = { n in NN | P(n) "fails to hold" }$.
    To prove the proposition, we must show that $S$ is empty.

    We give a proof by contradiction; thus we suppose that $S$ is non-empty. Using @fact:well-ordering, we write
    $n in S$ for the _smallest_ element of $S$.

    In view of (a), we know that $0 in.not S$ so that $0<n$ and thus $n = m+1$. For any $k <= m$ we have
    $k in.not S$ so that $P(k)$ holds. By definition, this means that $Q(m)$ holds.
    Now by (b), $Q(m) => P(m+1)$.

    SO on the one hand $P(m+1)$ holds, but on the other hand, $n=m+1
    in S$ so that $P(m+1)$ does not hold. This contradiction proves
    that $S = emptyset$; thus, the Proposition holds.

]

#remark[ The difference between induction and strong induction is that
    in the second step, we are using more than the statement for the
    previous natural number, we are using it for all the previous
    natural numbers.  In carrying out the proof, we need to be careful
    that we only use statements that we have checked or assumed.
]

We are going to use the strong induction principle to prove that
"division with remainder" works for integers. In other words, we are
going to show for $a,b in ZZ$ with $b>0$ that there are unique
integers $b,q in ZZ$ such that $a = b q + r$ and $0 <= r < b$.

First, let’s establish the _uniqueness_.

#proposition[
    Let $b in ZZ$ with $b>0$, and let $q,r,q',r' in ZZ$. Suppose that
    $ (suit.diamond) #h(3mm) b q + r = b q' + r' $
    and that
    $ 0 <= r < b "and" 0 <= r' < b. $
    Then $q = q'$ and $r = r'$.
] <prop:div-with-remainder-uniqueness>

#proof[
    Using $(suit.diamond)$ we see that $b(q-q') = r' - r$ which shows that $b divides r' -
    r$. Since $0 <= r,r' < b$, we have $-b < r - r' < b$; thus $r - r'
    = 0$, i.e. $r = r'$. Again using $(suit.diamond)$ we see that $b q = b q'$ and since $b  eq.not 0$
    we conclude that $q = q'$.
] 

#proposition[(*Division with remainder for $NN$*)
    Given $n,b in NN, b>0$, there exist unique natural numbers $q,r$ with $0 <= r<b$ such that $n=b q+r$.
] <prop:division-with-remainder-NN>

We are going to give the proof twice. The first time, we will emphasize how the proof follows @prop:strong-math-induction.

#proof[

    Fix $b in NN$ with $b>0$.

    The uniqueness statement follows from
    @prop:div-with-remainder-uniqueness; it remains to show the
    _existence_ of $q,r$.
    
    We are going to prove the existence using strong induction on $n$.

    What this means is that we consider the family of propositions
    $ P(n): #h(3mm) exists q,r in NN, 0 <= r < b "and"
    n = b q + r. $

    We prove two things:

    - We show that $P(0)$ holds:

      For this, we take $q = r = 0$ and note that $0 <= 0 < b$ and $0 = b dot 0 + 0.$

      
    - With notation as in the statement of @prop:strong-math-induction, we show for all $m in NN$ that
      $Q(m) => P(m+1)$.

      So we suppose that $Q(m)$ holds; i.e. we suppose for $k <= m$ that $P(k)$ holds.

      We now treat two cases: in the first case, $m + 1 < b$ and in the second case, $b <= m + 1$.

      If $m + 1 < b$ then $P(m+1)$ is true since we can take $q = 0$ and $r = m+1$. Then
      $ m+1 = b dot 0 + m+1 "and" m+1 < b. $

      We are left with the case $b <= m+1$. In this case, notice that $0 <= m+1 - b$ so that $m+1-b in NN$.
      We now apply the induction hypothesis. Notice since $b>0$, $m+1 - b < m+1$; i.e. $m+1-b <= m$.
      By the  induction hypothesis $Q(m)$  we know that $P(m+1-b)$ holds. Thus we may find
      $q,r in NN$ for which
      $ m+1-b = b dot q + r "and" 0 <= r < b. $

      Now we see that
      $ m+1 = b dot (q+1) + r$ and $0 <= r < b, $
      which proves that $P(m+1)$ holds.

    We now apply @prop:strong-math-induction to conclude that $P(n)$
    holds $forall n in NN$. This proves the Proposition.
    

]

Let's repeat that proof; this time, we use natural language and avoid naming
the various propositions.

#proof[

    Fix $b in NN$ with $b>0$.

    The uniqueness statement follows from
    @prop:div-with-remainder-uniqueness; it remains to show the
    _existence_ of $q,r$.
    
    We are going to prove the existence using strong induction on $n$.

    We prove two things:

    - We prove that the statement is correct when $n=0$.

      For this, we take $q = r = 0$ and note that $0 <= 0 < b$ and $0 = b dot 0 + 0.$

      
    - For the induction step, we fix $m$ and assume the following:
    
      $(suit.club)$ for each $0 <= k < m$, we can write $k = q b + r$ 
      with $q,r in NN$ and $0 <= r$.

      We must prove that division with remainder works for $n= m+1$.

      We now treat two cases: in the first case, $m + 1 < b$ and in the second case, $b <= m + 1$.

      If $m + 1 < b$, take $q = 0$ and $r = m+1$. Then
      $ m+1 = b dot 0 + m+1 "and" m+1 < b $
      which confirms that division with remainder holds for $n = m+1$ in this case.


      We are left with the case $b <= m+1$. Notice that $0 <= m+1 - b$ 
      so that $m+1-b in NN$.
      We now apply the induction hypothesis. Notice since $b>0$, $m+1 - b < m+1$; i.e. $k=m+1-b <= m$.
      By the  induction hypothesis $(suit.club)$ we may find
      $q,r in NN$ for which
      $ k=m+1-b = b dot q + r "and" 0 <= r < b. $

      Now we see that
      $ m+1 = b dot (q+1) + r$ and $0 <= r < b, $
      as required.

    The proposition now follows by @prop:strong-math-induction.
    

]

#corollary[ (*Division with remainder for $ZZ$*) Given $z,b in
    ZZ, b>0$, there exist unique integers $q,r$ with $0 <= r<b$ such
    that $z=b q+r$.  ] <prop:division-with-remainder-ZZ>

#proof[
    Again, the uniqueness statement follows from
    @prop:div-with-remainder-uniqueness; it remains to show the
    _existence_ of $q,r$.
    
    From @prop:division-with-remainder-NN, we already know the
    result if $z >= 0$.  Assume then $z<0$; then $-z>0$. Hence, from
    @prop:division-with-remainder-NN, there exist natural numbers
    $q',r'$ with $0 <= r'<b$ such that $-z=b q'+r'$.

    Therefore,
    $z=b(-q')+(-r')$. Here $-q' in ZZ$.  If $0 <= r'<b$,
    multiplying with $-1$ that is a negative number we reverse the
    inequalities. Therefore $-b < -r'<= 0$.  If $r'=0$, this is what we
    need.  If $r'$ is not 0, $-b < -r'< 0$. we can add $b$ to these
    inequalities to give us $0<b-r'<b$.  From $z=b(-q')+(-r')$, we
    also have $z=b(-q'-1)+(b-r')$. Then $ q=-q'-1 "and" r=b-r' $ work in the
    statement of the corollary.

]

#corollary[
    Let $n in ZZ$. If $n$ is not even, then $exists q in ZZ, n = 2q + 1$.
]

#proof[ Use @prop:division-with-remainder-ZZ to write $n = 2q + r$ for
    unique integers $q,r in ZZ$ with $0 <= r < 2$.

    Thus $r in {0,1}$. One sees at once that $n$ is even if and only if $r=0$
]


#remark[ The corollary shows that $n$ is odd (i.e. not even) if and
    only if $n$ has the form $2q+1$ for some $q in ZZ$.]


== Sequences

#definition[ A #highlight[sequence] $a_n, n in NN$ is a family of
    numbers, where the members of the family are indexed by the
    natural numbers.
]

#example[
    + The sequence ${0,1,2,...}$ is given by $a_n = n$ for $n in NN$.
    + The sequence ${1,-1,1,-1,...}$ is given by $a_n = (-1)^n$ for $n in NN$.
    + The sequence ${1,1/2,1/3,1/4,...}$ is given by $a_n = 1/(n+1)$ for $n in NN$.
]

One can sometimes give a _recursive_ definition of a sequence.
#example[
    + Consider the sequence defined recursively by the requirements:
      $a_0 =0$ and $a_n = a_(n-1) + 1$ for $n > 0$.

      Let’s prove that this sequence satisfies $a_n = n$ for each $n in NN$. We use _induction_ -- i.e. @prop:math-induction -- to prove that $a_n = n$ for each $n$.

      We most confirm first that $a_0 = 0$; this is true by assumption.

      Finally, we must confirm for $m  in NN$ that $a_m = m$ implies that $a_(m+1) = m+1$. But the recursively relation we are assuming implies this; indeed, it shows that
      $ a_(m+1) = a_m + 1 = m + 1 $
      as required.
      Now @prop:math-induction implies that $a_n = n$ for every $n in NN$
          
    - Consider the sequence defined recursively by the requirements
      $a_0 = 1$ and $a_n = (-1)dot a_(n-1)$ for $n > 0$.

      This sequence is given by the formula $a_n  = (-1)^n$. Indeed, we again give a proof by induction.

      In the base, case we know $a_0 = 1 = (-1)^0$ by assumption.

      For $m in NN$, if we know that $a_m = (-1)^m$, our recursive relation we assume then gives
      $ a_(m+1) = (-1) dot a_m = (-1) dot (-1)^m = (-1)^(m+1). $

      Thus @prop:math-induction confirms for each $n in NN$ that $a_n = (-1)^n$.

    + If a sequence $b_n$ satisfies the two conditions 
      $ b_0=3, "and" b_n=2b_(n-1) "for" n>0, $ 
      then $b_n=3 dot 2^n$:

      Proceed by induction.

      In the base case, we have $b_0 = 3 = 3 dot 2^0$ by assumption.

      Let $m in NN$ and suppose that $b_m = 3 dot 2^m$. We must argue that
      $b_(m+1) = 3 dot 2^(m+1).$

      Our assumption implies that      
      $ b_(m+1) = 2b_m = 2 dot 3 dot 2^m = 3 dot 2^(m+1) $
      as required. Thus @prop:math-induction implies that $b_n = 2 dot 3^n$ for each $n in NN$.

    + Consider the _Fibonacci_ sequence $F_n$ defined by $F_0 = F_1 = 1$ and
      $F_i = F_(i-1) + F_(i-2)$ for $i >= 2$.
      In this case, it is less clear how to write down a formula for $F_n$!      
]

Sometimes we can check that a sequence satsifies a recurrence relationship. FOr example:
#example[
    + Let's consider the sequence $a_n = 2^n$ and show that
      $ a_n=6 dot a_(n-2)-a_(n-1) "for each" n in NN "with" n>=2. $

      Indeed, let $n in NN$ with $n>=2$ and compute:
      $ 6 dot a_(n-2) - a_(n-1) = 6 dot 2^(n-2) - 2^(n-1) = 2^(n-2)(6 - 2) 
        = 2^(n-2) dot 4 = 2^n = a_n. $
    + Show that the sequence $b_n=(-3)^n$ satisfies the recurrence 
      $ b_n=6 dot b_(n-2)-b_(n-1) "for" n>=2 $.

      Indeed, let $n in NN$ with $n>=2$ and compute:
      $ 6 dot b_(n-2) - b_(n-1) = 6 dot (-3)^(n-2) - (-3)^(n-1) 
        = (-3)^(n-2)(6 - (-3)) = 9 dot (-3)^(n-2) =
        (-3)^n = b_n. $

]

#example[
    Let's consider sequences $a_n$ which satisfies the recurrence relation
    $ (suit.club) #h(3mm) a_n=a_(n-1)+4a_(n-2)-4a_(n-3) $

    + If the sequences $a_n$ and $b_n$ both satisfy $(suit.club)$ then for any real numbers $s,t$ so  
      does the sequence $c_n$ where $c_n = s dot a_n + t dot b_n$ for $n in NN.$

      Indeed, let $n in NN$. Our assumptions mean for $n >=3$ that
      $ a_n=a_(n-1)+4a_(n-2)-4a_(n-3) $
      and
      $ b_n=b_(n-1)+4b_(n-2)-4b_(n-3). $
      But then
      #align(left,$
      & c_n & =& s dot a_n + t dot b_n = s dot (a_(n-1)+4a_(n-2)-4a_(n-3)) + t dot (b_(n-1)+4b_(n-2)-4b_(n-3)) \
      & & =& (s dot a_(n-1) + t dot b_(n-1)) +4(s dot a_(n-2) + t dot b_(n-2))-4(s dot a_(n-3) + t dot b_(n-3))\
       & & = & c_(n-1) + 4 c_(n-2) -4 c_(n-3). 
      $)

    + For a real number $b eq.not 0$, the sequence $a_n = b^n$ 
      satsifes $(suit.club)$
      if $b = 1, 2, -2.$

      #align(left,$ 
      & b^n=b^(n-1)+4b^(n-2)-4b^(n-3) & <=> &  b^n-b^(n-1)-4b^(n-2) +4b^(n-3) =0 \
      & & <=> & b^(n-3)(b^3-b^2-4b+4 )=0 $)

      As we are assuming $b eq.not 0$, this means $b^3-b^2-4b+4 =0$.
      We can factor 
      $ b^3-b^2-4b+4 =(b-1)(b-2)(b+2). $
      Therefore, $b=1, b=-2, b=2$ are solutions of the stated form. (In fact, these are the only solutions).

    + For any real numbers $alpha,beta,gamma in RR$ there is a sequence 
      $a_n$ for which 
      $ a_0 = alpha, a_1 = beta, a_2 = gamma $
      and $(suit.club)$ holds.

      Indeed, define the sequence $a_n = c_0 + c_1 2^n + c_2 (-2)^n $
      where $c_0,c_1,c_2$ are real numbers.

      It follows from observation (a) above that $a_n$ satisfies $(suit.club)$.

      Now we have $ a_0 = c_0 + c_1 + c_2 $
      $ a_1 = c_0 + 2c_1 - 2c_2 $
      $ a_2 = c_0 + 4c_1 + 4 c_2 $

      So we must solve the system of linear equations
      #align(center,
      $c_0 + c_1 + c_2 &= alpha \
       c_0 + 2c_1 - 2c_2 &= beta \
       c_0 + 4c_1 + 4c_2 &= gamma
      $)

      Or equivalently we must solve the matrix equation
      $ mat(1,1,1;1,2,-2;1,4,4) mat(c_0;c_1;c_2) = mat(alpha;beta;gamma) $

      This matrix equation has a (unique) solution $mat(c_0;c_1;c_2)$ since 
      $ det mat(1,1,1;1,2,-2;1,4,4)= 12. $
]


#pagebreak()


= Week 4 - [2025-09-22]

== Functions


Functions are the way in which sets relate to each other. We begin our discussion of functions with the definition:

#definition[
    A #highlight[function] consists of three pieces of data:
    a set $A$ called the #highlight[domain], a set $B$ called the #highlight[codomain] and rule $f$ that assigns to each 
    element $x$ of the set $A$ one and only one element $f(x)$ of the set $B$.

    We write $f:A -> B$ as notation for a function. 
    
    When the domain and codomain can be inferred from context, we sometimes just refer 
    to the function using the name $f$. 
]

#remark[
    Here is a more precise definition: a function $f:A -> B$ is a subset 
    $R subset.eq A times B$ of the cartesian product $A times B$ with the property that
    for each $x in A$, $exists ! y in B$ such that $(x,y) in R$.

    This definitions makes precise what is meant by a "rule" that "assigns to each $x in A$ an element $f(x)$ of $B$."
]

#let position(val,l) = {
    for i in range(l.len()) {
        if val == l.at(i) {
            return i
        }
    }
}

#let myfun(A: (), B: (), fun: ()) = {
    [#cetz.canvas({
        import cetz.draw: *
        for a in A {
            content((0,.5*position(a,A)),a)
        }
        for x in B {
            content((2,.5*position(x,B)),str(x))
        }
        for (from,to) in fun {
            line((.5,.5*position(from,A)),(1.75,.5*position(to,B)))
        }
    })]
}
        
#let A = ("a","b","c","d")
#let B = (0,1,2)

#example[
    + Let $A = {a,b,c,d}$, let $B = ZZ$, and let $f$ be the rule defined by
      $f(a) = 0$, $f(b) = 2$, $f(c) = 1$, $f(d) = 2.$

      Notice that formally, $f$ corresponds to the subset 
      $ R = { (a,0), (b,2), (c,1), (d,2)} subset.eq A times ZZ. $

      We can represent this function using the following diagram:

      #figure(
        [
            #myfun(A: A, B: B, fun: (("a",0),("b",2),("c",1),("d",2)))
        ]
        )

    + With the same domain and codomain, the rule $f(a) = 1$, $f(a) = 2$, $f(b) = 1$, 
      $f(c) = 1$ and $f(d) = 2$ #emph[does not determine a function], since
      $f$ assigns two different values to the element $a in A$.

      #figure(
        [
            #myfun(A: A, B: B, fun: (("a",1), ("a", 2), ("b",1), ("c", 1), ("d",2)))
        ]
        )

    + Again with the same domain and codomain, the rule
      $f(b) = 0$, $f(c) = 0$, $f(d) = 0$ #emph[does not determine a function], since the value $f(a)$ is not specified.

     #figure(
        [
            #myfun(A: A, B: B, fun: (("b",0), ("c",0), ("d", 0)))
        ]
        )

]

Often we specify functions using #emph[formulas]. For example:

#example[
    + There is a function $f:RR -> RR$ given by the rule $f(x) = x^2$ for $x in RR.$

    + In fact, the same rule can define different functions. For example, there is a 
      function
      $ f:QQ -> RR_(>=0) "given by" f(x) = x^2. $
]

When giving a function with a rule, It is important to make sure that
the rule makes sense.  Sometimes an expression is not defined for some
values of the intended domain, as when trying to divide by 0 or taking
the square root of a negative real number.  Another sometimes-overlooked problem 
is that when we list the elements in the domain, they
can be listed in several ways and the assignment rule would give
different outputs depending on what representation you
choose. Examples below should clarify these difficulties:

#example[
    + In an elementary school, assign to each classroom the color of the T-shirt of a    
      child in that class on the first day of school.
      If we do not specify the child this would not give a well defined function if 
      different children in the same classroom wear T-shirts of different colors.

    + The assignment $f: QQ -> ZZ$ given by $f  
      (m slash n)=m$ is not a well defined  function. Indeed,
      $0.5$ is a rational number that can be represented by $1 slash 2, 2 slash 4, 
      -3 slash -6, ...$ and we do not know if $f(.5)$ should be $1, 2, -3, ... $

    + The assignment $f:QQ -> QQ$ given by 
      $f(m slash n)=2m slash 5n$ is a well defined  function.
      We need to check that the definition is independent of the way we represent 
      a rational number  as a fraction. Assume $a slash b= c slash d$.
      By definition, this means that $a d=b c$. Multiplying both sides of this 
      equality by 10, we can write this  as $(2a)(5d)=(5b)(2c)$ which tells us that 
      $2a slash 5b = 2c slash 5d$. So our assignment is not ambiguous and we get a 
      well defined function from the set of rational numbers to itself 
    + The assignment $f:RR -> RR$ given by $f(x)=sqrt(x)$ is not a 
      function as the value of $f$ at a negative number is not defined.

    + The assignment $f:CC -> CC$ given by $f(x) = sqrt(x)$ is not a well defined  
      function as every complex number (except for 0) has two different square roots!
      Unlike the real case, we cannot "choose the positive root". For example, the two 
      square roots of $-i$ are $ (-1)/sqrt(2) + 1/sqrt(2) i, #h(1cm) 1/sqrt(2)- 1/sqrt(2) i. $

      Neither seems "more positive" than the other.

]

== Properties of functions

#definition[
    Given a function $f:A-> B$ and a function  $g:B-> C$, the #highlight[composition]  of the two functions $f, g$ is the function $ g compose f:A -> C $
    given by the rule $(g compose f)(a)=g(f(a)), forall a in A$.
]


 Note in particular that we can only compose two functions if the codomain of the first is the domain of the second.
 Then, the composition is obtained by applying the two functions one after the other.
 
 #example[
    Consider the following sets: 
    - $A$ is a set of friends, $A = {$ Alice, Bob, Chris $}$, 
    - $B$ is a set of possible household pets, $B = {$ cat, dog, bunny $}$
    - $C = QQ_()>= 0)$ is the set of non-negative rational numbers.

    Consider functions 
    
    - $f:A -> B$ where $f(x)$ representing the preferred pet of friend $x$.

    - $g:B -> C$ where $g(y)$ represents the cost per week, in dollars, to own the pet $y$.

    For $x in A$, $(g compose f)(x)$ represents the anticipated costs for pet-ownership by the friend $x$.

    Notice that the composition $f compose g$ is not defined. The domain of $g$ is the set of pets. If $y$ is a pet, then
    $g(y)$ is a non-negative rational number, and $f(g(y))$ is not meaningful, since the domain of $f$ is the set of friends (Alice, Bob, Chris).
 ]

#example[
    Consider the two functions $f:RR -> RR$ given by $f(x)=x+2$ and  
    $g:RR -> RR$ given by $g(x)=3x$.
    In this case, as the domain and codomain are the same, it makes sense to compose the two functions in any order.
    $ (f compose g)(x)=f(g(x))=f(3x)=3x+2, $ 
    $ (g compose f)(x)=g(f(x))=g(x+2)=3(x+2)=3x+6 $
    We see that even  when it makes sense to compose functions in both orders, usually $f compose g$ and $g compose f$ will differ.
]

== Image and pre-image

#definition[
    Let $f:A -> B$ be a function. The #highlight[image] or #highlight[range] of $f$ is the subset of $B$ defined by
    $ f(A) = { b in B | exists a in A, f(a) = b}. $ 

    More generally,
    for a subset $A_1 subset.eq A$, the #highlight[image] of $A_1$ is the subset of $B$ defined by
    $ f(A_1) = { b in B | exists a in A_1, f(a) = b }.$

    For a sbuset $B_1 subset.eq B$, the #highlight[inverse image] or #highlight[pre-image] of $B_1$ is the subset of $A$ defined by
    $ f^(-1)(B_1) = { a in A | f(a) in B_1}. $
]

#example[
    + For $A = {a,b,c,d}$ and $B = {0,1,2}$ consider the function $f:A -> B$
      described by the following diagram.
      #figure(
        [
            #myfun(A: A, B: B, fun: (("a",0),("b",2),("c",1),("d",2)))
        ]
        )
      
      We see that $f({a,b}) = {0,2}$ and $f^(-1)({2}) = {b,d}$.

    + Consider a function $f:RR -> RR$. Then $f^(-1)({0})$
      is exactly the set of $x in RR$ for which $f(x) = 0$ -- sometimes these $x$ are called the #emph[roots] of $f$. 

    + Consider the function  $f:RR -> RR$ given by $f(x)=x^2$.
      The image or range of this function is the set of non-negative real numbers $[0,infinity)$.

      If we take the open interval in the real line $(-2,2)=A_1$, then its image is the half closed interval $f(A_1)=(0,4)$.
      
      Computing the inverse images of some sets, we have  
      $ f^(-1)({4})={2, -2} "and" f^(-1)({-4})=emptyset. $
]

== Injective or one-to-one functions, and surjective or onto functions

#definition[
    A function $f:A -> B$ is #highlight[one-to-one] or #highlight[injective]
    if $ forall a_1, a_2 in A, a_1 eq.not a_2 => f(a_1) eq.not f(a_2). $
    
    In words: $f$ is injective if distinct elements of $A$ are always mapped to distinct elements of $B$.

    Sometimes one says that an injective function is an #highlight[injection].
]

#remark[
    It is often useful to use the #emph[contrapositive] of this 
    definition.  Taking the contrapositive of the definition, 
    we see that $f$ is injective if and only if the following holds:
    $ forall a_1,a_2 in A, f(a_1) = f(a_2) => a_1 = a_2. $

]

#definition[ 
    A function $f:A -> B$ is #highlight[onto] or #highlight[surjective] if
    $f(A) = B$. In other words, $f$ is surjective provided that
    $ forall x in B, exists a in A, f(a) = x. $

    In words, $f$ is surjective if every element of the codomain is the image of some element in the domain.

    Sometimes one says that a surjective function is a #highlight[surjection].
]

#example[
    + For $A = {a,b,c,d}$ and $B = {0,1,2}$ consider again the function 
      $f:A -> B$
      described by the following diagram.
      #figure(
        [
            #myfun(A: A, B: B, fun: (("a",0),("b",2),("c",1),("d",2)))
        ]
        )
      Then $f$ is onto since every element of $B$ appears on the right-hand side of a connecting arrow in the diagram.

      But $f$ is not one-to-one since $f(b) = f(d) = 2$ while $b eq.not d.$

    + With $A = {a,b,c}$ and $B = { 0,1,2,3}$ consider the function 
      $g:A -> B$ described by the diagram
      #figure(
        [
            #myfun(A: ("a","b","c"), 
                   B: (0,1,2,3), fun: (("a",0),("b",2),("c",1)))
        ]
        )
      Then $g$ is one-to-one. But $g$ is not onto since $3 in.not f(A).$

    + The function  $f:RR -> RR$ given by $f(x)=x^2$ is neither one to one   
      nor onto. Indeed, $f(2)=f(-2) = 4$, shows that $f$ is not one-to-one.
      As there is no real number $x$ for which $x^2 = -1$, $-1 in.not f(RR)$ so $f$ is not onto.

    + Consider the function $f:ZZ -> ZZ$ given by $f(z) = 3z +2.$

      Then $f$ is one-to-one. Indeed, suppose that $a_1,a_2 in ZZ$ and that 
      $f(a_1) = f(a_2).$ We must argue that $a_1 = a_2$.
      
      Since $f(a_1) = f(a_2)$, we know $3a_1+2=3a_1+2$.
      Subtracting 2 from both sides of the equation and dividing by 3, $a_1=a_2$, showing that $f$ is one to one..

      On the other hand, $f$ is not onto. We must find an integer which is not in the image $f(ZZ)$ of $f$.

      For this, we will show that $1 in.not f(ZZ).$
      We prove this by contradiction; thus, we suppose that for $a in ZZ$ 
      we have $f(a) = 1$. 

      We have
      $ 3a + 2 = 1 => 3a = -1 => a = -1 slash 3.$

      But the rational number $-1 slash 3$ is not an integer. 
      This contradiction proves that $f$ is not onto.
    + Now consider $g:RR -> RR$ given by $g(x) = 3x + 2$.

      The argument in the preceding example again shows that $g$ is one-to-one.

      But now $g$ is onto. Indeed, for $x in RR$, we may form
       
      The same proof we gave in (b) shows that $f$ is an injective function $RR -> RR$.

      To see that $f$ is surjective, let $y in RR$. We must find $x in RR$
      for which $f(x) = y$; i.e. we must solve the equation
      $3x + 2 = y$ for $x$. We find that
      $ 3x = y-2 => x = (y-2) slash 3. $

      We see that $f((y-2) slash 3) = y$ which confirms that $f$ is surjective.
]

#remark[
  + When writing a proof that a function $f:A -> B$ is #emph[onto],
    you should expect to start writing your proof as follows:

    "Let $b in B$. We must find $a in A$ so that $f(a) = B$."

    You should really write all that, at least for now! Though 
    of course the name of the co-domain -- and the name of the 
    element of the co-domain -- can vary.

    Then you need to give some argument about why you can find a suitable element $a$.

  + When writing a proof that a function $f:A ->B$ is #emph[one-to-one]
    you should expect to start one of two ways:

    First:

    "Let $a_1, a_2 in A$ and suppose that $f(a_1) = f(a_2)$. To 
    show that $f$ is one-to-one, we must argue that $a_1 = a_2$.""
    
    Then you need to give an argument that $f(a_1)$ and $f(a_2)$ are equal.

    Alternately, you can begin as follows:

    "Let $a_1, a_2 in A$ and suppose that $a_1 eq.not a_2$. To show
    that $f$ is one-to-one, we must argue that $f(a_1) eq.not f(a_2)$".

    Then you need to give the appropriate argument!

    ]

== Bijections

Let us look at functions that are both one to one and onto; 
such functions allow us to identify two sets.

#definition[
    A function $f:A -> B$ is #highlight[bijective] if it is both one-to-one and onto, i.e. if it is both injective and surjective. 
    
    Equivalently, $f$ is bijective provided that
    $ forall b in B, exists ! a in A "with" f(a)=b. $ 

    In words, a function is a bijection if every element in the co-domain is the image of one and only one element in the domain.

    Sometimes we say that a bijective function is a #highlight[bijection].
]

#example[
    + For any set $A$, consider the identity function
      $ id_A : A -> A "given by" id_A (a) = a "for each" a in A. $
      This function is a bijection.
    + We saw above that $f:RR -> RR$ defined by $f(x) = 3x + 2$ is a 
      bijection.
]

Bijections are functions that can be "undone" through composition with s suitable function:

#definition[
    A function $f:A -> B$ is #highlight[invertible]  if there is a function
    $g:B -> A$ such that $f compose g = id_B$ and $g compose f = id_A.$

    If $f$ is invertible, we write $f^(-1) = g$ and call $f^(-1)$ the #highlight[inverse function] to $f$.
]

#theorem[
    A function $f:A -> B$ is invertible if and only if $f$ is bijective.
] <theorem:invertible-equiv-bijective>

#proof[
    The main idea is that if $f$ is a bijection, there is a natural way of choosing for each element in $B$ one in $A$ that allows you to go back.

    $(arrow.double.l):$ Assume that $f$ is a bijection. 
    Define $g: B -> A$ as follows: as $f$ is onto, for every $b in  B$, there exists $a in  A$, $f(a)=b$.
    As $f$ is one to one, this $a$ is unique. Hence, we can define $g(b)=a$.
    As, by assumption, $f(a)=b$, it follows that $f(g(b))=f(a)=b,  forall b in  B$. We ahve proved that, $f compose g=id_B$.
    Also, with the above notations, $ forall a in  A$,  $g(f(a))=g(b)=a$. Hence, $g compose f=id_A$ and we have proved that $g$ is the inverse function to $f$ so that $f$ is invertible.

    $(arrow.double.r)$ Assume that there exists a function 
    $g: B -> A$ such that $f compose g=id_B$ and $g compose f=id_A$.
    For any $b in  B$, $f(g(b))=b$; this shows that $f$ is onto.
    Assume $f(a_1)=f(a_2)$.  Then $a_1=g(f(a_1))=g(f(a_2))=a_2$. Hence, $f$ is one to one.

]


#example[
    + For any set $A$, we have $id_A compose id_A = id_A$ so that
      $id_A^(-1) = id_A.$

    + The inverse function for the bijection $f:RR -> RR$ given by 
      $f(x) = 3x + 2$  for $x in RR$ is the function $g:RR -> RR$ given by 
      $g(y) = (y-2) slash 3$ for  $y in RR$.

    + 
]


#remark[
    An important observation is that to apply @theorem:invertible-equiv-bijective  to see that $f$ is a bijection, you must confirm two conditions: 
    $f compose g=id_B$ and $g compose f=id_A$. 
    Assuming only one of these conditions is insufficient in general.

    For example, denote by $RR_(>= 0) = [0,infinity)$ the set of real 
    numbers greater than or equal to 0.
    Define $ f:RR -> RR_(>=0) "and"  g:RR_(>=0) -> RR "by" f(x)=x^2 "and" g(x)=sqrt(x). $ 
    Then $f compose g=id_RR_(>= 0)$ but neither $f$ nor $g$ is bijective.
]

Recall that for a function $f:A -> B$, we defined the inverse image of
a subset  $B_1 subset.eq B$ as 
$ f^(-1)(B_1)= { a in A | f(a) in B_1}. $

#proposition[
  Assume that $f:A -> B$ is a bijection with inverse function 
  $g = f^(-1):B -> A$.
  Let $B_1 subset.eq B$ be any subset of $B$.

  Assume now that $f$ is a  bijection and that $g:B -> A$ is the function satisfying  $f  compose g=id_B, g  compose f=id_A$.
  Then, $f^(-1)(B_1)=g(B_1)$.

]

#proof[
  We need to prove the two inclusions  
We start with $f^(-1)(B_1) subset.eq g(B_1)$: take $a in f^(-1)(B_1)$. By definition of $f^(-1)(B_1)$, $f(a)=b in B_1$.
By definition of $g$, $g(b)=a$. Hence $a in g(B_1)$. As this is true for every $a in f^(-1)(B_1)$, we conclude that  $f^(-1)(B_1) subset.eq g(B_1)$.

Take now $a in g(B_1)$.  By definition of image of a set, there exists $b in B_1$ such that $a=g(b)$.
By definition of $g$, this means that $f(a)=b$. Hence, $f(a) in B_1$. By definition of inverse image, this means that $a in f^(-1)(B_1)$.
As this is true for every $a in g(B_1)$, we conclude that  $g(B_1) subset.eq  f^(-1)(B_1)$.
]

#remark[
  The preceding result justifies our notational redundancy. When $f$ is a bijection, taking the inverse-image of a set under $f$ is the same as taking the image under the inverse functtion.

  Be careful: when $f$ is not a bijection, the symbol $f^(-1)$ does not denote a function on the codomain of $f$.
]

#proposition[
  Let $f:A -> B$ and $g:B -> C$ be bijections. Then the composition 
  $ h=g compose f:A -> C $ is a bijection.
] <prop:composition-bijective>

#proof[
  We first show that $h$ is surjective. Let $c in C$. Since $g$ is surjective,
  we may choose $b in B$ with $g(b) = c$. Since $f$ is surjective, we may choose $a in A$ with $f(a) = b$.

  Now
  $ h(a) = (g compose f)(a) = g(f(a)) = g(b) = c $
  as required.

  Now we show that $h$ is one-to-one. Let $a_1,a_2 in A$ and suppose
  that $h(a_1) = h(a_2)$.

  Thus $g(f(a_1)) = g(f(a_2))$ and since $g$ is injective, we may conclude
  that $f(a_1) = f(a_2)$. Finally, since $f$ is injective, conclude that $a_1 = a_2$. This shows that $h$ is injective and completes the proof that $h$ is bijective.
]

#remark[
  In the setting of @prop:composition-bijective, notice that 
  $ h^(-1) = (g compose f)^(-1) = f^(-1) compose g^(-1). $

  To confirm this, notice that
  $ h compose f^(-1) compose g^(-1) = g compose f compose f^(-1) compose g^(-1) = g compose id_B compose g^(-1) = g compose g^(-1) = id_C. $
  and that
  $ f^(-1) compose g^(-1) compose h = f^(-1) compose g^(-1) compose g compose f  = f^(-1) compose id_B compose f = f^(-1) compose f = id_A. $
]

#example[
  In a previous example, we saw that the inverse of  the  function  
  $ f: RR -> RR "given by" f( r)=3r+2 "for" r in RR $ 
  is given by the rule  $ g(x)=(x-2) slash 3. $

  We can think of $f$ as the composition of two functions: first, multiply by 3 and then add two.
  
  If we define  $f_1: RR -> RR$ given as $f_1(r)=3r $, and $ f_2: RR -> RR$ given as $f_2(s)=s+2$, then $f=f_2 compose f_1$.
  
  The inverse of multiplying by 3 is dividing by 3 and the inverse of adding 2 is subtracting 2.
 
  So, if  $g_1( x)=x slash 3 $,   $g_2( y)=y-2 $, then $g_1, g_2 $ are the inverses of $ f_1, f_2$ respectively.
 
  The composition  $g=g_1 compose g_2$ is subtracting 2 first and dividing by 3 afterwards which is exactly the effect of $g$, the inverse of $f$.

]

== cancellation

#proposition[
    Let $A,B$ be sets.
    Suppose that $f:A -> B$ is a function. 
    + Suppose that $f$ is surjective. Prove that for any set $C$ and any  
      pair of functions 
      $ g_1:B -> C "and" g_2:B -> C $
      such that $g_1 compose f = g_2 compose f$, then $g_1 = g_2$. 
    + Conversely, suppose that for every set $C$ and for every pair of functions 
      $ g_1:B -> C  "and" g_2: B -> C, $
      the equality $g_1 compose f = g_2 compose f$ implies that $g_1 = g_2$. Prove
      that $f$ is surjective.
] <prop:function-composition-equalizer-surjective>

#proof[
  + We assume $f$ to be surjective and we suppose that $g_1 compose f = g_2 compose f$.
    To see that $g_1 = g_2$, we must argue that $g_1(b) = g_2(b)$ for 
    each $b in B$. So we fix $b in B$.

    Since $f$ is surjective, we may choose $a in A$ for which $f(a) = b$. Since
    $g_1 compose f = g_2 compose f$, we find that
    $ (g_1 compose f)(a) = (g_2 compose f)(a) "so that" g_1(f(a)) = g_2(f(a)), $
    and thus $g_1(b) = g_2(b)$ as required.

  + To prove that $f$ is surjective, let $b_0 in B$. 
    We must argue that there is some $a in A$ with $f(a) = b_0$.

    We are going to proceed by contradiction. Thus, we suppose that $b_0$ is not contained
    in the image $f(A)$.

    To use the hypothesis, 
    let $C = {0,1}$ be the set consisting of the two
    natural numbers $0$ and $1$. Now let
    $g_1:B -> C$ be the constant function defined by $ g_1(b) = 0 "for all" b in B, $ 
    and let
    $g_2:B -> C$ be the function defined by the rule
    $ g_2(b) = cases(1 "if" b = b_0,
                     0 "otherwise") $

    The function $g_1 compose f:A -> C$ is the constant function $a |-> 0$. 
    Since $b_0$ is not contained
    in the image $f(A)$, also $g_2 compose f:A -> C$ is the constant function $a |-> 0$. Thus
    $ g_1 compose f = g_2 compose f $ and the hypothesis now implies that $g_1 = g_2$. But
    this is a contradiction, since $g_1(b_0) = 0 eq.not 1 = g_2(b_0)).$ This contradiction
    completes the proof that $f$ is surjective.
]

#remark[
  @prop:function-composition-equalizer-surjective amounts to a characterization of surjective functions. 
  A similar characterization for injective functions appears in the homework. 
]

#pagebreak()

= Week 5 [2025-09-29]

== Cardinality of sets 

In this sections we want to look at the question of whether two sets
can be identified and in particular at whether they have the same
number of elements.  We will see that the concept "having the same
number of elements" makes sense not only for finite sets but also for
infinite ones.

Over the years, we have all developed some intuition for the concepts
of "more", "less" and "the same" based on our experience with finite
sets.  For infinite sets, the answers to some questions may be
different from what we would expect from this intuition.  For a start,
with our definition, it will not be true that all infinite sets have
the same number of elements.  On the other hand, while the set of
integers strictly contains the set of natural number and the set of
rational numbers strictly contains the integers, we will see that all
these sets have the same number of elements.  The real numbers on the
other hand have many more elements.  Let us start with a definition:

#definition[
  We say that two sets $A, B$ have the same #highlight[cardinality] if and
  only if there is a bijection between the two, in which case we write
  $|A|=|B|$.
]

== Cadinality of finite sets

#definition[
  For $n in NN$, we define the set $I_n$ as follows:
  $ I_0= emptyset $
  and for $n > 0$ by
  $ I_n = I_(n-1) union {n-1} $.  
  
  Of course, $I_n = {0,1,2,...,n-1}.$
]

#definition[

  For a set $A$ and a natural number $n in NN$, we say that a set $A$ is 
  #highlight[finite of cardinality $n$] if there is
  a bijection between $A$ and the set $I_n$ just defined.

  We then say that $|A|=n$. In particular, $|emptyset |=0$.

  We say that a set $A$ is #highlight[infinite ] if it is not finite.
]  
  

#proposition[

    Let $n in NN$ and suppose that $A$ is a finite set of cardinality $n$.
    If $b in.not A$ then $A union {b}$ is a set of cardinality $n+1$.

] <prop:finite-card-add-elem>

#proof[
    Since $|A|= n$, there is a bijection $phi:I_n -> A$.
    Now define $psi:I_(n+1) -> A union {b}$ by the rule

    $ psi(m) = cases(phi(m) "if" m < n+1,
    b "if" m=n+1.) $

    We define $mu:A union {b} -> I_(n+1)$
    by the rule
    $ mu(a) = cases(phi^(-1)(a) "if" a in A,
    n+1 "if" a = b) $

    Note that $mu$ is well-define since for any element $a in A union {b}$, either 
    $a in A$ or $a = b$ but not both.

    It is straightforward to check that
    $mu compose psi = id_(I_n)$ and that $psi compose mu = id_(A union {b}).$
]

#proposition[
  Let $M, n in NN$ and consider the set
  $ B_n (M) = { b in NN | M <= b < M+n}. $

  Then $|B_n (M)| = n.$
] <prop:cardinality-In-shifted>

Notice that $I_n = B_n (0)$.

#proof[
  In fact, we will give two proofs. Either of these proofs establishes the result; we provide both here to illustrate different techniques!

  For the #highlight[first proof], define 
  $ f:I_n -> B_n (M) "by" f(a) = a + M $
  and
  $ g:B_n (M) -> I_n "by" g(a) = a - M.  $

  First, these two maps are well defined. We need to see that the
  images are in the corresponding codomains: 
  
  An element $a$ of $I_n$ is a natural number with $0 <= a < n$. 
  Then $f(a) = a+M$ is a
  natural number with $M=1+M <= a+M < n +M$ so that $a +M in B_n (M)$.

  Similarly, an element $b$ of $B_n (M)$, is a natural number with
  $M <= b < M+n$. Then $b-M$ is a natural number with $0 = M-M <= b-M < n = M+n - M$
  so that $b-M in I_n$.

  We check that the two functions are inverse of each other:
  $ g compose f (a)=g ( f (a))=g ( a +M)=(a+M)-M=a $
  and
  $ f compose g (b)=f ( g (b))=f ( b - M)=(b-M)+M=b. $

  Thus $f$ and $g$ are inverse bijections; in particular, $f$ is a bijection between $B_n (M)$ and $I_n$ so indeed $|B_n (M)| = n.$

  For the #highlight[second proof], notice that
  $B_0 (M) = emptyset$ and for $n in NN$, $n>0$ we have
  $ B_n (M) = B_(n-1) (M) union {M+n-1}. $

  We now prove by induction on $n$ that $|B_n (M)| = n$.

  For the base case, since $B_0 (M) = emptyset$, we indeed know that $|B_0 (M)| = 0.$

  For the induction step, let $k in NN$ and suppose that $|B_k (M)| = k.$
  We must show that $|B_(k+1) (M)| = k+1.$

  Since $ B_(k+1) (M) = B_k (M) union {M+k} $ and since $M+k in.not B_k (M)$, 
  it follows from @prop:finite-card-add-elem that $|B_(k+1) (M)| = k+1$ as required.

  Thus the formula $|B_n (M)| = n$ follows by induction.


]

  
#proposition[
    Let $m,n in NN$ and let $A,B$ be finite sets of cardinality $m$ and $n$ respectively.
    Then the disjoint union $A union.sq.big B$ is finite of cardinality $m+n$.
]  <prop:disjoint-union-finite-card>

#proof[
    Since $|A|=m$ and $|B|=n$, there are bijections 
    $ phi:I_m -> A "and" psi:I_n -> B. $ 

    Let us write $iota_A:A -> A union.sq.big B$ and $iota_B:B -> A union.sq.big B$
    for the inclusion mappings. 

    We now define a mapping
    $Phi:I_(m+n) -> A union.sq.big B$
    by the rule
    $ Phi(k) = cases(iota_A (phi(k)) "if" k < m,
    iota_B (psi(k-m)) "otherwise"). $

    Notice for $k in I_(m+n)$ with $m <= k$ that $k-m in I_n$,
    so the definition is meaningful.

    On the other hand we define a mapping
    $Psi: A union.sq.big B -> I_(m+n)$
    as follows:

    any $x in A union.sq.big B$ has exactly one of the following forms:
    - $x = iota_A (a)$ for $a in A$:
      in this case, define
      $Psi(x) = phi^(-1)(a) in I_m subset.eq I_(m+n).$
    - $x = iota_B (b)$ for $b in B$: 
      in this case, define
      $Psi(x) = psi^(-1)(b)) + m in I_(m+n).$
    
    When $x = iota_B (b)$ notice that $psi^(-1)(b) in I_n$ so that $psi^(-1)(b) + m$ is indeed in $I_(m+n)$.

    For $k in I_(m+n)$ we argue that $Psi ( Phi(k)) = k.$
    - if $k < m$ then
      $ Psi(Phi(k)) = Psi(iota_A (phi(k))) = phi^(-1) (phi(k)) = k$
    - if $m <= k$ then 
      $ Psi(Phi(k)) = Psi(iota_b( psi(k - m))) = psi^(-1)(psi(k- m)) + m = k-m+m =  k$

    For $x in A union.sq.big B$ we argue that $Phi(Psi(x)) = x$.
    - if $x = iota_A (a)$ for $a in A$ then
      $ Phi(Psi(x)) = Phi(phi^(-1)(a)) = iota_A (phi(phi^(-1)(a))) = iota_A (a) = x $ 
      since $phi^(-1)(a) < m.$
    - if $x = iota_B (b)$ for $b in B$ then
      $ Phi(Psi(x)) = Phi(psi^(-1)(b) + m) = iota_B (psi(psi^(-1)(b) +m - m)) = iota_B (psi(psi^(-1)(b))) = iota_B (b) = x. $
]

#remark[
  Suppose that $f:X -> Y$ is a bijection and let $x in X$.
  Then $f$ determines by restriction a bijection
  $ X backslash {x} -> Y backslash {f(x)}. $
] <rem:bijection-restriction>

#proposition[
    Let $A$ be a finite set of cardinality $n$. If $n>0$ and if $x in A$, then
    the set $ A backslash {x} = { a in A | a eq.not x} $ has cardinality $n-1.$
] <prop:finite-set-delete-elt-dec-cardinality>

#proof[
    Since $|A| =n$, there is a bijection $phi:I_n -> A$.
    Write $k = phi^(-1) (x) in I_n.$

    Now notice that -- with notation as in @prop:cardinality-In-shifted -- 
    $ I_n = I_k union.sq.big {k} union.sq.big B_(n-k-1) (k+1); $
    recall that
    $ B_(n-k-1) (k+1) = { m in NN | k+1 <= m < k+1 + n-k-1}
    = { m in NN | k+1 <= m < n}. $
    Thus 
    $ I_n backslash {k} = I_k union.sq.big B_(n-k-1) (k+1). $

    Now, according to @rem:bijection-restriction, $phi$ determines by restriction a bijection
    $ I_n backslash {k} -> A backslash {x}. $

    Thus $ |A backslash {x}| = |I_n backslash {k}| = |I_k union.sq.big B_(n-k-1) (k+1)| = (*) $
    Using @prop:disjoint-union-finite-card we know that
    $ (*) = |I_k| + |B_(n-k-1) (k+1)|;$
    In turn, @prop:cardinality-In-shifted shows that
    $|B_(n-k-1)(k+1)| = n-k-1.$
    Thus we have proved that
    $ |A backslash {x}| = k + (n-k-1) = n-1, $
    as required.

]  

Finally, we need to establish that cardinality is unambiguous. Namely, we prove that

#proposition[
  Let $m,n in NN$ and let $A$ and $B$ be finite sets with $|A| = m$ and $|B| = n.$
  If there is a bijection between $A$ and $B$ then $m=n.$
]

#proof[
  We have proved that the composition of bijections is a bijection @prop:composition-bijective. Our assumptions give a bijection
  $I_m ->^tilde A$ and a bijection $I_n ->^tilde B$. Thus, there is a bijection
  $I_m ->^tilde I_n$.
  
  Without loss of generality, we may and will suppose that $n <= m$.

  We proceed by induction on $n$.

  If $n = 0$, then $I_n = emptyset.$ Since $I_n$ and $I_m$ are in bijection,
  there can be no elements in $I_m$, either. In other words, $I_m = emptyset$ 
  so that $m = 0.$ This establishes the base-case of the induction.

  Now suppose that $k in NN$ and that we know  the following:
  whenever $k <= m$ and $I_k$ and $I_m$ are in bijection, then $k= m.$

  Given $k+1 <= m$ and a bijection $phi:I_(k+1) -> I_m$, we must argue
  that $k+1 = m$.

  Well, the restriction of $phi$ to the subset $I_k = I_(k+1) backslash {k+1}$ determines a bijection
  $ phi':I_k -> I_m backslash {phi(k+1)}; $
  see @rem:bijection-restriction.
  It follows from @prop:finite-set-delete-elt-dec-cardinality that
  the cardinality of $I_m backslash { phi(k+1) }$ is equal to $m-1$; since
  $phi'$ is a bijection, the cardinality
  of $I_k$ is $m-1$. Thus $k = m - 1$ so that $k+1 = m$ as required.

  Now the equality $m=n$ follows by induction.
]

#proposition[
  If $A$ is a finite set with $n$ elements and $B subset.eq A$, then
  $B$ is a finite set with at most $n$ elements and it has precisely
  $n$ elements if and only if $B=A$.
] <prop:subset-of-finite-set>

#proof[
  As $A$ is finite with $n$ elements, there is a bijection between $A$
  and $I_n={ 0,1,..., n-1}$.  Using this bijection, we can identify
  $A$ with $I_n$ and just assume that $B$ is a subset of $I_n$.

  What
  we need to do is define a bijection between $B$ and a set $I_k={
  1,2,..., k},$ for some $ k <= n$.  Equivalently, we need to label
  the elements of $B$ with numbers $1,2,..., k$ for some $k$ We can
  do this as follows: we choose the smallest element $b_0 in B$ and we
  will label it with 0, then we choose the smallest number in $b_1 in
  B-{ b_0}$ and we label it with 1 and so on.  We keep going until
  we run out of elements in $B$. 
  
  Observe that
  $ b_0 < b_1 < b_2 < ... $
   As $b_0 in B subset.eq I_n={
  0,1,..., n-1}$, we have $1 <= b_1$. From our choice of $b_0$ as the
  smallest element $B$ , $0 <= b_0<b_1$, so $1 <= b_1$.  Similarly
  $k <= b_k$ and because all the elements in $B$ are in $I_n$, there
  are at most $n$ elements $b_k$. 
  So, we will run out of elements in $B$ after at
  most $n$ steps.  Moreover, if we need all of the $n$ steps, then
  $b_0=0, b_1=1,..., b_(n-1)=(n-1)$ and therefore $B=I_n$.  
]

#pagebreak()

= Week 6 [2025-10-06]

== Cardinality of infinite sets

#definition[
  A set $A$ is #highlight[countable], or #highlight[countably infinite],
  if there is a bijection between $A$ and the set $NN$ of natural numbers.
]

#proposition[
  The set $E$ of even natural numbers is countably infinite.
]

#proof[
  We will exhibit a bijection between $E$ and $NN$.
  For this, define functions 
  $ f:NN -> E "by the rule" f(a) = 2a $ and
  $ g:E -> NN "by the rule" g(b) = e slash 2. $
  
  These functions are well defined as by definition, a natural number
  $b$ is even if and only if there exists another natural number $a$
  such that $b=2a$.  So, for any natural number $a$, $2a$ is an even
  number and for every even number $b$, $b slash 2$ is a natural
  number.  Moreover, the two functions are inverse of each other as

  $ (g compose f)(a)=g( f(a))=g( 2a)=2a slash 2=a $
  and
  $ (f compose g)(b)=f( g(b))=f( b slash 2)=2 dot (b slash 2) = b. $
]

#proposition[
  The set $ZZ$ of integers is countably infinite.
]

#proof[
  We will exhibit a bijection between $ZZ$ and $NN$.

  Our bijection will identify even natural numbers with non-negative integers,
  and odd natural numbers with negative integers.

  Define
  $ f:NN -> ZZ "by the rule" f(n) = cases(n slash 2 "if" n = 2k "is even",
  -(n+1) slash 2 "if" n = 2k+1 "is odd"
  ) $
  and define
  $ g: ZZ -> NN "by the rule" g(z) = cases(2z "if" z>=0,
  -2z-1 "if" z<0) $

  We check that the functions are mutually inverse:

  For $z in ZZ$, if $z>=0$ then
  $ (f compose g)(z) = f(g(z)) = f(2z) = z $
  while if $z<0$ then
  $ (f compose g)(z) = f(g(z)) = f(-2z-1) = -(-2z - 1 + 1) slash 2 = z. $
  This shows that $f compose g = id_ZZ$.

  For $n in NN$, if $n = 2k$ is even then
  $ (g compose f)(n) = g(f(n)) = g(n slash 2) = 2 dot (n slash 2) = n $
  while if $n = 2k+1$ is odd then
  $ (g compose f)(n) = g(f(n)) = g(-(n+1) slash 2) =
  -2(-(n+1) slash 2) - 1 = n+1-1 = n. $
  This shows that $g compose f = id_NN$.
]

#let ff(n) = {
  if (calc.rem(n,2) == 0) {return n/2} else {return -(n+1)/2}
}

#let gg(z) = {
  if (z >= 0) {return 2*z} else {return -2*z - 1}
}

#remark[
  Using the bijection described in the previous proof, note that
  #grid(
    columns: (auto,auto),
    gutter: (50pt, 50pt),
    table(
      columns: (auto,auto),
      $n$, $f(n)$,
      ..for n in range(9) {
        ([#n], [#ff(n)])
      }),
    table(
      columns: (auto,auto),
      $z$, $g(z)$,
      ..for z in range(-4,5) {
        ([#z], [#gg(z)])
      }
    ))
]

#proposition[
  If $A$ is a countably infinite set and $B subset.eq A$, then $B$ is either
  finite or countably infinite.
] <prop:subset-countable-set>

#proof[
    As $A$ is countable, there is a bijection between $A$ and $NN$.
  Using this bijection, we can identify $A$ with $NN$ and just assume
  that $B$ is a subset of $NN$.

  What we need to do is to find a way to label the elements in $B$ as
  $ 1,2,..., k,...$.  We proceed as in the proof of @prop:subset-of-finite-set. 
  Since $B$ is a subset of $NN$, the well
  ordering principle permits us to choose the smallest element $b_0 in B$.  
  If $b_0,b_1,...,b_m$ have been chosen we choose
  $b_(m+1)$ to be the small element of $B backslash { b_0,b_1,...,b_m}.$  
  
  Observe that
  $ b_0 < b_1 < b_2 < ... $

  If after $n$ steps, $B backslash { b_0, b_1, ... , b_(n-1)} = emptyset$,
  then $B = {b_0,...,b_(n-1)}$ is finite of cardinality $n$.

  Otherwise, notice that $(suit.club) #h(3mm) { b_i | i in NN} subset.not.eq I_m$ for any $m in NN.$
  
  we claim that $B = {b_i | i in NN}$ so that $B$ is countably 
  infinite.

  Clearly ${b_i | i in NN} subset.eq B$ by construction. To prove the other inclusion,
  we proceed by contradiction.

  Thus we suppose that $B backslash {b_i | i in NN}$ is non-empty.
  By the well-ordering principle, there is a smallest element $c in B backslash {b_i | i in NN}.$

  In view of $(suit.club)$, ${b_i | i in NN} subset.not.eq I_c$ so $exists j in NN,
  c < b_j$. But this is a contradiction since $b_j$ was chosen to be the smallest element of $B backslash {b_0,...,b_(c-1)}$ and $c in B backslash {b_0,...,b_(c-1)}.$

  This contradiction proves that $B = {b_i | i in NN}$ so that $B$ is indeed countably infinite, as required.
]

#proposition[
  Let $X$ and $Y$ be sets and suppose that $f:X -> Y$ is a surjective
  function. If $X$ is countably infinite, then $Y$ is countably infinite or finite.
] <prop:image-countably-infinite>

#proof[
  We first show that there is a "right inverse" to $f$; i.e. a function
  $g:Y -> X$ such that $f compose g = id_Y$.

  Indeed, to define $g$, for each $y in Y$ we _choose_ some element
  $x$ of the inverse image $f^(-1)({y})$. Since $f$ is surjective, such a choice is always possible.

  Since $f(g(y)) = y$ by definition, indeed $f compose g = id_Y.$

  Now, note that $g$ is an _injective_ function. This follows from a homework problem, and may be proved as follows.

  Suppose that $y_1,y_2 in Y$ and that $g(y_1) = g(y_2)$. To see that
  $g$ is injective, we must argue that $y_1 = y_2$.

  But $ g(y_1) = g(y_2) => f(g(y_1)) = f(g(y_2)) => (f compose g)(y_1) = (f compose g)(y_2) => y_1 = y_2 $

  Since $g$ is injective, the Proposition follows by applying @prop:subset-countable-set to the subset $ g(Y) subset.eq X. $
]

#proposition[
  Suppose that $X$ and $Y$ are countably infinite sets. Then the cartesian
  product $ X times Y = {(x,y) | x in X, y in Y} $ is countably infinite.
]

#proof[
  By hypothesis, there is a bijection between $X$ and $NN$, and a bijection between $Y$ and $NN$. Thus we can identify $X times Y$ with
  $NN times NN$, and our task is to prove that $NN times NN$ is countably infinite.

  For each $n in NN$, consider the set $D_n$  of elements $(i,j) in NN times NN$ for which $i  + j = n$.
  Thus
  $ D_n = {(i,j) in NN times NN | i + j = n}. $
  
  There are $n+1$ elements in $D_n$, namely

  $ D_n = { (0,n), (1,n-1), (2,n-2), ..., (n-2,2), (n-1,1) ,(n,0)} $

  To give a bijection between $NN times NN$ and $NN$, our task is to label all the elements in $NN times NN$.

  Since $ NN = union.sq.big_(n in NN) D_n $
  we will accomplish this by first labeling the element of $D_0$ with $0$, the elements of $D_1$ with $1$ and $2$, the elements of
  $D_2$ with $3,4,5$ and so forth.

  Note that the labels for the elements in $D_n$ must begin 
  at the number
  $ |D_0| + |D_1| + ... + |D_(n-1)| = sum_(i=0)^(n-1) (i+1) = 
  sum_(j=1)^n j = n(n+1) slash 2. $

  Here is concrete description of this labeling:

  Define 
  $ f : NN times NN -> NN "by" f(i,j) =  i + (i+j)(i+j+1) slash 2. $
  
  To define the inverse function
  $ g: NN -> NN times NN $
  notice that $n(n+1) slash 2$ is an increasing function of $n$ that is unbounded. Thus for any $m in NN$ we can find a unique natural
  number $n in NN$ for which
  $ n(n+1) slash 2 <= m < (n+1)(n+2) slash 2. $

  We define
  $ g(m) = (m - n(n+1) slash 2, n-m + n(n+1) slash 2) $

  We now check that $g compose f  = id_(NN times NN)$. Let $(i,j) in NN times NN$ and write $n = i + j$. We must argue that $g compose f)(i,j) = (i,j)$.
  Using the definitions we find
  #align(center,
  $(g compose f)(i,j) &= g(i + (i+j)(i+j+1) slash 2) \
  & = g(i + n(n+1) slash 2) \
  & =  (i + n(n+1) slash 2 - n(n+1) slash 2, n - (i + n(n+1) slash 2) + n(n+1) slash 2) \
  & =  (i,n-i)  = (i,j)
  $)
  as required..

  Finally, we show that $f compose g = id_NN.$ Let $m in NN$ and find the unique
  $n in NN$ for which
  $ n(n+1) slash 2 <= m < (n+1)(n+2) slash 2$. 
  We must confirm that $(f compose g)(m) = m.$
  Using definitions, we have:
  #align(center,
  $
    (f compose g)(m) &= f(m - n(n+1) slash 2, n -m + n(n+1) slash 2)\
    &= m - n(n+1) slash 2 + n(n+1) slash 2 \
    &= m
  $)
  as required.
]


#let diagF(i,j) = {
  i + (i+j)*(i+j+1)/2
}

#let rowsF(n) = (
  range(n).map(j => 
   (j,) +  range(n).map(i => diagF(i,j)))
  )

#remark[
  Some values of the function $f:NN times NN -> NN.$
  In the table, the first row contains values of $i$ and the first column contains values of $j$. The remaining entries are the values $f(i,j).$

    #align(center)[#table(
      columns: 12*(auto,),
      fill: (i,j) => if i == 0 or j == 0 {yellow} else {none},
      [i $backslash$ j], ..range(11).map(i => [#i]),
      ..rowsF(11).flatten().map(i => [#i])
    )]
]

#corollary[
  The set of non-negative rational numbers $QQ_(>= 0)$ is countably infinite.
] <cor:non-neg-rationals-countable>

#proof[
  A non-negative rational number may be expressed uniquely
  in the form $n slash m$ where $(n,m) in NN times NN$, $m eq.not 0$ and 
  $n$ and $m$ have no common divisor.

  Thus $QQ_(>= 0)$ may be identified with a subset
  of $NN times NN$. In view of @prop:subset-countable-set, we  know
  that $QQ_(>= 0)$ is either finite or countably infinite.

  Since $NN subset QQ_(>=0)$, we know that $QQ_(>=0)$ is not finite,
  and the Corollary is proved. 
]

#remark[
  An alternative line of argument is to note that there is a surjective
  mapping $NN times NN_(>0) -> QQ_(>= 0)$ given 
  by $(m,n) |-> m slash n.$ Now apply @prop:image-countably-infinite.
]

#corollary[
  The set $QQ$ of rational numbers is countably infinite.
]

#proof[
  Note that $QQ$ is the disjoint union
  $ QQ = QQ_(>= 0) union.sq.big QQ_(< 0). $

  According to @cor:non-neg-rationals-countable, there is a bijection
  $phi:QQ_(>=0) ->^tilde NN$.

  The mapping $x |-> -x$  puts $QQ_(<0)$ with an infinite subset
  of $QQ_(>= 0)$, so  by @prop:subset-countable-set there is a bijection $psi:QQ_(<0) ->^tilde NN$.

  Now consider the mapping

  $ Phi:QQ=QQ_(>=0) union.sq.big QQ_(<0) -> NN times NN $
  given by
  $ f(x) = cases((phi(x),0) "if" x >=0 ,
  (0,psi(x)) "otherwise.") $

  Then $Phi$ is one-to-one so that $QQ$ identifies with an infinite
  subset of the countably infinite set $NN times NN$; thus $QQ$ is countably infinite.
]

#theorem[
  The infinite set $RR$ is not countably infinite.
]

#proof[
  You will show for homework that $RR$ is in bijection with the
  open interval $(0,1)$. So the result will follow if we show
  that $(0,1)$ is not countably infinite.

  Note that an $x in (0,1)$
  may be represented as a decimal expression. 
  For example, the decimal expression $x = 0.519overline(6)$ is the number
  $ x = 5/10 + 1/100 + 9/1000 + 6(sum_(i=4)^infinity 1/10^i ) $

  If the interval $(0,1)$ were countable, we could order all the
  decimals expressions between 0 and 1 and put them in correspondence
  with the positive natural numbers $NN_(>0).$
  
  So, we suppose that $(0,1) = {a_i | i in NN_(>0)}.$

  We are going to show that there is at least one
  real number $y in (0,1)$ not in our list. We are going to construct
  $y$ be specifying the decimal digits of $y$.
  
  To define the $n$th decimal digit of $y$, we look at the $n$th decimal digit of the element $a_n$ in our list. 
  
  If that digit is some number 
  $b<9$, we use $b+1$ as the $n$th decimal digit of $y$.  
  
  If that digit is $a=9$, we use $0$ as the $n$th of $y$.  
  
  For example, if our list begins

  #table(
    columns: 2*(auto,),
    [$a_1$], [0.123123123...],
    [$a_2$], [0.121221222...],
    [$a_3$], [0.123456789...],
    [$a_4$], [0.345189237...],
    [$a_5$], [0.116722298...],
    [$a_6$], [0.336721498...],
    [$a_7$], [0.000999835...]
  )

  then the decimal expansion of $y$ would begin
  $ y = 0.2342320... $

  We notice for each $n$ that the $n$-th decimal digit of $y$ is different from the $n$th decimal digit of $a_n$. Thus $y eq.not a_n$.
  Since this holds for each $n$, $y in.not {a_i | i in NN}.$
  
  Also, $y$
  is strictly between 0 and 1:if it were identically 0, it would mean
  that in the original list, the $n$th digit of $a_n$ is equal to 9
  for each $n$.  But many decimals between 0 and 1 have no decimal digits of 9 at all,
  so the original list was incomplete.  
  
  Similarly, if the new number
  were $0.999999...=1$, it would mean that $a_n$ has 0 as its $n$th decimal digit.  But many
  decimals between 0 and 1 have no $0$'s at all, so the original list
  was incomplete.  This contradiction 
  completes the proof that the interval of the
  real line $(0,1)$ is not countable and therefore $RR$ itself
  is not countable.
 
]

#pagebreak()

== Counting problems; products and unions of sets.

#proposition[
  Assume that $A, B$ are finite  sets.
  Then $A union B$ is finite and 
  $ |A union B|=|A|+|B|-|A inter B|. $
]

#proof[
  We can write $B$ as the union of disjoint subsets
  $ B = (B inter A) union (B backslash A). $
  Thus @prop:disjoint-union-finite-card shows that
  $|B| = |B inter A| + |B backslash A|.$

  Thus we have
  $ (*) #h(3mm) |B backslash A| = |B| - |B inter A|. $

  Now, we can write $A union B$ as the union of disjoint
  subsets
  $ A union B = A union (B backslash A). $

  Since this union is disjoint, we find
  $ |A union B| = |A| + |B backslash A|. $

  Now substituting $(*)$, we arrive at the formula
  $ |A union B| = |A| + |B| - |B inter A| $
  as required.
]

#example[
  At a certain large gathering, twenty percent of attendees 
  wear a blue T-shirt and ten percent wear a blue baseball hat while only four percent wear both.
  
  This means that $20+10-4=26$ percent wear at least one of the two
  blue articles.
]

== Products

Recall that the cartesian product of two sets is the set of pairs with the first element in the first set, the second in the second set. -- see @defn:cartesian-product.

We just saw that the disjoint union of two sets has cardinality equal to the sum of the two cardinalities.
In a similar way, we are going to see now that the cartesian product has cardinality equal to the product of the two cardinalities

#proposition[
  Assume that $A, B$ are finite sets of cardinality $m$ and $n$  respectively.
  Then $A times B$ is finite of cardinality   $m n$. 
]

#proof[
  From our assumptions, there are bijections
  $ f:I_m -> A "and" g:I_n -> B. $

  We now define a function
  $ h:A times B -> I_(m n) "by"
  h(a,b) = m dot g(b) + f(a). $

  We claim that $h$ is a bijection. 

  We first show that $h$ is one-to-one.
  For this, let $(a,b), (a',b') in A times B$
  and suppose that $h(a,b) = h(a',b').$ We must
  argue that $(a,b) = (a',b').$

  By assumption we know that
  $ (*) #h(3mm) m dot g(b) + f(a) = m dot g(b') + f(a'). $

  Since $f(a), f(a') in I_m$, the remainder upon
  division of $h(a,b)$ by $m$ is $f(a)$ and the remainder
  upon division of $h(a',b')$ by $m$ is $f(a')$.

  Since $h(a,b) = h(a',b')$ by assumption, these 
  remainders are equal by @prop:division-with-remainder-NN.
  Thus $f(a) = f(a')$ and since $f$ is a bijection, we conclude
  that $a = a'$.

  Now $(*)$ shows that
  $m dot g(b) = m dot g(b') $
  so that $g(b) = g(b')$. Since $g$ is a bijection, conclude
  that $b = b'$.

  Thus $(a,b) = (a',b')$ and we have proved that $h$ is one-to-one.

  We now prove that $h$ is onto.
  Given $x in I_(m n)$, divide $x$ by $m$ to obtained
  $ x = q m + r "where" q,r in NN, 0 <= r < m $
  as in @prop:division-with-remainder-NN.

  Note that $ 0 <= x  = q m + r < m n. $
  Thus $ q m < m n  => q < n. $
  In particular, $q in I_n$ and $r in I_m$. Now set
  Let $b = g^(-1)(q)$ and $a = f^(-1)(r)$
  and it is easy to see that
  $ h(a,b) = x. $

  This proves that $h$ is onto and completes the proof that
  $h$ is a bijection. We now conclude that $|A times B| = m n$ as required.
]
