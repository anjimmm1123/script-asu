local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "xavyera Example Window",
   Icon = 0,
   LoadingTitle = "xavyera Interface Suite",
   LoadingSubtitle = "by Sirius",
   ShowText = "xavyera",
   Theme = "Amethyst", 

   ToggleUIKeybind = "g",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false, 
   KeySettings = {
      Title = "BACOT Key System",
      Subtitle = "Key System",
      Note = "Panggilan bima Adalah",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"bimaganteng"}
   }
})
