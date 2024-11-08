if game.CoreGui:FindFirstChild("Fusion") then
    game.CoreGui:FindFirstChild("Fusion"):Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Fusion"
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

local function espac()
    print("Button 1 clicked")
end

local function button2Action()
    print("Button 2 clicked")
end

local function button3Action()
    print("Button 3 clicked")
end

local function button4Action()
    print("Button 4 clicked")
end

local function button5Action()
    print("Button 5 clicked")
end

createButton("espbt", UDim2.new(0.1, 0, 0.1, 0), "ESP", espac)
createButton("bt", UDim2.new(0.1, 0, 0.25, 0), "", ac)
createButton("bt", UDim2.new(0.1, 0, 0.4, 0), "Button 3", ac)
createButton("bt", UDim2.new(0.1, 0, 0.55, 0), "Button 4", ac)
createButton("bt", UDim2.new(0.1, 0, 0.7, 0), "Button 5", ac)
