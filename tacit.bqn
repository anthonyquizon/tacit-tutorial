Print←{𝕊f: {
   𝕊𝕩: ∾"("‿f‿" "‿𝕩‿")"
; 𝕨𝕊𝕩: ∾"("‿𝕨‿" "‿f‿" "‿𝕩‿")"
}}
F‿G‿H‿I‿J‿K‿L←Print¨'F'+↕7
a←b←c←d←e←@

•Out "--"
•Out "𝕨" (G F) "𝕩"            #                               (G (𝕨 F 𝕩))
•Out "𝕨" (H G F) "𝕩"          #                       ((𝕨 H 𝕩) G (𝕨 F 𝕩))
•Out "𝕨" (I H G F) "𝕩"        #                    (I ((𝕨 H 𝕩) G (𝕨 F 𝕩)))
•Out "𝕨" (J I H G F) "𝕩"      #            ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩)))
•Out "𝕨" (K J I H G F) "𝕩"    #         (K ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩))))
•Out "𝕨" (L K J I H G F) "𝕩"  # ((𝕨 L 𝕩) K ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩))))

•Out "𝕨" G⊸F "𝕩" # ((G 𝕨) F 𝕩)
•Out "𝕨" G⟜F "𝕩" # (G 𝕨 (F 𝕩))
•Out "𝕨" G○F "𝕩" # ((F 𝕨) G (F 𝕩)))
•Out "𝕨" (I H G)⊸F "𝕩" # (((I 𝕨) H (G 𝕨)) F 𝕩)

# Examples from BQNCrate
# x,y,z:any m,n:num i,j:int a,b:bool c,d:char f,g,h:fn 0:unit 1:list 2:tab

# Split y at 1s in a1, not including cells of y at those locations
F‿G‿H‿I‿J‿K↩⟨¬,×,+`,-˜,⊣,⊔⟩
y←"hello, world, !" ⋄ a1←y=','

a↩a1 (⊢ -˜+`× ¬)⊸⊔ y      
b↩a1 (J I H G F)⊸K y      
c↩(((J a1) I  ((H  a1) G (F a1))) K y)
d↩(((⊢ a1) -˜ ((+` a1) × (¬ a1))) ⊔ y)
!∨´a⊸≡¨b‿c‿d

