Print←{𝕊f: {
   𝕊𝕩: ∾"("‿f‿" "‿𝕩‿")"
; 𝕨𝕊𝕩: ∾"("‿𝕨‿" "‿f‿" "‿𝕩‿")"
}}
F‿G‿H‿I‿J‿K‿L←Print¨"FGHIJKL"

•Out "--"
•Out "𝕨" (G F) "𝕩"            # (G (𝕨 F 𝕩))
•Out "𝕨" (H G F) "𝕩"          # ((𝕨 H 𝕩) G (𝕨 F 𝕩))
•Out "𝕨" (I H G F) "𝕩"        # (I ((𝕨 H 𝕩) G (𝕨 F 𝕩)))
•Out "𝕨" (J I H G F) "𝕩"      # ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩)))
•Out "𝕨" (K J I H G F) "𝕩"    # (K ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩))))
•Out "𝕨" (L K J I H G F) "𝕩"  # ((𝕨 L 𝕩) K ((𝕨 J 𝕩) I ((𝕨 H 𝕩) G (𝕨 F 𝕩))))
