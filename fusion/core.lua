if game.CoreGui:FindFirstChild("FusionU") then
    game.CoreGui:FindFirstChild("FusionU"):Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FusionU"
screenGui.Parent = game.CoreGui

local function createButton(name, position, text, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0, 150, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    button.Text = text
    button.Parent = screenGui
    button.MouseButton1Click:Connect(callback)
end

createButton("espbt", UDim2.new(0.1, 0, 0.1, 0), "ESP", espac)
createButton("bt", UDim2.new(0.1, 0, 0.25, 0), "", ac)
createButton("bt", UDim2.new(0.1, 0, 0.4, 0), "Button 3", ac)
createButton("bt", UDim2.new(0.1, 0, 0.55, 0), "Button 4", ac)
createButton("bt", UDim2.new(0.1, 0, 0.7, 0), "Button 5", ac)
