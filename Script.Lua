local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")

local isAutoClicking = false
local clickDelay = 0.1

local scrapsfolder = Workspace:FindFirstChild("scraps")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

if not scrapsfolder then
    warn("Pasta 'scraps' não encontrada no Workspace. O teleporte não funcionará.")
end

local function simulateEClick()
    UserInputService:SimulateKeyPress(Enum.KeyCode.E)
end

local function toggleAutoClicker()
    isAutoClicking = not isAutoClicking
    if isAutoClicking then
        while isAutoClicking do
            simulateEClick()
            task.wait(clickDelay)
        end
    else
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Q and not gameProcessedEvent then
        toggleAutoClicker()
    end
})

if scrapsfolder then
    task.spawn(function()
        while true do
            local children = scrapsfolder:GetChildren()
            if #children > 0 then
                for i, v in pairs(children) do
                    if v:IsA("BasePart") then
                        local targetPosition = v.Position
                        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                        local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
                        tween:Play()
                        tween.Completed:Wait()
                    else
                        warn("Objeto não é uma BasePart na pasta 'scraps': " .. v.Name)
                    end
                end
            else
                TeleportService:Teleport(game.PlaceId)
                task.wait(5)
            end
            task.wait(0.05)
        end
    end)
end
