repeat wait() until game:IsLoaded()

-- INISIALISASI SERVICE ROBLOX
local cloneref = cloneref or function(o) return o end
Workspace = cloneref(game:GetService("Workspace"))
Players = cloneref(game:GetService("Players"))
PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
HttpService = cloneref(game:GetService("HttpService"))
TweenService = cloneref(game:GetService("TweenService"))
UserInputService = cloneref(game:GetService("UserInputService"))
Market = cloneref(game:GetService("MarketplaceService"))
RBXAnalyt = cloneref(game:GetService("RbxAnalyticsService"))
CoreGui = cloneref(game:GetService("CoreGui"))
RunService = cloneref(game:GetService("RunService"))
Replicated = cloneref(game:GetService("ReplicatedStorage"))

-- LIST GAME DAN SCRIPT ID
local ListGame = {
    ["3808223175"] = "4fe2dfc202115670b1813277df916ab2", -- Jujutsu Infinite
    ["994732206"]  = "e2718ddebf562c5c4080dfce26b09398", -- Blox Fruits
    ["1650291138"] = "9b64d07193c7c2aef970d57aeb286e70", -- Demon Fall
    ["5750914919"] = "8bbc8a7c4e023bc0c80799fec3233162", -- Fisch
    ["66654135"]   = "9c916252a9f79bbf5a108f97c531e807", -- Murder Mystery 2
    ["3317771874"] = "e95ef6f27596e636a7d706375c040de4", -- Pet Simulator 99
    ["1511883870"] = "fefdf5088c44beb34ef52ed6b520507c", -- Shindo Life
    ["6035872082"] = "3bb7969a9ecb9e317b0a24681327c2e2", -- Rivals
    ["245662005"]  = "21ad7f491e4658e9dc9529a60c887c6e", -- Jailbreak
    ["7018190066"] = "98f5c64a0a9ecca29517078597bbcbdb", -- Dead Rails
    ["7074860883"] = "0c8fdf9bb25a6a7071731b72a90e3c69", -- Arise Crossover
    ["7436755782"] = "e4ea33e9eaf0ae943d59ea98f2444ebe", -- Grow a Garden
    ["210851291"]  = "b3400f5a4e28cad1e1110b45004c3837", -- Build a Boat
    ["6931042565"] = "036786acbfa6e6e030dce074faa1173f", -- Volleyball Legends
    ["7326934954"] = "00e140acb477c5ecde501c1d448df6f9", -- 99 Nights in the Forest
    ["7822444776"] = "ba4595cfb82d2434a478b9003f3674b4", -- Build a Plane
    ["4871329703"] = "646e60921195f2b2d59015703b0b100a", -- Type Soul
    ["1000233041"] = "c08f7269fc31f6a60ec57ecfacfdb34e", -- 3008
    ["7750955984"] = "b8432035965d96be10e70bfb63a6964b", -- Hunty Zombie
    ["6701277882"] = "05cd4dda96ee6767cd1903587da139fc", -- Fish it!
    ["6884266247"] = "f8c8b872fe2939eb1e39457f2766862e", -- Anime Rangers X
    ["8316902627"] = "641e8d02ffba666d731614a32c08eacf", -- Plants vs Brainrot
    ["6216468795"] = "97722a63586043c0780da54598487218", -- Weak Legacy 2
    ["8066283370"] = "c0e023292c5ede5fd683fc0cdc1b5eb0", -- Build a Zoo
    ["8321616508"] = "2cd0668c5caf66913e7314cdb6d1eb9b", -- Rogue Piece
    ["3457700596"] = "639c0b275001182cca67ac85f5bd529f", -- Fruit Battlegrounds
    ["7671049560"] = "c0b41e859f576fb70183206224d4a75f", -- The Forge
}

local script_id
local game_id = tostring(game.GameId)
local list_id = ListGame[game_id]

if not list_id then
    Players.LocalPlayer:Kick("This game is not supported by xavyera.")
end

if CoreGui:FindFirstChild("System") then
    CoreGui.System:Destroy()
end

script_id = list_id

-- ====================================================================
-- FUNGSI UTILITAS (Notifikasi)
-- ====================================================================
local NotificationGUI = PlayerGui:FindFirstChild("Notifications") or Instance.new("ScreenGui")
NotificationGUI.Name = "Notifications"
NotificationGUI.Parent = PlayerGui

