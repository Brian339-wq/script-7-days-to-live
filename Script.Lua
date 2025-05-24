if game.PlaceId == "17474746614" then
Return
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
Rayfield:Notify({
   Title = "✅ | Sucessed Loaded Script",
   Content = "",
   Duration = 6.5,
   Image = nil,
})
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")


local scrapContainer = workspace:FindFirstChild("scraps")

if not scrapContainer or #scrapContainer:GetChildren() == 0 then
    -- Nenhum scrap encontrado, dar rejoin no jogo
    TeleportService:Teleport(game.PlaceId, player)
    return
end


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
