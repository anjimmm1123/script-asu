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

return {
    addFeatures = addFeatures
}
