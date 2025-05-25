-- Blue Lock: Rivals Abilities GUI with Toggle Button
_G.AbilityConfig = {"Perfect Pass",}
local abilities = {
    "Perfect Pass",
    "Super Goal",
    "Igaguri",
    "Kaiser Style",
    "White Rondo",
    "Slide Tackle",
    "One Touch",
    "Heel Pass",
    "Dummy",
    "Overhead Kick",
    "Fake Shot",
    "Dribble",
    "Goalkeeper Save",
    "Counter Attack",
    "Wall Pass",
    "Direct Shot",
    "Metavision",
    "Kaiser Impact",
    "Emperor’s Route",
    "Copy",
    "Offensive Mode",
    "Defensive Mode",
    "Planet Hotline",
    "Laser",
    "Stealthy Steps",
    "Ninja Dribble",
    "Ninja Shot",
    "Scorpion",
    "Diving Header",
    "Fast Reactions",
    "Handstand",
    "Bear Claw",
    "Speedster",
    "Fadeaway",
    "Final Shot",
    "Spatial Awareness",
    "Curved Pass",
    "Monster Trance",
    "Genius Killing Machine",
    "Two-Gun Volley",
    "True Direct Shot",
    "Complete Awareness"
}

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AbilitiesGUI"

-- زر التبديل
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 150, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Show Abilities"
toggleButton.Parent = gui

-- الإطار الذي يحتوي الأزرار
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, #abilities * 35)
frame.Position = UDim2.new(0, 10, 0, 60)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false
frame.Parent = gui

-- قائمة الأزرار للقدرات
for i, name in ipairs(abilities) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 35 + 5)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)

    btn.MouseButton1Click:Connect(function()
        print("Activated ability:", name)
        -- هنا يمكنك إضافة الكود الخاص بتفعيل القدرة
    end)
end

-- وظيفة زر التبديل
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    toggleButton.Text = frame.Visible and "Hide Abilities" or "Show Abilities"
end)
