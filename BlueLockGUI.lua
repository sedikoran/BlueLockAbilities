-- قائمة القدرات
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
local replicatedStorage = game:GetService("ReplicatedStorage")
local abilityEvent = replicatedStorage:WaitForChild("Events"):WaitForChild("Ability")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShinzouAutoGUI"

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 150, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Show Abilities"
toggleButton.Parent = gui

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0, 200, 0, 300)
scrollFrame.Position = UDim2.new(0, 10, 0, 60)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #abilities * 35)
scrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scrollFrame.Visible = false
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = gui

for i, abilityName in ipairs(abilities) do
    local button = Instance.new("TextButton", scrollFrame)
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Position = UDim2.new(0, 5, 0, (i - 1) * 35 + 5)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = abilityName

    button.MouseButton1Click:Connect(function()
        abilityEvent:FireServer(abilityName)
        print("Activated ability:", abilityName)
    end)
end

toggleButton.MouseButton1Click:Connect(function()
    scrollFrame.Visible = not scrollFrame.Visible
    toggleButton.Text = scrollFrame.Visible and "Hide Abilities" or "Show Abilities"
end)
