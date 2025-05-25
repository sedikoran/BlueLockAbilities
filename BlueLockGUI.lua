local abilities = {
    "Perfect Pass", "Super Goal", "Igaguri", "Kaiser Style", "White Rondo",
    "Slide Tackle", "One Touch", "Heel Pass", "Dummy", "Overhead Kick",
    "Fake Shot", "Dribble", "Goalkeeper Save", "Counter Attack", "Wall Pass",
    "Direct Shot", "Metavision", "Kaiser Impact", "Emperor’s Route", "Copy",
    "Offensive Mode", "Defensive Mode", "Planet Hotline", "Laser", "Stealthy Steps",
    "Ninja Dribble", "Ninja Shot", "Scorpion", "Diving Header", "Fast Reactions",
    "Handstand", "Bear Claw", "Speedster", "Fadeaway", "Final Shot",
    "Spatial Awareness", "Curved Pass", "Monster Trance", "Genius Killing Machine",
    "Two-Gun Volley", "True Direct Shot", "Complete Awareness"
}

local player = game.Players.LocalPlayer
local repStorage = game:GetService("ReplicatedStorage")
local abilityEvent = repStorage:WaitForChild("Events"):WaitForChild("Ability")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AbilitiesGUI"

local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 150, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Text = "Show Abilities"

local scrollFrame = Instance.new("ScrollingFrame", gui)
scrollFrame.Size = UDim2.new(0, 200, 0, 300)
scrollFrame.Position = UDim2.new(0, 10, 0, 60)
scrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scrollFrame.Visible = false
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #abilities * 35)
scrollFrame.ScrollBarThickness = 6

for i, abilityName in ipairs(abilities) do
    local btn = Instance.new("TextButton", scrollFrame)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 35 + 5)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = abilityName

    btn.MouseButton1Click:Connect(function()
        abilityEvent:FireServer(abilityName)
        print("Activated ability:", abilityName)
    end)
end

toggleBtn.MouseButton1Click:Connect(function()
    scrollFrame.Visible = not scrollFrame.Visible
    toggleBtn.Text = scrollFrame.Visible and "Hide Abilities" or "Show Abilities"
end)
