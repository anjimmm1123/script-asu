local function createTabs(Window)
    local MainTab = Window:CreateTab("🏠 Main", nil) -- Title, Image
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

    return {
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
end

return createTabs
