local function ACbypasser() 
  -- credits to whoever made this idk
        local reg = getreg()
 
    for i, Function in next, reg do
        if type(Function) == 'function' then
            local info = getinfo(Function)
 
            if info.name == 'kick' then
                if (hookfunction(info.func, function(...)end)) then
                    print'succesfully hooked kick'
                else
                    print'failed to hook kick'
                end
            end
        end
    end
    local playerscripts = game:GetService'Players'.LocalPlayer.PlayerScripts
 
    local script1 = playerscripts.LocalScript
    local script2 = playerscripts.LocalScript2
 
    local script1signal = script1.Changed
    local script2signal = script2.Changed
 
    for i, connection in next, getconnections(script1signal) do
        connection:Disable()
    end
    for i, connection in next, getconnections(script2signal) do
        connection:Disable()
    end
 
    script1:Destroy()
    script2:Destroy()
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
local Window = OrionLib:MakeWindow({Name = "Noah's Hub", HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroText="Noah's Scripts"})

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character

local home = Window:MakeTab({Name = "Home", Icon = "https://www.roblox.com/library/", PremiumOnly = false})
local homeS = home:AddSection({Name = "Home"})
homeS:AddLabel("Hey there, "..game.Players.LocalPlayer.Name.."!")
local homeU = home:AddSection({Name = "Updates"})
homeU:AddLabel(game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/NoahsHub/main/UpdateNew/TowerOfHell.update"))

local main = Window:MakeTab({Name = "Main", Icon = "https://www.roblox.com/library/", PremiumOnly = false})
local sup = Window:MakeTab({Name = "Games"})
local set = Window:MakeTab({Name = "Settings"})

local ac = main:AddSection({Name = "Anti Cheat Bypass"})
local mainS = main:AddSection({Name = "Main"})
local inf = main:AddSection({Name = "Infinite Yield"})


ac:AddButton({
    Name="AntiCheat Bypasser",
    Callback = function()
        ACbypasser()
    end
})

mainS:AddButton({
	Name = "God Mode (Cant die to KillBrick)",
	Callback = function()

        function f()
            char.KillScript:Destroy()
        end
        hookfunction(f, function()
            char.KillScript:Destroy()
        end)
 
        f()
  	end    
})

mainS:AddButton({
	Name = "Win Round",
	Callback = function()
	    local endtower = game.workspace.tower.sections.finish.exit.ParticleBrick.CFrame
            char.HumanoidRootPart.CFrame = endtower
    end
})

mainS:AddButton({
    Name = "Get All Gears",
    Callback = function()
        for i, v in pairs (game:GetService("ReplicatedStorage").Gear:GetChildren()) do
            if v:IsA("Tool") then
                clonedtool = v:Clone()
                clonedtool.Parent = game:GetService("Players").LocalPlayer:FindFirstChild("Backpack")
            end
        end
    end
})

mainS:AddButton({
    Name = "Walk On Walls (Credits to who made it)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
        -- credits to who made it idk
    end
})

mainS:AddButton({
    Name = "Anti BunnyHop",
    Callback = function()
        char:FindFirstChild("bunnyJump"):Destroy()
        plr.PlayerScripts.jump:Destroy()
    end
})

inf:AddButton({
    Name = "Get Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

set:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

sup:AddParagraph("Supported Games",game:HttpGet("https://raw.githubusercontent.com/NoahCodeMaster/NoahsHub/main/SupportedGames/games.sup"))

OrionLib:Init()