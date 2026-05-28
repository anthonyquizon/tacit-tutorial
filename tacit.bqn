#<h1> Tacit Tutorial by Example</h1>
#<small>Prerequisite: <a href="https://mlochbaum.github.io/BQN/tutorial/">BQN tutorial</a>.</small>
#<small>Some code is dimmed for clarity.</small>
#<h2> Expanded Forms</h2>
#<h3> Trains</h3>
#<section>
#<div hidden>
{
#</div><pre><code><span class="deemphasize">
F‿G‿H‿I‿J‿K‿L← {𝕊f:{ 𝕊𝕩: ∾"("‿f‿" "‿𝕩‿")" ; 𝕨𝕊𝕩: ∾"("‿𝕨‿" "‿f‿" "‿𝕩‿")" }}¨'F'+↕7 ⋄ w‿x←"𝕨𝕩"
#</span>
((G F) x)         ≡                    G (  F x)
((H G F) x)       ≡            (  H x) G (  F x)
((I H G F) x)     ≡         I ((  H x) G (  F x))
((J I H G F) x)   ≡ (  J x) I ((  H x) G (  F x))

(w (G F) x)       ≡                    G (w F x)
(w (H G F) x)     ≡            (w H x) G (w F x)
(w (I H G F) x)   ≡         I ((w H x) G (w F x))
(w (J I H G F) x) ≡ (w J x) I ((w H x) G (w F x))
#</code></pre>
#<div hidden>
}
#</div>
#<div hidden>
{
#</div>
#<h3> Combinators</h3><pre><code><span class="deemphasize">
F‿G‿H‿I‿J‿K‿L← {𝕊f:{ 𝕊𝕩: ∾"("‿f‿" "‿𝕩‿")" ; 𝕨𝕊𝕩: ∾"("‿𝕨‿" "‿f‿" "‿𝕩‿")" }}¨'F'+↕7 ⋄ w‿x←"𝕨𝕩"
#</span>
(w G∘F x)       ≡ G (w F x)
(w G⊸F x)       ≡ (G w) F x
(w G⟜F x)       ≡ w G (F x)
(w G○F x)       ≡ (F w) G (F x)
(w (I H G)⊸F x) ≡ ((I w) H (G w)) F x
(w (I H⊸G F) x) ≡ (H (w I x)) G (w F x)
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

#<section>
#<h2> Examples from <a href="https://mlochbaum.github.io/bqncrate/" target="_blank">BQNCrate</a> </h2>
#<p>  Sort indices j1 according to data x<br/>
#<code class="inline-code">x(⊏˜⍋⊸⊏⊢)j1</code>
#</p>
#<div hidden>
{
#</div>
#<pre><code><span class="deemphasize">
w←↕4⋄x←1‿3‿2‿0 ⋄ I‿H‿G‿F←⟨⊏˜,⍋,⊏,⊢⟩
#</span>
a←w (     ⊏˜    ⍋⊸⊏   ⊢  ) x
b←w (     I     H⊸G   F  ) x
c←  (H (w I  x)) G (w F x)
d←  (⍋ (w ⊏˜ x)) ⊏ (w ⊢ x)
#<span class="deemphasize">
##   (     ⊏˜    ⍋⊸⊏   ⊢  )
##         │     │ │   │
##         │     ⍋⊸⊏   │
##         ⊏˜     │    │
##         └──────┼────⊢
## ───────────────┘
"Should all be the same" !∧´a⊸≡¨b‿c‿d
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
w←','=x←"hello, world, !" ⋄ K‿J‿I‿H‿G‿F←⟨⊢,-˜,+`,×,¬,⊔⟩
#</span>
a←w (⊢    -˜   +`    ×  ¬    )⊸⊔ x  
b←w (K    J    I     H  G    )⊸F x      
c← ((K w) J  ((I  w) H (G w))) F x
d← ((⊢ w) -˜ ((+` w) × (¬ w))) ⊔ x
#<span class="deemphasize">
##   (⊢    -˜   +`    ×  ¬    )⊸⊔
##    │    │    │        │      │
##    │    │    +`       │      │
##    │    │     └────×──¬      │
##    │    -˜         │         │
##    ⊢────┼──────────┘         │
##         └───────────────────⊸⊔
##
"Should all be the same" !∧´a⊸≡¨b‿c‿d
#</span>
#</code></pre>
#<div hidden>
}
#</div>
#</section>
#<div>Source: <a href='https://github.com/anthonyquizon/tacit-tutorial'>github.com/anthonyquizon/tacit-tutorial</a></div>
