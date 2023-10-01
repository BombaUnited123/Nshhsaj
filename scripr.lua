if HH_LOADED and not _G.HH_DEBUG == true then
	-- error("This Script is already running!", 0)
	return
end

pcall(function() getgenv().HH_LOADED = true end)

COREGUI = game:GetService("CoreGui")
if not game:IsLoaded() then
	local notLoaded = Instance.new("Message")
	notLoaded.Parent = CoreGui
	notLoaded.Text = 'This Script Is Running'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

currentVersion = '2.1.3'

Players = game:GetService("Players")

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Hacks Hubs 2.3", colors)
local colors = {
    SchemeColor = Color3.fromRGB(81,50,33),
    Background = Color3.fromRGB(47, 47, 48),
    Header = Color3.fromRGB(99, 99, 100),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Tab1 = Window:NewTab("Main Hacks")
local Tab1Section = Tab1:NewSection("Main Hubs")

Tab1Section:NewSlider("Walk Speed", "Speed Of You Walking", 500, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Tab1Section:NewSlider("Jump Power", "Jumping Height", 500, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Tab1Section:NewSlider("FOV", "Field Of View", 500, 2, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Workspace.CurrentCamera.FieldOfView = s
end)

Tab1Section:NewSlider("Gravity", "Gravity", 500, 2, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Workspace.Gravity = s
end)

Tab1Section:NewSlider("Invisible", "Hunt And Boo!", 500, 2, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Transparency = s
end)

Tab1Section:NewSlider("Terrain", "Set The Terrain Invisibility!", 500, 2, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Workspace.Terrain.Transparency = s
end)

Tab1Section:NewToggle("Infinite Jumping", "Toggle To Inf Jumps", function(state)
    if state then
        local InfiniteJumpEnabled = true
          game:GetService("UserInputService").JumpRequest:connect(function()
          if InfiniteJumpEnabled then
           game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
         end
     end)
    else
        print("Toggle Off")
    end
end)

Tab1Section:NewToggle("Fly", "Toogle To Flu", function(state)
    if state then
        FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
    else
        print("Fly Off")
    end
end)

Tab1Section:NewButton("Get Message", "Get NBC Fake Message!", function()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Systems : NBC Hacked Roblox", "ALL")
    wait(5)
end)

Tab1Section:NewColorPicker("Rainbow Meters", "Show Indicated Meters", Color3.fromRGB(0,0,0), function(color)
    print(color)
    -- Second argument is the default color
end)

Tab1Section:NewButton("Get Fake Hint", "Umm IDK", function()
    msg = Instance.new ("Hint")
        msg.Parent = game.Workspace
        msg.Text = "NBC : MUWAHAHAHHAHAHAHA I WANTED HACK ROBLOX NOOB"
        wait(11)
        msg:remove()
        wait(3)
end)


Tab1Section:NewButton("Get Fake Message", "Umm IDK", function()
    msg = Instance.new ("Message")
        msg.Parent = game.Workspace
        msg.Text = "NBC : Moskow"
        wait(9)
        msg:remove()
        wait(3)
end)
Tab1Section:NewDropdown("Save List", "The Save List", {"Save 1", "Save 2", "Save 3"}, function(currentOption)
    print(currentOption)
end)

Tab1Section:NewButton("Fill Save", "Saves The Empty Load", function()
    print("Success To Filled The Empty Slot")
end)

Tab1Section:NewButton("Kavo Ui == Orion Lib", "Switch To Newer Version", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/8v2JdbB1')))()
end)

Tab1Section:NewButton("Give Meh A Flashlight", "Gave To Meeh", function()
    loadstring(game:GetObjects("rbxassetid://10093563208")[1].Source)()
end)

Tab1Section:NewLabel("Bear Bear I'm A Bear")

Tab1Section:NewToggle("IMABEAR", "IMABEAR", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)