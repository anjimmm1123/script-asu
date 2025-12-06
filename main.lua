local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Theme = {
    TextColor = Color3.fromRGB(240, 240, 240),

    Background = Color3.fromRGB(25, 25, 25),
    Topbar = Color3.fromRGB(34, 34, 34),
    Shadow = Color3.fromRGB(20, 20, 20),

    NotificationBackground = Color3.fromRGB(20, 20, 20),
    NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

    TabBackground = Color3.fromRGB(80, 80, 80),
    TabStroke = Color3.fromRGB(85, 85, 85),
    TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
    TabTextColor = Color3.fromRGB(240, 240, 240),
    SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

    ElementBackground = Color3.fromRGB(35, 35, 35),
    ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
    SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
    ElementStroke = Color3.fromRGB(50, 50, 50),
    SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            
    SliderBackground = Color3.fromRGB(50, 138, 220),
    SliderProgress = Color3.fromRGB(50, 138, 220),
    SliderStroke = Color3.fromRGB(58, 163, 255),

    ToggleBackground = Color3.fromRGB(30, 30, 30),
    ToggleEnabled = Color3.fromRGB(0, 146, 214),
    ToggleDisabled = Color3.fromRGB(100, 100, 100),
    ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
    ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
    ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
    ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),

    DropdownSelected = Color3.fromRGB(40, 40, 40),
    DropdownUnselected = Color3.fromRGB(30, 30, 30),

    InputBackground = Color3.fromRGB(30, 30, 30),
    InputStroke = Color3.fromRGB(65, 65, 65),
    PlaceholderColor = Color3.fromRGB(178, 178, 178)
}

local Window = Rayfield:CreateWindow({
    Name = "xavyera",
    Icon = 0,
    LoadingTitle = "xavyera Interface Suite",
    LoadingSubtitle = "by Sirius",
    ShowText = "xavyera", 
    Theme = Theme,

    ToggleUIKeybind = "K",

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
    KeySystem = true,
    KeySettings = {
        Title = "xavyera",
        Subtitle = "Key System",
        Note = "Sebutan bima",
        FileName = "xavyera",
        SaveKey = false,
        GrabKeyFromSite = true,
        Key = {"https://pastebin.com/raw/aRyhMYLW"}
    }
})

-- Bagian yang sebelumnya ada di menu/menu.lua
local MainTab = Window:CreateTab("🏠 Main", nil)
local MainSection = MainTab:CreateSection("Main")
local FishingTab = Window:CreateTab("🎣 Fishing", nil)
local TeleportTab = Window:CreateTab("🚀 Teleport", nil)
local EventTab = Window:CreateTab("🎉 Event", nil)
local ShopTab = Window:CreateTab("🛒 Shop", nil)
local UtilityTab = Window:CreateTab("🔧 Utility", nil)
local TradeTab = Window:CreateTab("🤝 Trade", nil)
local MiscTab = Window:CreateTab("📦 Misc", nil)
local SettingsTab = Window:CreateTab("⚙️ Settings", nil)
local WebhookTab = Window:CreateTab("🌐 Webhook", nil)

-- Tabel yang merepresentasikan semua tab (seperti hasil kembalian dari menu/menu.lua)
local tabs = {
    MainTab = MainTab,
    MainSection = MainSection,
    FishingTab = FishingTab,
    TeleportTab = TeleportTab,
    EventTab = EventTab,
    ShopTab = ShopTab,
    UtilityTab = UtilityTab,
    TradeTab = TradeTab,
    MiscTab = MiscTab,
    SettingsTab = SettingsTab,
    WebhookTab = WebhookTab
}

-- Bagian yang sebelumnya ada di fitur/fitur.lua (Fungsi addFeatures)
local function addFeatures(tab)
    local ClickSpeedInput = tab:CreateInput({
        Name = "Click Speed (seconds)",
        PlaceholderText = "Enter delay (e.g., 0.5)",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            local num = tonumber(Text)
            if num and num >= 0.1 and num <= 2 then
                _G.clickDelay = num
                game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Click speed set to " .. num .. " seconds"; Duration=3;})
            else
                game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Invalid input. Enter a number between 0.1 and 2."; Duration=5;})
                _G.clickDelay = 1 -- default
            end
        end,
    })

    local AutoClickToggle = tab:CreateToggle({
        Name = "Auto Clicker Toggle",
        CurrentValue = false,
        Flag = "AutoClick",
        Callback = function(Value)
            _G.autoClick = Value
            if Value then
                if _G.autoClickStarted == nil then
                    _G.autoClickStarted = true
                    game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Auto Clicker Activated!"; Duration=5;})
                    local plr = game:GetService('Players').LocalPlayer
                    local m = plr:GetMouse()
                    coroutine.wrap(function()
                        while _G.autoClick do
                            m:Button1Down()
                            wait(0.05)
                            m:Button1Up()
                            wait(_G.clickDelay or 1)
                        end
                    end)()
                end
            else
                _G.autoClickStarted = nil
            end
        end,
    })
end

-- Panggil fungsi fitur pada tab utama
addFeatures(tabs.MainTab)

Rayfield:Notify({
    Title = "You executed the script",
    Content = "Very cool gui",
    Duration = 5,
    Image = 13047715178,
    Actions = {
        Ignore = {
            Name = "Okay!",
            Callback = function()
            print("The user tapped Okay!")
            end
        },
    },
})
