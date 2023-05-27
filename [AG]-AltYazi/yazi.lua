msg = {
    "#0066FF Anadolu Freeroam #ffffffInstagram: @anadolufreeroam",
   }
r,g,b = 255, 209, 27
rr,gg,bb = 0,0,0
num = 1
px = 0
--------------------
function getColor()
   return r,g,b
end
function getBackColor()
   return rr,gg,bb
end
function setColor(tr,tg,tb)
   r,g,b = tr,tg,tb
end
function setBackColor(r,g,b)
   rr,gg,bb = r,g,b
end
addEventHandler("onClientRender",root,
   function ()
       local x,y = guiGetScreenSize()
       dxDrawText(msg[num],px,y - 21,x,y,tocolor(r,g,b,255),1.4,"default-bold-small","center","center",false,false,false,true)
   end
)

