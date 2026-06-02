local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AvA Hub", -- Title of the UI
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "AvA Hub - The Succesor of Nyro Hub",
   LoadingSubtitle = "by Vsapts",
   ShowText = "AvA", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "AvA Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "AvA Hub Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local HomeTab = Window:CreateTab("Home", 4483362458) -- Title, Image

local Auto = HomeTab:CreateSection("Auto")

Auto:CreateToggle({
   Name = "Auto Fruit M1",
   CurrentValue = false,
   Flag = "AutoFarmToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving
   Callback = function(Value)
      while true do
         if Value then
            local args = {
                vector.create(0.8840076923370361, -0, 0.4674724340438843),
                1
            }
            game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):WaitForChild("T-Rex-T-Rex"):WaitForChild("LeftClickRemote"):FireServer(unpack(args))
         end
         task.wait(0.1)
      end
   end,
})
