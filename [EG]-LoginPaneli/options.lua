login_options = {
	language = {
		["turkish"] = {
			[1] = "Giriş Yap",
			[2] = "Kaydol",
			[3] = "Kullanıcı Adı",
			[4] = "Şifre",
			[5] = "Böyle bir hesap zaten var, lütfen giriş yapın.",
			[6] = "Böyle bir hesap bulunmamaktadır, lütfen kayıt olunuz.(Sorun yaşıyorsanız 'Sayı' kullanınız.)",
			[7] = "Şifren yanlış, lütfen tekrar dene!",
			[8] = "Kullanıcı adın ve şifren en az %s karakter uzunluğunda olmalıdır.",
			[9] = "ACL'den admin yetkisi verin.\nAdmin yetkisi verdiğiniz halde çalışmıyorsa, tüm yetkileri verin.",
			[10] = "Kaydet",
			[11] = "Başarıyla kayıt oldun.",
			[12] = "Bu hesapta başka birisi oynuyor."
		},
		["english"] = {
			[1] = "Login",
			[2] = "Register",
			[3] = "Username",
			[4] = "Password",
			[5] = "There is already an account registered with this name, please login.",
			[6] = "There is no account registered with this name, please register.",
			[7] = "Password incorrect, please try again!",
			[8] = "Username and password must be at least %s characters long.",
			[9] = "Give the admin rights from the ACL.\nIf you already give admin right and it's not work, give all right.",
			[10] = "Save",
			[11] = "You have successfully registered.",
			[12] = "Someone else playing on this account."
		},
		-- If you want to add your language, you can edit the above or you can create new table like the above.
	},
	selected_language = "turkish", --[[ [turkish/english/...]
									Kullanmak istediğiniz dili yazın.
									Write the language you want to use.
								]]
	
	theme_color = {34,84,255},
	effect_speed = 20,
	font_opt = {
		font = "default-bold", --[[ [default/default-bold/clear/arial/sans/pricedown/bankgothic/diploma/beckett/...]
								Başka fontlar kullanmak için: font = dxCreateFont(font konumu, font kalitesi)
								For use another fonts: font = dxCreateFont(font path, font quality)
							]]
		scale = 1 --[[ [sayı/number]
						Font büyüklüğü için: scale = boyut
						For font's size: scale = size
					]]
	},
	
	postGUI = true, --[[ [false/true]
						GUI elementinin üzerine çizilir. (eğer true ise)
						Drawn on the GUI elements. (if is true)
					]]
	
	
	login = false, --[[ [false/true]
						Oyuncu kayıt olduğunda otomatik giriş yapar. (eğer true ise)
						It makes auto login when player registered. (if is true)
					]]
	
	hide_chat = true, --[[ [false/true]
						Script açık iken sohbet penceresini kapatır. (eğer true ise)
						It is turn off chatbox while the script is open. (if is true)
					]]
	hide_radar = {
		on_start = true, --[[ [false/true]
						Script açıldığında, radar'ı kapatır. (eğer true ise)
						Script açıldığında, radar'ı açar. (eğer false ise)
						Script is opened, closes the radar. (if is true)
						Script is opened, open the radar. (if is false)
					]]
		on_stop = false --[[ [false/true]
						Script kapandığında, radar'ı kapatır. (eğer true ise)
						Script kapandığında, radar'ı açar. (eğer false ise)
						Script is stopped, closes the radar. (if is true)
						Script is stopped, open the radar. (if is false)
					]]
	},
	
	play_sound = {
		play = true, --[[ [false/true]
						Script açık iken sesi oynatır. (eğer true ise)
						It is play sound while the script is open. (if is true)
					]]
		sound_path = "ses.mp3", --[[
						Dosya yolu veya URL yazınız. YouTUBE müzikleri için http://youtubeinmp3.com/fetch/?video=müzikadresi kullanabilirsiniz. Örnek: http://youtubeinmp3.com/fetch/?video=https://www.youtube.com/watch?v=eNmCKpJ52W0
						Write file path or URL. You can use http://youtubeinmp3.com/fetch/?video=songpath for YouTUBE's song. E.g: http://youtubeinmp3.com/fetch/?video=https://www.youtube.com/watch?v=eNmCKpJ52W0
					]]
		loop = false, --[[ [false/true]
						Sesi döngületir. (eğer true ise)
						It do looped sound. (if is true)
					]]
		stop_sound = true --[[ [false/true]
						Giriş yaptıktan sonra müziği durdurur. (Eğer true ise)
						It stop music after login. (if is true)
					]]
	},
	
	max_character = 20, -- Maksimum karakter [ Min 3 ][ Max 23 ]
	min_character = 5, -- Minimum karakter [ Min 3 ][ Max 23 ]
	
	use_only_ASCII = false, --[[ [false/true]
						Yalnızca İngilizce karakterler kullanılır. (eğer true ise)
						Used only English characters. (if is true)
					]]
	
	use_backround_image = true, --[[ [false/true]
						Arkaplan resmi kullanır. (eğer true ise)
						Used background image. (if is true)
					]]
	
	set_camera_position = {
		active_camera = false, --[[ [false/true]
						Script açık iken kamera pozisyonu kullanılır. Kullanıyorsanız, "use_backround_image" değerini false yapın. (eğer true ise)
						Used camera position while the script is open. If you use it, do false "use_backround_image"s value. (if is true)
					]]
		position = {-1735.6, 780.2, 168.9, -1734.7, 780.1, 168.6, 0, 70}, --[[ Kamera Pozisyonu - Camera Position
						Söz Dizimi - Syntax:
						{ float positionX, float positionY, float positionZ [, float lookAtX, float lookAtY, float lookAtZ, float roll = 0, float fov = 70 ] }
					]]
		set_camera_target = true, --[[ [false/true]
						active_camera = true ise, giriş yapıldıktan sonra kamera oyuncuya çevrilir. (eğer true ise)
						if active_camera = true, camera's target change to player. (if is true)
					]]
	}
}