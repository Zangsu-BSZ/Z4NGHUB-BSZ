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
MainTab:CreateLabel("Script optimizado anti BAC-6206 ✅")

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
-- PESTAÑA 2: AUTO FARM & REBIRTH (BYPASS BAC-6206)
--------------------------------------------------------------------------------
local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

FarmTab:CreateSection("Entrenamiento Seguro")

FarmTab:CreateToggle({
   Name = "⚡ Auto Entrenar (Bypass Anticheat)",
   CurrentValue = false,
   Flag = "ToggleAutoFarm",
   Callback = function(Value)
      getgenv().AutoFarm = Value
      
      task.spawn(function()
         while getgenv().AutoFarm do
            task.wait(0.18) -- Intervalo seguro para evadir BAC-6206
            
            pcall(function()
               local player = game.Players.LocalPlayer
               local char = player.Character
               
               if char then
                  local tool = char:FindFirstChildOfClass("Tool")
                  
                  if tool then
                     -- Activa la herramienta equipada de manera nativa
                     tool:Activate()
                     
                     -- Evento interno de la herramienta
                     local muscleEvent = tool:FindFirstChild("muscleEvent") or char:FindFirstChild("muscleEvent")
                     if muscleEvent then
                        muscleEvent:FireServer("rep")
                     end
                  end
               end
            end)
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
            task.wait(1.5)
            pcall(function()
               local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
               if rEvents and rEvents:FindFirstChild("rebirthRemote") then
                  rEvents.rebirthRemote:InvokeServer("rebirthRequest")
               end
            end)
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
            task.wait(2.5)
            pcall(function()
               local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
               if rEvents and rEvents:FindFirstChild("brawlEvent") then
                  rEvents.brawlEvent:FireServer("joinBrawl")
               end
            end)
         end
      end)
   end,
})

--------------------------------------------------------------------------------
-- PESTAÑA 3: TELEPORTS (ANTIKICK)
--------------------------------------------------------------------------------
local TeleportTab = Window:CreateTab("Teleports", 4483362458)

TeleportTab:CreateSection("Gimnasios")

local function safeTeleport(targetCFrame)
   pcall(function()
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("HumanoidRootPart") then
         local root = char.HumanoidRootPart
         root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
         root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
         task.wait(0.08)
         root.CFrame = targetCFrame
         task.wait(0.08)
         root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
      end
   end)
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
