#<h1> Tacit tutorial by example</h1>
#<h2> Trains printed in explicit form</h2>
#<small>Some code is dimmed for clarity.</small>
#<section>
#<pre><code><span class="deemphasize">
F‿G‿H‿I‿J‿K‿L← {𝕊f:{
   𝕊𝕩: ∾"("‿f‿" "‿𝕩‿")"
; 𝕨𝕊𝕩: ∾"("‿𝕨‿" "‿f‿" "‿𝕩‿")"
}}¨'F'+↕7
#</span>
"𝕨" (G F) "𝕩"            #                               (G (𝕨 F 𝕩))
"𝕨" (H G F) "𝕩"          #                       ((𝕨 H 𝕩) G (𝕨 F 𝕩))
"𝕨" (I H G F) "𝕩"        #                    (I ((𝕨 H 𝕩) G (𝕨 F 𝕩)))
"𝕨" (J I H G F) "𝕩"      #            ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩)))
"𝕨" (K J I H G F) "𝕩"    #         (K ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩))))
"𝕨" (L K J I H G F) "𝕩"  # ((𝕨 L 𝕩) K ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩))))

"𝕨" G⊸F "𝕩"              # ((G 𝕨) F 𝕩)
"𝕨" G⟜F "𝕩"              # (G 𝕨 (F 𝕩))
"𝕨" G○F "𝕩"              # ((F 𝕨) G (F 𝕩)))
"𝕨" (I H G)⊸F "𝕩"        # (((I 𝕨) H (G 𝕨)) F 𝕩)
#</code></pre>
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
#x←"hello, world, !" ⋄ j1←y=',' ⋄ F‿G‿H‿I‿J‿K←⟨¬,×,+`,-˜,⊣,⊔⟩
#</span>
#a←x(⊏˜⍋⊸⊏⊢)j1
#b←x() a1  (J     I    H      G  F     )⊸K y      
#c←   (((J a1) I  ((H  a1) G (F a1))) K y)
#d←   (((⊢ a1) -˜ ((+` a1) × (¬ a1))) ⊔ y)
#<span class="deemphasize">
𝕩
#"Should all be the same" !∨´a⊸≡¨b‿c‿d
#</span>
#</code></pre>
#<div hidden>
}
#</div>
#</section>

#<section>
#<p>  Split y at 1s in a1, not including cells of y at those locations<br/>
#<code class="inline-code">a1 (⊢ -˜+`× ¬)⊸⊔ y</code>
#</p>
#<div hidden>
{
#</div>
#<pre><code><span class="deemphasize">
y←"hello, world, !" ⋄ a1←y=',' ⋄ F‿G‿H‿I‿J‿K←⟨¬,×,+`,-˜,⊣,⊔⟩
#</span>
a← a1  (⊢     -˜   +`     ×  ¬     )⊸⊔ y      
b← a1  (J     I    H      G  F     )⊸K y      
c←   (((J a1) I  ((H  a1) G (F a1))) K y)
d←   (((⊢ a1) -˜ ((+` a1) × (¬ a1))) ⊔ y)
#<span class="deemphasize">
##      (⊢     -˜   +`     ×  ¬     )⊸⊔
##       │     │    │         │       │
##       │     │    +`        │       │
##       │     │     └─────×──¬       │
##       │     -˜          │          │
##       ⊢──────┼──────────┘          │
##              └────────────────────⊸⊔
## 
"Should all be the same" !∨´a⊸≡¨b‿c‿d
#</span>
#</code></pre>
#<div hidden>
}
#</div>
#</section>
