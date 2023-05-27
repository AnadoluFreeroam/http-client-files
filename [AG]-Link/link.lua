addCommandHandler ( "dc", function ( ) 
	setClipboard ( "https://discord.gg/37UTxgXaPZ" );
	outputChatBox ( "Discord adresi kopyalandı.", 255,0,0 );
end )

addCommandHandler ( "tiktok", function ( ) 
	--setClipboard ( "https://www.tiktok.com/@AnadoluFreeroamserver" );
	--outputChatBox ( "TikTok adresi kopyalandı.", 255,0,0 );
end )

addCommandHandler ( "facebook", function ( ) 
	setClipboard ( "https://www.facebook.com/AnadoluFreeroam" );
	outputChatBox ( "Facebook adresi kopyalandı.", 255,0,0 );
end )

addCommandHandler ( "youtube", function ( ) 
	setClipboard ( "www.youtube.com/c/anadolufreeroam" );
	outputChatBox ( "YouTube adresi kopyalandı.", 255,0,0 );
end )


addCommandHandler ( "instagram", function ( ) 
	setClipboard ( "https://www.instagram.com/AnadoluFreeroam/" );
	outputChatBox ( "Instagram adresi kopyalandı.", 255,0,0 );
end )

addCommandHandler ( "4x2", function ( ) 
	setClipboard ( "R3CKL3SS 100000 300000 0 0 -0.15 -0.7 70 0.45 0.7 0.45 5 99999 99999 -1000 r e 100000 0.8 false 65 0.8 0.25 0 0.2 -0.1 0.22 0.24 1 0 19000 80002000 4080003 1 1 0" );
	outputChatBox ( "4X2 Hand Başarıyla Kopyalandı", 255,0,0 );
end )

function outputChatBox(text, r, g, b, enabled)
	exports["info"]:sendClientMessage(text, r, g, b, true)
end