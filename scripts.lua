-- Cargamos la librería de interfaz (Rayfield)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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
MainTab:CreateLabel("Script activo y seguro ✅")

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
-- PESTAÑA 2: AUTO FARM & REBIRTH (CORREGIDO)
--------------------------------------------------------------------------------
local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

FarmTab:CreateSection("Entrenamiento Seguro")

FarmTab:CreateToggle({
   Name = "⚡ Auto Entrenar (Sin Kick)",
   CurrentValue = false,
   Flag = "ToggleAutoFarm",
   Callback = function(Value)
      getgenv().AutoFarm = Value
      
      task.spawn(function()
         while getgenv().AutoFarm do
            task.wait(0.1) -- Tiempo de espera seguro para evitar deteccion de cheating
            local player = game.Players.LocalPlayer
            local char = player.Character
            if char then
               local tool = char:FindFirstChildOfClass("Tool")
               if tool then
                  tool:Activate()
               end
               -- Disparo de evento seguro de fuerza
               local muscleEvent = player:FindFirstChild("muscleEvent") or char:FindFirstChild("muscleEvent")
               if muscleEvent then
                  muscleEvent:FireServer("rep")
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
            local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
            if rEvents and rEvents:FindFirstChild("rebirthRemote") then
               rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            end
         end
      end)
   end,
})

FarmTab:CreateToggle({
   Name = "🥊 Auto Join Brawl",
   CurrentValue = false,
   Flag = "ToggleAutoBrawl",
   Callback = function(Value)
      getgenv().AutoBrawl = Value
      
      task.spawn(function()
         while getgenv().AutoBrawl do
            task.wait(1)
            local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
            if rEvents and rEvents:FindFirstChild("brawlEvent") then
               rEvents.brawlEvent:FireServer("joinBrawl")
            end
         end
      end)
   end,
})

--------------------------------------------------------------------------------
-- PESTAÑA 3: TELEPORTS (CORREGIDOS Y SEGUROS)
--------------------------------------------------------------------------------
local TeleportTab = Window:CreateTab("Teleports", 4483362458)

TeleportTab:CreateSection("Gimnasios (Coordenadas Seguras)")

-- Función de Teleport segura que evita la caída al vacío y el kick
local function safeTeleport(targetCFrame)
   local char = game.Players.LocalPlayer.Character
   if char and char:FindFirstChild("HumanoidRootPart") then
      local root = char.HumanoidRootPart
      root.Velocity = Vector3.new(0, 0, 0) -- Frena la caída previa
      task.wait(0.05)
      root.CFrame = targetCFrame
   end
end

TeleportTab:CreateButton({
   Name = "Spawn Gym (Inicio)",
   Callback = function()
      safeTeleport(CFrame.new(0, 10, 0))
   end,
})

TeleportTab:CreateButton({
   Name = "Frost Gym (5 Rebirths)",
   Callback = function()
      safeTeleport(CFrame.new(-2598, 15, -406))
   end,
})

TeleportTab:CreateButton({
   Name = "Mythical Gym (15 Rebirths)",
   Callback = function()
      safeTeleport(CFrame.new(2250, 15, 1070))
   end,
})

TeleportTab:CreateButton({
   Name = "Eternal Gym (30 Rebirths)",
   Callback = function()
      safeTeleport(CFrame.new(-6730, 15, -1280))
   end,
})

TeleportTab:CreateButton({
   Name = "Legend Gym (60 Rebirths)",
   Callback = function()
      safeTeleport(CFrame.new(4612, 15, -3890))
   end,
})

TeleportTab:CreateButton({
   Name = "Muscle King Gym (100 Rebirths)",
   Callback = function()
      safeTeleport(CFrame.new(-8630, 15, -5700))
   end,
})
