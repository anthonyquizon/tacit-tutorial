#<h1> Tacit Tutorial by Example</h1>
#<small>Prerequisite: <a href="https://mlochbaum.github.io/BQN/tutorial/">BQN tutorial</a>.</small>
#<small>Some code is dimmed for clarity.</small>
#<h2> Expanded Forms</h2>
#<h3> Trains</h3>
#<section>
#<div hidden>
{
#</div><pre><code><span class="deemphasize">
F‿G‿H‿I‿J‿K‿L← {𝕊f:{ 𝕊𝕩: ∾"("‿f‿" "‿𝕩‿")" ; 𝕨𝕊𝕩: ∾"("‿𝕨‿" "‿f‿" "‿𝕩‿")" }}¨'F'+↕7 ⋄ w‿x←"wx"
#</span><span class="deemphasize">
## Monadic
#</span>
((F G) x)         ≡  F   (G x)
((F G H) x)       ≡ (F x) G   (H x)
((F G H I) x)     ≡  F   (G x) H   (I x)
((F G H I J) x)   ≡ (F x) G   (H x) I   (J x)
#<span class="deemphasize">
## Dyadic
#</span>
(w (F G) x)       ≡    F (w G x)
(w (F G H) x)     ≡ (w F x) G (w H x)
(w (F G H I) x)   ≡    F (w G x) H (w I x)
(w (F G H I J) x) ≡ (w F x) G (w H x) I (w J x)
#</code></pre>
#<div hidden>
}
#</div>
#<div hidden>
{
#</div>
#<h3> Combinators</h3><pre><code><span class="deemphasize">
F‿G‿H‿I‿J‿K‿L← {𝕊f:{ 𝕊𝕩: ∾"("‿f‿" "‿𝕩‿")" ; 𝕨𝕊𝕩: ∾"("‿𝕨‿" "‿f‿" "‿𝕩‿")" }}¨'F'+↕7 ⋄ w‿x←"wx"
#</span></span><span class="deemphasize">
## Monadic
#</span>
(F∘G x) ≡ F (G x)
(F○G x) ≡ F (G x)
(F⊸G x) ≡ (F x) G x
(F⟜G x) ≡ x F (G x)
(F˜  x) ≡ x F x
#<span class="deemphasize">
## Dyadic
#</span>
(w F∘G x) ≡ F (w G x)
(w F○G x) ≡ (G w) F (G x)
(w F⊸G x) ≡ (F w) G x
(w F⟜G x) ≡ w F (G x)
(w F˜  x) ≡ x F w
#<span class="deemphasize">
##  F∘G 𝕩   𝕨 F∘G 𝕩    F○G 𝕩   𝕨 F○G 𝕩
##   F         F        F         F   
##   |         |        |        / \  
##   G         G        G       G   G 
##   |        / \       |       |   | 
##   𝕩       𝕨   𝕩      𝕩       𝕨   𝕩 

##   F⊸G 𝕩   𝕨 F⊸G 𝕩    F⟜G 𝕩   𝕨 F⟜G 𝕩          
##    G         G        F         F           
##   / \       / \      / \       / \            
##  F   |     F   |    |   G     |   G          
##   \ /      |   |     \ /      |   |          
##    𝕩       𝕨   𝕩      𝕩       𝕨   𝕩         
#</span></code></pre>
#<div hidden>
}
#</div>
#</section>

#<h2> Examples from <a href="https://mlochbaum.github.io/bqncrate/" target="_blank">BQNCrate</a> </h2>
#<small>x,y,z:any m,n:num i,j:int a,b:bool c,d:char f,g,h:fn 0:unit 1:list 2:tab</small>

#<section>
#<p>First and last i0 major cells of y<br/>
#<code class="inline-code">i0(↑⋈↓)y</code>
#</p>
#<div hidden>
{
#</div>
#<pre><code><span class="deemphasize">
i0←2⋄y←"abcd" ⋄ F‿G‿H←⟨↑,⋈,↓⟩
#</span>
a←i0 (   ↑    ⋈     ↓  ) y
b←i0 (   F    G     H  ) y
c←   (i0 F y) G (i0 H y)
d←   (i0 ↑ y) ⋈ (i0 ↓ y)
#<span class="deemphasize">
##    (   ↑    ⋈     ↓  )
##        │          │
##        ↑────⋈─────↓
##  ╶──────────┘
"Should all be the same" !∧´a⊸≡¨b‿c‿d
#</span>
#</code></pre>
#<div hidden>
}
#</div>
#</section>

