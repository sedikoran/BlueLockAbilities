-- Blue Lock: Rivals GUI Script

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
}

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "BlueLockAbilitiesGUI"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 200, 0, #abilities * 35)
main.Position = UDim2.new(0, 10, 0, 50)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

for i, name in ipairs(abilities) do
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 35 + 5)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(function()
        print("Activated:", name)
    end)
end
