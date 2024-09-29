
Config = {}



--[DÖNÜŞTÜRME]
Config.piratesisle = {

  ["cicekci mami"] = {
     isim = "ÇİCEKÇİ MAMİ",
     konum = {x = -110.44, y = -14.38, z = 70.52, h = 339.52}, 
     job = "cicekci",
     icerik  = {
         {item = "kokainislenmis", isle = 1000, label = "İşlenmiş Kokain"},
    }
  },
  ["cicekci buse"] = {
    isim = "ÇİCEKÇİ BUSE",
    konum = {x = 1975.62, y = 3818.63, z = 33.44, h = 301.5},
    job = "cicekci",
    icerik  = {
        {item = "kokainislenmis", isle = 1000, label = "İşlenmiş Kokain"},
   }
 },
}

Config.bsedepo = {
  ["pirates1"] = {
    isim = "Depo",
    job = "cicekci",
    konum = {x = -113.77, y = -12.38, z = 70.52, h = 138.39}, 
 },
 ["pirates2"] = {
  isim = "Depo",
  job = "cicekci",
  konum = {x = 1972.38, y = 3820.35, z = 33.15, h = 34.9}, 
},
}








Config.KaraPara = "markedbills"




--[BLIPLER]
Config.Blips = { 
    {title="Çiçekçi Mami", colour=1, id=469, x = -110.44, y = -14.38, z = 70.52}, 
    {title="Çiçekçi Buse", colour=1, id=469, x = 1975.62, y = 3818.63, z = 33.44},

}

Config.Peds = {
	[1] = { handle = nil, model ="a_m_m_fatlatin_01", coords = vector3(-110.44, -14.38, 70.52), heading = 339.52,  anim = { type = 1, name = "WORLD_HUMAN_CLIPBOARD"} } -- scene
 -- [2] = { handle = nil, model ="a_m_m_fatlatin_01", coords = vector3(-110.44, -14.38, 70.52), heading = 339.52,  anim = { type = 1, name = "WORLD_HUMAN_CLIPBOARD"} } -- scene
}