#<section>
#<p>Round to zero values of n within m of zero<br/>
#<code class="inline-code">m(≤⟜|×⊢)n</code>
#</p>
#<div hidden>
{
#</div>
#<pre><code><span class="deemphasize">
m←1‿2‿3‿4⋄n←2‿1‿3‿5 ⋄ F‿G‿H‿I←⟨≤,|,×,⊢⟩
#</span>
a←m (  ≤⟜ |     ×    ⊢  ) n
b←m (  F⟜ G     H    I  ) n
c←  (m F⟜ G n)  H (m I n)  
d←  (m F (G n)) H (m I n)  
e←  (m ≤ (| n)) × (m ⊢ n)
#<span class="deemphasize">
##   (  ≤⟜ |     ×    ⊢  )
##      │  │          │
##      ≤⟜ |          │
##       └───────×────⊢
##  ╶────────────┘
"Should all be the same" !∧´a⊸≡¨b‿c‿d‿e
#</span>
#</code></pre>
#<div hidden>
}
#</div>
#</section>

#<section>
#<p>  Sort indices j1 according to data x<br/>
#<code class="inline-code">x(⊏˜⍋⊸⊏⊢)j1</code>
#</p>
#<div hidden>
{
#</div>
#<pre><code><span class="deemphasize">
x←↕4⋄j1←1‿3‿2‿0 ⋄ F‿G‿H‿I←⟨⊏,⍋,⊏,⊢⟩
#</span>
a←x (      ⊏˜     ⍋⊸⊏    ⊢   ) j1
b←x (      F˜     G⊸H    I   ) j1
c←  (   x  F˜ j1) G⊸H (x I j1)
d←  (G (j1 F  x))  H  (x I j1)
e←  (⍋ (j1 ⊏  x))  ⊏  (x ⊢ j1)
#<span class="deemphasize">
##   (     ⊏˜      ⍋⊸⊏    ⊢   )
##         │       │ │    │
##         │       ⍋⊸⊏    │
##         ⊏˜       │     │
##         └────────┼─────⊢
## ─────────────────┘
"Should all be the same" !∧´a⊸≡¨b‿c‿d‿e
#</span>
#</code></pre>
#<div hidden>
}
#</div>
#</section>

#<section>
#<p>  Split y at 1s in a1, not including cells of y at those locations<br/>
#<code class="inline-code">a1(⊢-˜+`×¬)⊸⊔y</code>
#</p>
#<div hidden>
{
#</div>
#<pre><code><span class="deemphasize">
a1←','=y←"hello, world, !" ⋄ F‿G‿H‿I‿J‿K←⟨⊢,-,+,×,¬,⊔⟩
#</span>
a←a1 ( ⊢      -˜   +`     ×  ¬     )⊸⊔ y
b←a1 ( F      G˜   H`     I  J     )⊸K y      
c←  (( F  a1) G˜ ((H` a1) I (J a1)))⊸K y
d←  (((H` a1) I   (J a1)) G (F a1) ) K y
e←  (((+` a1) ×   (¬ a1)) - (⊢ a1) ) K y
#<span class="deemphasize">
##    ( ⊢      -˜   +`     ×  ¬     )⊸⊔
##      │      │    │         │       │
##      │      │    +`        │       │
##      │      │     └─────×──¬       │
##      │      -˜          │          │
##      ⊢──────┼───────────┘          │
##             └─────────────────────⊸⊔
##
"Should all be the same" !∧´a⊸≡¨b‿c‿d
#</span>
#</code></pre>
#<div hidden>
}
#</div>
#</section>

#<div>Source: <a href='https://github.com/anthonyquizon/tacit-tutorial'>github.com/anthonyquizon/tacit-tutorial</a></div>