local Container = NotificationGUI:FindFirstChild("Container") or Instance.new("Frame")
Container.Name = "Container"
Container.AnchorPoint = Vector2.new(1, 0)
Container.Position = UDim2.new(1, -25, 0, 25)
Container.BackgroundTransparency = 1
Container.Size = UDim2.fromOffset(350, 600)
Container.Parent = NotificationGUI

if not Container:FindFirstChild("UIListLayout") then
    local Layout = Instance.new("UIListLayout")
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)
    Layout.VerticalAlignment = Enum.VerticalAlignment.Top
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    Layout.Parent = Container
end

function NotifyCustom(title, content, duration)
    duration = duration or 5
    local color = Color3.fromRGB(255, 188, 254)

    local Notification = Instance.new("Frame")
    Notification.Name = "Notification"
    Notification.BackgroundTransparency = 0.06
    Notification.AutomaticSize = Enum.AutomaticSize.Y
    Notification.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    Notification.BorderSizePixel = 0
    Notification.Size = UDim2.fromOffset(320, 70)
    Notification.Parent = Container

    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = Notification

    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Color = Color3.fromRGB(158, 114, 158)
    NotifStroke.Transparency = 0.8
    NotifStroke.Parent = Notification

    local TitleText = Instance.new("TextLabel")
    TitleText.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
    TitleText.Text = title
    TitleText.TextColor3 = Color3.fromRGB(199, 199, 203)
    TitleText.TextSize = 16
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.BackgroundTransparency = 1
    TitleText.Size = UDim2.new(1, -20, 0, 20)
    TitleText.Position = UDim2.fromOffset(10, 6)
    TitleText.Parent = Notification

    local ContentText = Instance.new("TextLabel")
    ContentText.FontFace = Font.new("rbxassetid://12187365364")
    ContentText.Text = content
    ContentText.TextColor3 = Color3.fromRGB(180, 180, 185)
    ContentText.TextSize = 14
    ContentText.TextXAlignment = Enum.TextXAlignment.Left
    ContentText.TextYAlignment = Enum.TextYAlignment.Top
    ContentText.BackgroundTransparency = 1
    ContentText.AutomaticSize = Enum.AutomaticSize.Y
    ContentText.TextWrapped = true
    ContentText.Size = UDim2.new(1, -20, 0, 0)
    ContentText.Position = UDim2.fromOffset(10, 28)
    ContentText.Parent = Notification

    local ProgressBar = Instance.new("Frame")
    ProgressBar.BackgroundColor3 = Color3.fromRGB(44, 38, 44)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Size = UDim2.new(1, -20, 0, 6)
    ProgressBar.Position = UDim2.new(0, 10, 1, -12)
    ProgressBar.Parent = Notification

    local ProgressFill = Instance.new("Frame")
    ProgressFill.BackgroundColor3 = color
    ProgressFill.BorderSizePixel = 0
    ProgressFill.Size = UDim2.fromScale(1, 1)
    ProgressFill.Parent = ProgressBar

    local ProgressFillCorner = Instance.new("UICorner")
    ProgressFillCorner.Parent = ProgressFill

    TweenService:Create(ProgressFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()

    task.delay(duration, function()
        TweenService:Create(Notification, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        task.wait(0.3)
        Notification:Destroy()
    end)

    return Notification
end

function Notification(Type, Message)
    NotifyCustom(Type, Message, 5)
end

-- ====================================================================
-- FUNGSI UTAMA: MEMUAT SKRIP TANPA KEY SYSTEM
-- ====================================================================
local function LoadScript(config)
    -- URL ini HARUS dipertahankan untuk mengunduh konten skrip utama.
    local script_url = "https://sdkapi-public.luarmor.net/library.lua"

    Notification("Info", "Loading xavyera script...")
    
    local success, result = pcall(function()
        -- 1. Mendapatkan konten skrip
        local script_content = game:HttpGet(script_url)
        -- 2. Menjalankan konten untuk mendapatkan API
        local api = loadstring(script_content)()
        
        -- 3. Menetapkan Script ID
        api.script_id = config.ScriptId
        
        -- 4. Memuat skrip utama (Key System dilompati, langsung muat konten)
        api.load_script()
        
        Notification("Success", "xavyera loaded successfully!")
    end)

    if not success then
        Notification("Error", "Failed to load xavyera:\n" .. tostring(result))
    end
end

-- Konfigurasi skrip
local XavyeraConfig = {
    ScriptId = script_id,
    DisplayName = "xavyera Hub FREE",
}

-- Panggil fungsi LoadScript untuk langsung memuat skrip
LoadScript(XavyeraConfig)
