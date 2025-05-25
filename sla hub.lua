pcall(function()
print("tpl | Loading Rayfield Libraly . . .")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
print("loaded!")
print("tpl | loading window")
local Window = Rayfield:CreateWindow({
   Name = "tpl | 7 days to live script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "tpl (7dtl)",
   LoadingSubtitle = "tip: press (K) to toggle the ui!",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K" -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
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
print("loaded")
print("Loading scripts")
local maintab = Window:CreateTab("🏠 Home", nil) -- Title, Image
local FarmTab = Window:CreateTab("🌱 Farm", nil) -- Title, Imag
Rayfield:Notify({
   Title = "Script Loaded!",
   Content = "7dtl",
   Duration = 6.5,
   Image = nil,
})
local AutoFarmScrap = FarmTab:CreateToggle({
   Name = "Auto Farm Scraps",
   CurrentValue = false,
   Flag = "AFS", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   if Value == true then
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Save original position
local originalCFrame = hrp.CFrame

-- Go through each scrap and teleport to it
for _, scrap in pairs(workspace.scraps:GetChildren()) do
    local material = scrap:FindFirstChild("defaultMaterial10")
    if material then
        local prompt = material:FindFirstChild("ProximityPrompt")
        if prompt then
            -- Teleport to scrap, slightly above to avoid getting stuck
            hrp.CFrame = material.CFrame + Vector3.new(0, 3, 0)

            wait(0.2) -- allow time for physics
            fireproximityprompt(prompt)
            wait(0.2) 
        end
    end
end

-- Return to original position
hrp.CFrame = originalCFrame
value = false
     elseif value == false then
     
    end
   end,
})

  
end)
