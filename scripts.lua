-- Z4NG BSZ HUB - Script Completo

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Eliminar interfaz previa si existe
if CoreGui:FindFirstChild("Z4ngBszHub") then
    CoreGui.Z4ngBszHub:Destroy()
end

-- ScreenGui Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Z4ngBszHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--------------------------------------------------------------------------------
-- 1. VENTANA DE LOGIN (CONTRASEÑA)
--------------------------------------------------------------------------------
local LoginFrame = Instance.new("Frame")
LoginFrame.Name = "LoginFrame"
LoginFrame.Parent = ScreenGui
LoginFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LoginFrame.BorderSizePixel = 0
LoginFrame.Position = UDim2.new(0.5, -125, 0.5, -80)
LoginFrame.Size = UDim2.new(0, 250, 0, 160)
LoginFrame.Active = true
LoginFrame.Draggable = true

local LoginCorner = Instance.new("UICorner")
LoginCorner.CornerRadius = UDim.new(0, 8)
LoginCorner.Parent = LoginFrame

local TitleLogin = Instance.new("TextLabel")
TitleLogin.Parent = LoginFrame
TitleLogin.BackgroundTransparency = 1
TitleLogin.Position = UDim2.new(0, 0, 0, 10)
TitleLogin.Size = UDim2.new(1, 0, 0, 30)
TitleLogin.Font = Enum.Font.GothamBold
TitleLogin.Text = ">Z4NG BSZ HUB<"
TitleLogin.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLogin.TextSize = 16

local TextBoxPass = Instance.new("TextBox")
TextBoxPass.Parent = LoginFrame
TextBoxPass.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBoxPass.BorderSizePixel = 0
TextBoxPass.Position = UDim2.new(0.1, 0, 0, 55)
TextBoxPass.Size = UDim2.new(0.8, 0, 0, 35)
TextBoxPass.Font = Enum.Font.Gotham
TextBoxPass.PlaceholderText = "Contraseña..."
TextBoxPass.Text = ""
TextBoxPass.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBoxPass.TextSize = 14

local PassCorner = Instance.new("UICorner")
PassCorner.CornerRadius = UDim.new(0, 6)
PassCorner.Parent = TextBoxPass

local LoginBtn = Instance.new("TextButton")
LoginBtn.Parent = LoginFrame
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
LoginBtn.BorderSizePixel = 0
LoginBtn.Position = UDim2.new(0.1, 0, 0, 105)
LoginBtn.Size = UDim2.new(0.8, 0, 0, 35)
LoginBtn.Font = Enum.Font.GothamBold
LoginBtn.Text = "Entrar"
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.TextSize = 14

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = LoginBtn

--------------------------------------------------------------------------------
-- 2. VENTANA PRINCIPAL (HUB)
--------------------------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 35)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local HubTitle = Instance.new("TextLabel")
HubTitle.Parent = TopBar
HubTitle.BackgroundTransparency = 1
HubTitle.Position = UDim2.new(0, 15, 0, 0)
HubTitle.Size = UDim2.new(0.7, 0, 1, 0)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.Text = ">Z4NG BSZ HUB<"
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.TextSize = 14
HubTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Position = UDim2.new(1, -30, 0.5, -10)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseBtn

local InfJumpBtn = Instance.new("TextButton")
InfJumpBtn.Parent = MainFrame
InfJumpBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
InfJumpBtn.BorderSizePixel = 0
InfJumpBtn.Position = UDim2.new(0.1, 0, 0, 60)
InfJumpBtn.Size = UDim2.new(0.8, 0, 0, 40)
InfJumpBtn.Font = Enum.Font.GothamBold
InfJumpBtn.Text = "Infinite Jump: [ OFF ]"
InfJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJumpBtn.TextSize = 14

local InfCorner = Instance.new("UICorner")
InfCorner.CornerRadius = UDim.new(0, 6)
InfCorner.Parent = InfJumpBtn

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Parent = MainFrame
InfoLabel.BackgroundTransparency = 1
InfoLabel.Position = UDim2.new(0, 0, 1, -30)
InfoLabel.Size = UDim2.new(1, 0, 0, 20)
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Text = "Presiona [ RightShift ] para abrir/cerrar"
InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
InfoLabel.TextSize = 11

--------------------------------------------------------------------------------
-- 3. FUNCIONES (CONTRASEÑA Y JUMP)
--------------------------------------------------------------------------------
LoginBtn.MouseButton1Click:Connect(function()
    if TextBoxPass.Text == "Prueba" then
        LoginFrame.Visible = false
        MainFrame.Visible = true
    else
        TextBoxPass.Text = ""
        TextBoxPass.PlaceholderText = "Contraseña incorrecta!"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        if not LoginFrame.Visible then
            MainFrame.Visible = not MainFrame.Visible
        end
    end
end)

local infJumpEnabled = false

InfJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    if infJumpEnabled then
        InfJumpBtn.Text = "Infinite Jump: [ ON ]"
        InfJumpBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    else
        InfJumpBtn.Text = "Infinite Jump: [ OFF ]"
        InfJumpBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled then
        local character = LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
