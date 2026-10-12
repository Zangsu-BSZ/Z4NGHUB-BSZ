-- Cargamos la librería de interfaz profesional (Rayfield)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Creamos la Ventana Principal
local Window = Rayfield:CreateWindow({
   Name = ">Z4NG BSZ HUB< | Muscle Legends",
   LoadingTitle = "Cargando Z4NG BSZ HUB...",
   LoadingSubtitle = "Por Zangsu-BSZ",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Z4ngHubConfig",
      FileName = "MuscleLegends"
   },
   KeySystem = false
})

--------------------------------------------------------------------------------
-- VARIABLES GLOBALES
--------------------------------------------------------------------------------
getgenv().AutoFarm = false
getgenv().AutoRebirth = false
getgenv().AutoBrawl = false

--------------------------------------------------------------------------------
-- PESTAÑA 1: DASHBOARD
--------------------------------------------------------------------------------
local MainTab = Window:CreateTab("Dashboard", 4483362458)

MainTab:CreateSection("Estado del Script")
MainTab:CreateLabel("Script activo y funcional para Muscle Legends 🔥")

MainTab:CreateButton({
   Name = "Cerrar Interfaz",
   Callback = function()
      getgenv().AutoFarm = false
      getgenv().AutoRebirth = false
      getgenv().AutoBrawl = false
      Rayfield:Destroy()
   end,
})

--------------------------------------------------------------------------------
-- PESTAÑA 2: AUTO FARM & REBIRTH (LO MÁS IMPORTANTE)
--------------------------------------------------------------------------------
local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

FarmTab:CreateSection("Entrenamiento Rápido")

FarmTab:CreateToggle({
   Name = "⚡ Auto Entrenar / Usar Herramienta",
   CurrentValue = false,
   Flag = "ToggleAutoFarm",
   Callback = function(Value)
      getgenv().AutoFarm = Value
      
      task.spawn(function()
         while getgenv().AutoFarm do
            task.wait()
            local char = game.Players.LocalPlayer.Character
            if char then
               -- Activa la herramienta equipada (pesa, empujones, etc.)
               local tool = char:FindFirstChildOfClass("Tool")
               if tool then
                  tool:Activate()
               end
            end
         end
      end)
   end,
})

FarmTab:CreateSection("Renacimientos Automáticos")

FarmTab:CreateToggle({
   Name = "🔄 Auto Rebirth",
   CurrentValue = false,
   Flag = "ToggleAutoRebirth",
   Callback = function(Value)
      getgenv().AutoRebirth = Value
      
      task.spawn(function()
         while getgenv().AutoRebirth do
            task.wait(0.5)
            -- Remoto de Rebirth oficial de Muscle Legends
            local rebirthRemote = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents") 
               and game:GetService("ReplicatedStorage").rEvents:FindFirstChild("rebirthRemote")
            
            if rebirthRemote then
               rebirthRemote:InvokeServer("rebirthRequest")
            end
         end
      end)
   end,
})

FarmTab:CreateToggle({
   Name = "🥊 Auto Join Brawl (Peleas)",
   CurrentValue = false,
   Flag = "ToggleAutoBrawl",
   Callback = function(Value)
      getgenv().AutoBrawl = Value
      
      task.spawn(function()
         while getgenv().AutoBrawl do
            task.wait(1)
            local brawlRemote = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents") 
               and game:GetService("ReplicatedStorage").rEvents:FindFirstChild("brawlEvent")
            
            if brawlRemote then
               brawlRemote:FireServer("joinBrawl")
            end
         end
      end)
   end,
})

--------------------------------------------------------------------------------
-- PESTAÑA 3: TELEPORTS
--------------------------------------------------------------------------------
local TeleportTab = Window:CreateTab("Teleports", 4483362458)

TeleportTab:CreateSection("Gimnasios Principales")

local function teleportTo(cframe)
   local char = game.Players.LocalPlayer.Character
   if char and char:FindFirstChild("HumanoidRootPart") then
      char.HumanoidRootPart.CFrame = cframe
   end
end

TeleportTab:CreateButton({
   Name = "Spawn Main Gym",
   Callback = function()
      teleportTo(CFrame.new(0, 8, 0))
   end,
})

TeleportTab:CreateButton({
   Name = "Frost Gym (5 Rebirths)",
   Callback = function()
      teleportTo(CFrame.new(-2602, 8, -408))
   end,
})

TeleportTab:CreateButton({
   Name = "Mythical Gym (15 Rebirths)",
   Callback = function()
      teleportTo(CFrame.new(2250, 8, 1070))
   end,
})

TeleportTab:CreateButton({
   Name = "Eternal Gym (30 Rebirths)",
   Callback = function()
      teleportTo(CFrame.new(-6730, 8, -1280))
   end,
})

TeleportTab:CreateButton({
   Name = "Legend Gym (60 Rebirths)",
   Callback = function()
      teleportTo(CFrame.new(4612, 8, -3890))
   end,
})
