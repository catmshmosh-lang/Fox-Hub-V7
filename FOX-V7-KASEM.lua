local OrionLib = loadstring(game:HttpGet('https://githubusercontent.com'))()
local Window = OrionLib:MakeWindow({Name = "🦊 فوكس هاب | ماب الكيبورد", HidePremium = false, SaveConfig = false})

local Player = game.Players.LocalPlayer
local Character, HRP, Humanoid
local FastFarm = false
local SelectedCup = "1 Cup"

local function UpdateCharacter(Char)
    Character = Char or Player.Character or Player.CharacterAdded:Wait()
    HRP = Character:WaitForChild("HumanoidRootPart", 5)
    Humanoid = Character:WaitForChild("Humanoid", 5)
end
Player.CharacterAdded:Connect(UpdateCharacter)
UpdateCharacter()

local FarmTab = Window:MakeTab({Name = "🦊 التجميع التلقائي", Icon = "rbxassetid://4483345998"})
local WorldTab = Window:MakeTab({Name = "🌍 العوالم", Icon = "rbxassetid://4483345998"})
local PlayerTab = Window:MakeTab({Name = "⚡ اللاعب", Icon = "rbxassetid://4483345998"})

FarmTab:AddDropdown({
    Name = "🎯 اختر الكأس المستهدف:",
    Default = "1 Cup",
    Options = {"1 Cup", "5 Cups", "10 Cups", "50 Cups", "100 Cups", "500 Cups", "1k Cups", "5k Cups", "10k Cups", "50k Cups", "100k Cups", "500k Cups", "1M Cups", "5M Cups", "10M Cups"},
    Callback = function(Value) SelectedCup = Value end    
})

FarmTab:AddToggle({
    Name = "🔥 تشغيل التجميع السريع",
    Default = false,
    Callback = function(Value)
        FastFarm = Value
        task.spawn(function()
            while FastFarm do
                task.wait(0.01)
                pcall(function()
                    if not HRP then return end
                    for _, obj in pairs(workspace:GetDescendants()) do
                        if obj:IsA("BasePart") and (obj.Name == SelectedCup or obj.Name:lower():find(SelectedCup:lower())) then
                            HRP.CFrame = obj.CFrame + Vector3.new(0, 2, 0)
                            break
                        end
                    end
                end)
            end
        end)
    end    
})

WorldTab:AddButton({
    Name = "🌌 السفر الفوري للعالم الثاني",
    Callback = function()
        pcall(function()
            local Portal = workspace:FindFirstChild("World2Portal") or workspace:FindFirstChild("TeleportToWorld2")
            HRP.CFrame = Portal and Portal.CFrame or CFrame.new(5000, 500, 5000)
        end)
    end
})

WorldTab:AddButton({
    Name = "🏡 العودة للعالم الأول",
    Callback = function()
        pcall(function()
            local Portal = workspace:FindFirstChild("World1Portal") or workspace:FindFirstChild("TeleportToWorld1")
            HRP.CFrame = Portal and Portal.CFrame or CFrame.new(0, 5, 0)
        end)
    end
})

PlayerTab:AddSlider({
    Name = "🏃‍♂️ سرعة المشي",
    Min = 16, Max = 300, Default = 16, Color = Color3.fromRGB(255,100,0), Increment = 1, ValueName = "السرعة",
    Callback = function(Value) if Humanoid then Humanoid.WalkSpeed = Value end end    
})

PlayerTab:AddButton({
    Name = "🛡️ تفعيل الحماية ضد ليزر الموت",
    Callback = function()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") then v:Destroy() end
            end
            OrionLib:MakeNotification({Name = "فوكس هاب", Content = "تم تنظيف الماب من ليزر الموت!", Time = 3})
        end)
    end
})

OrionLib:Init()
