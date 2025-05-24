local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "AutoFarm",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "7 days to live | autofarm",
   LoadingSubtitle = "place in autoexecute",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K" -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Referência ao container de scraps
local scrapContainer = workspace:FindFirstChild("scraps")

-- Verifica se há scraps
while true do 
wait(0.1)
if not scrapContainer or #scrapContainer:GetChildren() == 0 then
    -- Nenhum scrap encontrado, dar rejoin no jogo
    TeleportService:Teleport(game.PlaceId, player)
    return
end
end

-- Salva posição original
local originalCFrame = hrp.CFrame

-- Percorre scraps
for _, scrap in pairs(scrapContainer:GetChildren()) do
    local material = scrap:FindFirstChild("defaultMaterial10")
    if material then
        local prompt = material:FindFirstChild("ProximityPrompt")
        if prompt then
            -- Teleporta para o scrap
            hrp.CFrame = material.CFrame + Vector3.new(0, 3, 0)
            wait(0.2)
            fireproximityprompt(prompt)
            wait(0.2)
        end
    end
end

-- Retorna para a posição original
hrp.CFrame = originalCFrame
