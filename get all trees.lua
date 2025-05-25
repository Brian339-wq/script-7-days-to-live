local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local originalCFrame = hrp.CFrame

-- Variável de controle para parar o corte
local cortando = false

-- Função que "bate" na árvore
local function baternaarvore()
    cortando = true
    task.spawn(function()
        while cortando do
            local swingRemote = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("swing_axe")
            swingRemote:FireServer()
            task.wait(0.1) -- Espera para evitar travamentos
        end
    end)
end

-- Função que faz o personagem olhar para o tronco da árvore
local function olharParaTronco(trunk)
    local trunkPosition = trunk.Position
    local direction = (trunkPosition - hrp.Position).unit
    local lookAtCFrame = CFrame.lookAt(hrp.Position, trunkPosition)
    hrp.CFrame = CFrame.new(hrp.Position, trunkPosition)
end

-- Função que interage com todos os troncos da pasta Logs
local function getalllogs()
    for _, logg in pairs(game.Workspace.Logs:GetChildren()) do
        local main = logg:FindFirstChild("main")
        if main then
            local prompt = main:FindFirstChild("ProximityPrompt")
            if prompt then
                task.wait(0.2)
                fireproximityprompt(prompt)
                task.wait(0.2)
            end
        end
    end
end

-- Começar a bater na árvore
baternaarvore()

-- Percorrer cada árvore
for _, tree in pairs(game.Workspace.trees:GetChildren()) do
    local trunk = tree:FindFirstChild("Trunk")
    if trunk then
        -- Fazer o personagem olhar para o tronco
        olharParaTronco(trunk)

        -- Mover o jogador até o tronco
        hrp.CFrame = trunk.CFrame + Vector3.new(0, 3, 0)

        -- Esperar até que a árvore seja destruída
        repeat
            task.wait(0.5)
        until not tree:IsDescendantOf(game.Workspace.trees)

        -- Coletar os troncos
        getalllogs()
    end
end

-- Parar de bater ao final
cortando = false

-- Voltar à posição original
hrp.CFrame = originalCFrame
