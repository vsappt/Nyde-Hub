local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Blox fruit nyro",
    Icon = 0,
    LoadingTitle = "Nyro hub",
    LoadingSubtitle = "by DTB",
    ShowText = "Rayfield",
    Theme = "AmberGlow",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Nyro hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

local nowe = false
local speeds = 1
local tpwalking = false
local speaker = game:GetService("Players").LocalPlayer
local autoM1Enabled = false

local MainTab = Window:CreateTab("Home", 4483362458)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
    Title = "you executed the script",
    Content = "very good gui",
    Duration = 5,
    Image = nil,
})

MainTab:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if InfiniteJumpEnabled and speaker.Character then
                local hum = speaker.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState("Jumping") end
            end
        end)
    end,
})

MainTab:CreateDropdown({
    Name = "Select Island",
    Options = {"cafe", "hot and cold"},
    CurrentOption = {"cafe"},
    MultipleOptions = false,
    Flag = "teleport",
    Callback = function(Options)
        print(Options)
    end,
})

MainTab:CreateToggle({
    Name = "Auto Fruit M1",
    CurrentValue = false,
    Flag = "autofruitm1",
    Callback = function(Value)
        while Value do
            local args = {
                vector.create(-0.0, -0, -1),
                3
            }
            game:GetService("Players").LocalPlayer.Character:WaitForChild("T-Rex-T-Rex"):WaitForChild("LeftClickRemote"):FireServer(unpack(args))
            task.wait(0.1)
        end
    end,
})

local FlyTab = Window:CreateTab(" Fly", 4483362458)
FlyTab:CreateSection("Fly Controls")

local speedLabel = FlyTab:CreateLabel("Current Speed: 1")

FlyTab:CreateButton({
    Name = "Speed +",
    Callback = function()
        speeds = speeds + 1
        speedLabel:Set("Current Speed: " .. tostring(speeds))
        if nowe == true then
            tpwalking = false
            task.wait(0.05)
            for i = 1, speeds do
                task.spawn(function()
                    local hb = game:GetService("RunService").Heartbeat
                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
        end
    end,
})

FlyTab:CreateButton({
    Name = "Speed -",
    Callback = function()
        if speeds <= 1 then
            Rayfield:Notify({
                Title = "Speed",
                Content = "Cannot be less than 1!",
                Duration = 2,
            })
        else
            speeds = speeds - 1
            speedLabel:Set("Current Speed: " .. tostring(speeds))
            if nowe == true then
                tpwalking = false
                task.wait(0.05)
                for i = 1, speeds do
                    task.spawn(function()
                        local hb = game:GetService("RunService").Heartbeat
                        tpwalking = true
                        local chr = game.Players.LocalPlayer.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end
                    end)
                end
            end
        end
    end,
})

FlyTab:CreateButton({
    Name = "Move UP",
    Callback = function()
        if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
            speaker.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
        end
    end,
})

FlyTab:CreateButton({
    Name = "Move DOWN",
    Callback = function()
        if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
            speaker.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0)
        end
    end,
})

FlyTab:CreateButton({
    Name = "FLY (Click to Toggle ON/OFF)",
    Callback = function()
        if nowe == true then
            nowe = false
            tpwalking = false
            if speaker.Character and speaker.Character:FindFirstChildOfClass("Humanoid") then
                local hum = speaker.Character:FindFirstChildOfClass("Humanoid")
                for _, state in Enum.HumanoidStateType:GetEnumItems() do
                    pcall(function() hum:SetStateEnabled(state, true) end)
                end
                hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
            end
            Rayfield:Notify({ Title = "Fly", Content = "Fly turned OFF", Duration = 2 })
        else
            nowe = true
            for i = 1, speeds do
                task.spawn(function()
                    local hb = game:GetService("RunService").Heartbeat
                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
            
            if speaker.Character and speaker.Character:FindFirstChildOfClass("Humanoid") then
                speaker.Character.Animate.Disabled = true
                local Hum = speaker.Character:FindFirstChildOfClass("Humanoid")
                for _, v in next, Hum:GetPlayingAnimationTracks() do
                    v:AdjustSpeed(0)
                end
                
                for _, state in Enum.HumanoidStateType:GetEnumItems() do
                    pcall(function() Hum:SetStateEnabled(state, false) end)
                end
                Hum:ChangeState(Enum.HumanoidStateType.Swimming)
            end
            Rayfield:Notify({ Title = "Fly", Content = "Fly turned ON!", Duration = 2 })

            task.spawn(function()
                local plr = game.Players.LocalPlayer
                local rootPart = plr.Character and (plr.Character:FindFirstChild("Torso") or plr.Character:FindFirstChild("UpperTorso"))
                if not rootPart then return end
                
                local ctrl = {f=0, b=0, l=0, r=0}
                local lastctrl = {f=0, b=0, l=0, r=0}
                local maxspeed = 50
                local speed = 0
                
                local bg = Instance.new("BodyGyro", rootPart)
                bg.P = 9e4
                bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.cframe = rootPart.CFrame
                
                local bv = Instance.new("BodyVelocity", rootPart)
                bv.velocity = Vector3.new(0, 0.1, 0)
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
                
                plr.Character.Humanoid.PlatformStand = true
                
                while nowe == true do
                    task.wait()
                    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                        speed = speed + .5 + (speed / maxspeed)
                        if speed > maxspeed then speed = maxspeed end
                    elseif speed ~= 0 then
                        speed = speed - 1
                        if speed < 0 then speed = 0 end
                    end
                    local cam = game.Workspace.CurrentCamera.CoordinateFrame
                    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                        bv.velocity = ((cam.lookVector * (ctrl.f + ctrl.b)) + ((cam * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - cam.p)) * speed
                        lastctrl = {f=ctrl.f, b=ctrl.b, l=ctrl.l, r=ctrl.r}
                    elseif speed ~= 0 then
                        bv.velocity = ((cam.lookVector * (lastctrl.f + lastctrl.b)) + ((cam * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - cam.p)) * speed
                    else
                        bv.velocity = Vector3.new(0, 0, 0)
                    end
                    bg.cframe = cam * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
                end
                bg:Destroy()
                bv:Destroy()
                if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
                    plr.Character.Humanoid.PlatformStand = false
                    plr.Character.Animate.Disabled = false
                end
                tpwalking = false
            end)
        end
    end,
})

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.7)
    nowe = false
    tpwalking = false
    autoM1Enabled = false
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand = false end
    if char:FindFirstChild("Animate") then char.Animate.Disabled = false end
end)


