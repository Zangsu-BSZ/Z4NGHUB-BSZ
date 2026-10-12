-- LocalScript

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.5, 0)
frame.Position = UDim2.new(0.25, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "Farm Money Script"
label.FontSize = Enum.FontSize.Size24
label.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.5, 0, 0.2, 0)
button.Position = UDim2.new(0.25, 0, 0.4, 0)
button.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
button.Text = "Start Farming"
button.Parent = frame

-- Variables
local player = Players.LocalPlayer
local cash = 0

-- Functions
local function farmMoney()
    while true do
        wait(1)
        -- Code to add money to the player's account
        -- For example:
        game.ReplicatedStorage.Events.AddCash:FireServer(100)
        cash = cash + 100
        label.Text = "Cash: " .. cash
    end
end

local function stopFarming()
    -- Code to stop farming money
end

-- Event Handlers
button.MouseButton1Click:Connect(function()
    if button.Text == "Start Farming" then
        farmMoney()
        button.Text = "Stop Farming"
    else
        --stopFarming()
        button.Text = "Start Farming"
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Escape then
        gui.Enabled = not gui.Enabled
    end
end)

-- Tweening
local function tweenObject(object, properties, time)
    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
end

-- Initialization
gui.Enabled = false
wait(1)
gui.Enabled = true
tweenObject(frame, { Position = UDim2.new(0.25, 0, 0.25, 0) }, 0.5)
