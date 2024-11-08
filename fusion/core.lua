if game.CoreGui:FindFirstChild("FusionU") then
    game.CoreGui:FindFirstChild("FusionU"):Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FusionU"
screenGui.Parent = game.CoreGui

local Players = game:GetService("Players")
local function highlightCharacter(character)
    if character:FindFirstChildOfClass("Highlight") then return end
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillColor = Color3.fromRGB(255, 56, 56)
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
end

local function updateHighlights()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character or player.CharacterAdded:Wait()
        highlightCharacter(character)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightCharacter(character)
    end)
end)

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

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local aimRange = 100
local aimSpeed = 0.1
local isAiming = false
local isAimAssistActive = false

local localPlayer = Players.LocalPlayer

local function getClosestPlayer()
    local closestPlayer = nil
    local closestDistance = aimRange
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local playerPosition = player.Character.HumanoidRootPart.Position
            local distance = (playerPosition - localPlayer.Character.HumanoidRootPart.Position).magnitude
            
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    return closestPlayer
end

local function assistAim(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
            localPlayer.Character.HumanoidRootPart.Position,
            targetPosition
        ):Lerp(localPlayer.Character.HumanoidRootPart.CFrame, aimSpeed)
    end
end

local function updateAimAssist()
    if isAiming and isAimAssistActive then
        local closestPlayer = getClosestPlayer()
        assistAim(closestPlayer)
    end
end

local function toggleAimAssist()
    isAimAssistActive = not isAimAssistActive
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isAiming = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isAiming = false
    end
end)

RunService.RenderStepped:Connect(updateAimAssist)

createButton("ESPButton", UDim2.new(0.1, 0, 0.1, 0), "ESP", updateHighlights)
createButton("AimAssistButton", UDim2.new(0.1, 0, 0.25, 0), "AIM", toggleAimAssist)
createButton("Button3", UDim2.new(0.1, 0, 0.4, 0), "Button 3", function() print("Button 3 Action") end)
createButton("Button4", UDim2.new(0.1, 0, 0.55, 0), "Button 4", function() print("Button 4 Action") end)
createButton("Button5", UDim2.new(0.1, 0, 0.7, 0), "Button 5", function() print("Button 5 Action") end)
