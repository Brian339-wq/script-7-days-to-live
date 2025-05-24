
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")


local scrapContainer = workspace:FindFirstChild("scraps")



local originalCFrame = hrp.CFrame


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

            if not scrapContainer or #scrapContainer:GetChildren() == 0 then

            TeleportService:Teleport(game.PlaceId, player)
            return
            end

        end
    end
end


hrp.CFrame = originalCFrame
