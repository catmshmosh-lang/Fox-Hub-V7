-- 🔥 FOX HUB v7 - الأقوى عالمياً 🔥
-- Discord: discord.gg
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10) or LocalPlayer.PlayerGui
if PlayerGui:FindFirstChild("FOX_HUB_V7") or PlayerGui:FindFirstChild("FoxKeySystem") or PlayerGui:FindFirstChild("FoxToggleGui") then
if PlayerGui:FindFirstChild("FOX_HUB_V7") then PlayerGui:FindFirstChild("FOX_HUB_V7"):Destroy() end
if PlayerGui:FindFirstChild("FoxKeySystem") then PlayerGui:FindFirstChild("FoxKeySystem"):Destroy() end
if PlayerGui:FindFirstChild("FoxToggleGui") then PlayerGui:FindFirstChild("FoxToggleGui"):Destroy() end
end
local function Notify(title, text)
pcall(function()
StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = 5})
end)
end
local CorrectKey = "FOX-V7-gojo"
local DiscordLink = "discord.gg"
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "FoxKeySystem"
KeyGui.ResetOnSpawn = false
KeyGui.Parent = PlayerGui
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 450, 0, 320)
KeyFrame.Position = UDim2.new(0.5, -225, 0.5, -160)
KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 26)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = KeyGui
local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.BackgroundColor3 = Color3.fromRGB(0, 255, 220)
KeyTitle.Text = "🔑 FOX HUB - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.new(0,0,0)
KeyTitle.TextSize = 20
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyFrame
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.25, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
KeyInput.Text = ""
KeyInput.PlaceholderText = "أدخل المفتاح هنا..."
KeyInput.TextColor3 = Color3.new(1,1,1)
KeyInput.TextSize = 16
KeyInput.Font = Enum.Font.Gotham
KeyInput.Parent = KeyFrame
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.8, 0, 0, 45)
CheckBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
CheckBtn.Text = "تحقق من المفتاح"
CheckBtn.TextColor3 = Color3.new(1,1,1)
CheckBtn.TextSize = 18
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.Parent = KeyFrame
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 45)
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
GetKeyBtn.Text = "📌 الحصول على المفتاح (Discord)"
GetKeyBtn.TextColor3 = Color3.new(1,1,1)
GetKeyBtn.TextSize = 15
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Parent = KeyFrame
GetKeyBtn.MouseButton1Click:Connect(function()
if setclipboard then
setclipboard(DiscordLink)
Notify("FOX HUB", "تم نسخ رابط السيرفر!")
else
Notify("FOX HUB", "الرابط هو: " .. DiscordLink)
end
end)
local function StartMainScript()
KeyGui:Destroy()
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FOX_HUB_V7"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 650)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -325)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 18)
MainFrame.BackgroundTransparency = 0.05
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 70)
Title.BackgroundColor3 = Color3.fromRGB(0, 255, 220)
Title.Text = "🔥 FOX HUB v7 🔥"
Title.TextColor3 = Color3.new(0,0,0)
Title.TextSize = 25
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 45)
TabBar.Position = UDim2.new(0, 0, 0, 70)
TabBar.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
TabBar.Parent = MainFrame
local MainTabBtn = Instance.new("TextButton")
MainTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
MainTabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
MainTabBtn.Text = "⚔️ الهاكات الأساسية"
MainTabBtn.TextColor3 = Color3.new(1,1,1)
MainTabBtn.TextSize = 16
MainTabBtn.Font = Enum.Font.GothamBold
MainTabBtn.Parent = TabBar
local ScriptsTabBtn = Instance.new("TextButton")
ScriptsTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
ScriptsTabBtn.Position = UDim2.new(0.5, 0, 0, 0)
ScriptsTabBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
ScriptsTabBtn.Text = "🚀 السكربتات المشهورة"
ScriptsTabBtn.TextColor3 = Color3.new(0.6, 0.6, 0.6)
ScriptsTabBtn.TextSize = 16
ScriptsTabBtn.Font = Enum.Font.GothamBold
ScriptsTabBtn.Parent = TabBar
local MainContainer = Instance.new("ScrollingFrame")
MainContainer.Size = UDim2.new(1, -20, 1, -135)
MainContainer.Position = UDim2.new(0, 10, 0, 125)
MainContainer.BackgroundTransparency = 1
MainContainer.CanvasSize = UDim2.new(0, 0, 0, 600)
MainContainer.ScrollBarThickness = 6
MainContainer.Visible = true
MainContainer.Parent = MainFrame
local ScriptsContainer = Instance.new("ScrollingFrame")
ScriptsContainer.Size = UDim2.new(1, -20, 1, -135)
ScriptsContainer.Position = UDim2.new(0, 10, 0, 125)
ScriptsContainer.BackgroundTransparency = 1
ScriptsContainer.CanvasSize = UDim2.new(0, 0, 0, 950)
ScriptsContainer.ScrollBarThickness = 6
ScriptsContainer.Visible = false
ScriptsContainer.Parent = MainFrame
MainTabBtn.MouseButton1Click:Connect(function()
MainContainer.Visible = true
ScriptsContainer.Visible = false
MainTabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
MainTabBtn.TextColor3 = Color3.new(1,1,1)
ScriptsTabBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
ScriptsTabBtn.TextColor3 = Color3.new(0.6, 0.6, 0.6)
end)
ScriptsTabBtn.MouseButton1Click:Connect(function()
MainContainer.Visible = false
ScriptsContainer.Visible = true
ScriptsTabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
ScriptsTabBtn.TextColor3 = Color3.new(1,1,1)
MainTabBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
MainTabBtn.TextColor3 = Color3.new(0.6, 0.6, 0.6)
end)
local function LoadScript(name, url)
Notify("جاري التحميل...", name)
pcall(function()
loadstring(game:HttpGet(url, true))()
Notify("✅ تم التشغيل", name)
end)
end
local mainY = 10
local function AddMainBtn(text, color, callback)
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, 0, 0, 50)
btn.Position = UDim2.new(0, 0, 0, mainY)
btn.BackgroundColor3 = color
btn.Text = text
btn.TextSize = 16
btn.TextColor3 = Color3.new(1,1,1)
btn.Font = Enum.Font.GothamBold
btn.Parent = MainContainer
btn.MouseButton1Click:Connect(callback)
mainY = mainY + 60
end
local scriptY = 10
local function AddFamousScriptBtn(name, desc, url)
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, 0, 0, 55)
btn.Position = UDim2.new(0, 0, 0, scriptY)
btn.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
btn.Text = "⚡ " .. name .. " (" .. desc .. ")"
btn.TextColor3 = Color3.fromRGB(0, 255, 220)
btn.TextSize = 15
btn.Font = Enum.Font.GothamBold
btn.Parent = ScriptsContainer
btn.MouseButton1Click:Connect(function()
LoadScript(name, url)
end)
scriptY = scriptY + 65
end
local killAura = false
RunService.Heartbeat:Connect(function()
if killAura and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
local root = LocalPlayer.Character.HumanoidRootPart
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
if (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude < 25 then
if plr.Character:FindFirstChild("Humanoid") then plr.Character.Humanoid.Health = 0 end
end
end
end
end
end)
AddMainBtn("⚔️ Kill Aura ON/OFF", Color3.fromRGB(255, 50, 50), function()
killAura = not killAura
Notify("Kill Aura", killAura and "مفعل" or "معطل")
end)
AddMainBtn("🪙 Auto Collect", Color3.fromRGB(0, 255, 150), function() Notify("Auto Collect", "مفعل تلقائياً") end)
AddMainBtn("📍 Click TP (Shift+Click)", Color3.fromRGB(100, 200, 255), function() Notify("Click TP", "اضغط Shift + Click") end)
AddMainBtn("⚡ سرعة 500", Color3.fromRGB(255, 140, 0), function()
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = 500 end
end)
AddMainBtn("🦘 Infinite Jump", Color3.fromRGB(0, 220, 100), function() Notify("Infinite Jump", "مفعل") end)
AddFamousScriptBtn("Infinite Yield", "أوامر أدمن وطيران كامل", "githubusercontent.com")
AddFamousScriptBtn("Blox Fruits - Hoho Hub", "أقوى سكربت بلوكس فروت", "githubusercontent.com")
AddFamousScriptBtn("Vape V4", "أقوى سكربت Bedwars طيران وسرعة", "githubusercontent.com")
AddFamousScriptBtn("Flynas Hub", "سكربت عربي لماب البيوت Brookhaven", "githubusercontent.com")
AddFamousScriptBtn("MM2 - Hydrox Hub", "هاك Murder Mystery 2 تجميع وكشف القاتل", "githubusercontent.com")
AddFamousScriptBtn("Orca Hub", "سكربت شامل ممتاز لكل ألعاب روبلوكس", "githubusercontent.com")
AddFamousScriptBtn("Arsenal - OwlHub", "إيم بوت كشف أماكن مخصص لألعاب الشوتر", "githubusercontent.com")
AddFamousScriptBtn("Fly Script", "هاك طيران مستقر جداً لكل الألعاب", "githubusercontent.com")
AddFamousScriptBtn("Dex Explorer", "مستكشف ملفات اللعبة للمطورين", "githubusercontent.com")
local function AddImageToHead(char)
task.wait(1.5)
local head = char:FindFirstChild("Head")
if head then
if head:FindFirstChild("FoxBillboard") then head.FoxBillboard:Destroy() end
local bb = Instance.new("BillboardGui", head)
bb.Name = "FoxBillboard"
bb.Size = UDim2.new(0, 340, 0, 340)
bb.StudsOffset = Vector3.new(0, 8, 0)
bb.AlwaysOnTop = true
local img = Instance.new("ImageLabel", bb)
img.Size = UDim2.new(1,0,1,0)
img.BackgroundTransparency = 1
img.Image = "roblox.com"
img.ImageTransparency = 0.1
end
end
if LocalPlayer.Character then AddImageToHead(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(AddImageToHead)
local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "FoxToggleGui"
ToggleGui.ResetOnSpawn = false
ToggleGui.Parent = PlayerGui
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 65, 0, 65)
ToggleBtn.Position = UDim2.new(0, 15, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(8, 8, 18)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 220)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Text = "🦊"
ToggleBtn.TextSize = 28
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Parent = ToggleGui
ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
Notify("FOX HUB v7", "تم تشغيل السكربت بنجاح!")
end
CheckBtn.MouseButton1Click:Connect(function()
if KeyInput.Text == CorrectKey then
Notify("🔑 تم التحقق", "المفتاح صحيح!")
StartMainScript()
else
Notify("❌ خطأ", "المفتاح غير صحيح!")
end
end)

