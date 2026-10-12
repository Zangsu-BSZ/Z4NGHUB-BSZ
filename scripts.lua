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
   KeySystem = false -- Lo dejamos sin clave por ahora para probar
})

--------------------------------------------------------------------------------
-- PESTAÑA 1: DASHBOARD / INICIO
--------------------------------------------------------------------------------
local MainTab = Window:CreateTab("Dashboard", 4483362458) -- Icono de inicio

MainTab:CreateSection("Bienvenido a Z4NG BSZ HUB")

MainTab:CreateLabel("Script activo para Muscle Legends")

MainTab:CreateButton({
   Name = "Destruir Interfaz (Cerrar)",
   Callback = function()
      Rayfield:Destroy()
   end,
})

--------------------------------------------------------------------------------
-- PESTAÑA 2: AUTO FARM
--------------------------------------------------------------------------------
local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

FarmTab:CreateSection("Entrenamiento Automático")

-- Variable para controlar el Auto Farm de Pesas
getgenv().AutoWeight = false

FarmTab:CreateToggle({
   Name = "Auto Levantar Pesas",
   CurrentValue = false,
   Flag = "TogglePesas",
   Callback = function(Value)
      getgenv().AutoWeight = Value
      
      -- Bucle para entrenar
      task.spawn(function()
         while getgenv().AutoWeight do
            task.wait(0.1)
            -- Aquí irá la lógica para usar la pesa automáticamente
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Tool") then
               char:FindFirstChildOfClass("Tool"):Activate()
            end
         end
      end)
   end,
})

--------------------------------------------------------------------------------
-- PESTAÑA 3: TELEPORTS / ZONAS
--------------------------------------------------------------------------------
local TeleportTab = Window:CreateTab("Teleports", 4483362458)

TeleportTab:CreateSection("Gimnasios y Zonas")

TeleportTab:CreateButton({
   Name = "Teleport a Spawn (Gimnasio Principal)",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
   end,
})
