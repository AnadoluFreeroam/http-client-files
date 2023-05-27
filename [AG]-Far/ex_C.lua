
texShader3 = dxCreateShader ( "texreplace.fx" )
texShader4 = dxCreateShader ( "texreplace.fx" )
texShader6 = dxCreateShader ( "texreplace.fx" )
coronastar = dxCreateTexture("coronastar.png")
dxSetShaderValue(texShader6,"gTexture",coronastar)
engineApplyShaderToWorldTexture(texShader6,"coronastar")

