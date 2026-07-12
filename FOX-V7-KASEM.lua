local KavoLib = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = KavoLib.CreateLib("🦊 فوكس هاب | ماب الكيبورد", "OrangeTheme")

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

local FarmTab = Window:NewTab("🦊 التجميع التلقائي")
local WorldTab = Window:NewTab("🌍 العوالم")
local PlayerTab = Window:NewTab("⚡ اللاعب")

local FarmSection = FarmTab:NewSection("تجميع الكؤوس السريع")
local WorldSection = WorldTab:NewSection("الانتقال بين العوالم")
local PlayerSection = PlayerTab:NewSection("إعدادات شخصية اللاعب")

FarmSection:NewDropdown("🎯 اختر الكأس المستهدف:", "اختر فئة الكؤوس المراد سحبها تلقائياً", {"1 Cup", "5 Cups", "10 Cups", "50 Cups", "100 Cups", "500 Cups", "1k Cups", "5k Cups", "10k Cups", "50k Cups", "100k Cups", "500k Cups", "1M Cups", "5M Cups", "10M Cups"}, function(Value)
    SelectedCup = Value
end)

FarmSection:NewToggle("🔥 تشغيل التجميع السريع", "يقوم بالانتقال فورا وجلب الكأس", function(Value)
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
end)

WorldSection:NewButton("🌌 السفر الفوري للعالم الثاني", "ينقلك مباشرة إلى خريطة العالم 2", function()
    pcall(function()
        local Portal = workspace:FindFirstChild("World2Portal") or workspace:FindFirstChild("TeleportToWorld2")
        HRP.CFrame = Portal and Portal.CFrame or CFrame.new(5000, 500, 5000)
    end)
end)

WorldSection:NewButton("🏡 العودة للعالم الأول", "يعيدك لنقطة البداية الأصلية", function()
    pcall(function()
        local Portal = workspace:FindFirstChild("World1Portal") or workspace:FindFirstChild("TeleportToWorld1")
        HRP.CFrame = Portal and Portal.CFrame or CFrame.new(0, 5, 0)
    end)
end)

PlayerSection:NewSlider("🏃‍♂️ سرعة المشي", "اسحب لتعديل السرعة الخارقة للمشي", 300, 16, function(Value)
    if Humanoid then Humanoid.WalkSpeed = Value end
end)

PlayerSection:NewButton("🛡️ تفعيل الحماية ضد ليزر الموت", "حذف حواجز الموت من الماب كلياً", function()
    pcall(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then v:Destroy() end
        end
    end)
end)
