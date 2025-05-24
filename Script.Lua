local scrapContainer = workspace:FindFirstChild("scraps")

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

hrp.anchored = true


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

while true do
wait(1)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Brian339-wq/script-7-days-to-live/refs/heads/main/Script.Lua'))()
end
