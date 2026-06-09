-- يوضع هذا السكربت في LocalScript داخل StarterGui
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local isFlying = false
local flySpeed = 70
local bodyVelocity = Instance.new("BodyVelocity")
local bodyGyro = Instance.new("BodyGyro")

-- إنشاء واجهة FOX FLY على شاشة الهاتف
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "FOX_FlySystem"

-- الإطار الرئيسي للوحة FOX (بنفسجي داكن شفاف)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 140, 0, 120)
mainFrame.Position = UDim2.new(0.82, 0, 0.6, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 20, 60) -- بنفسجي داكن
mainFrame.BackgroundTransparency = 0.2

local frameCorner = Instance.new("UICorner", mainFrame)
frameCorner.CornerRadius = UDim.new(0, 10)

-- عنوان السكربت بالإنجليزية فقط
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "FOX FLY"
titleLabel.TextColor3 = Color3.fromRGB(200, 100, 255) -- بنفسجي فاتح ومضيء
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.BackgroundTransparency = 1

-- زر التفعيل والإيقاف معرب
local toggleButton = Instance.new("TextButton", mainFrame)
toggleButton.Size = UDim2.new(0.9, 0, 0, 35)
toggleButton.Position = UDim2.new(0.05, 0, 0.35, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(120, 30, 160) -- بنفسجي متوسط عند الإيقاف
toggleButton.Text = "إيقاف"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 18

local btnCorner = Instance.new("UICorner", toggleButton)

-- زر زيادة السرعة معرب (+ السرعة)
local speedUpButton = Instance.new("TextButton", mainFrame)
speedUpButton.Size = UDim2.new(0.42, 0, 0, 30)
speedUpButton.Position = UDim2.new(0.05, 0, 0.7, 0)
speedUpButton.BackgroundColor3 = Color3.fromRGB(60, 30, 90) -- بنفسجي غامق للأزرار
speedUpButton.Text = "+ السرعة"
speedUpButton.TextColor3 = Color3.fromRGB(230, 180, 255)
speedUpButton.TextSize = 12
Instance.new("UICorner", speedUpButton)

-- زر تقليل السرعة معرب (- السرعة)
local speedDownButton = Instance.new("TextButton", mainFrame)
speedDownButton.Size = UDim2.new(0.42, 0, 0, 30)
speedDownButton.Position = UDim2.new(0.53, 0, 0.7, 0)
speedDownButton.BackgroundColor3 = Color3.fromRGB(60, 30, 90)
speedDownButton.Text = "- السرعة"
speedDownButton.TextColor3 = Color3.fromRGB(230, 180, 255)
speedDownButton.TextSize = 12
Instance.new("UICorner", speedDownButton)

-- برمجة أزرار السرعة
speedUpButton.MouseButton1Click:Connect(function()
	flySpeed = math.min(flySpeed + 20, 200)
end)

speedDownButton.MouseButton1Click:Connect(function()
	flySpeed = math.max(flySpeed - 20, 20)
end)

-- نظام الطيران FOX
toggleButton.MouseButton1Click:Connect(function()
	isFlying = not isFlying
	if isFlying then
		toggleButton.Text = "تشغيل"
		toggleButton.BackgroundColor3 = Color3.fromRGB(180, 50, 255) -- بنفسجي نيون ساطع عند التشغيل
		humanoid.PlatformStand = true
		
		bodyVelocity.Parent = rootPart
		bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		
		bodyGyro.Parent = rootPart
		bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	else
		toggleButton.Text = "إيقاف"
		toggleButton.BackgroundColor3 = Color3.fromRGB(120, 30, 160)
		humanoid.PlatformStand = false
		
		bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
		bodyVelocity.Parent = nil
		
		bodyGyro.MaxTorque = Vector3.new(0, 0, 0)
		bodyGyro.Parent = nil
	end
end)

-- حلقة التحديث المستمر للطيران وتتبع كاميرا الهاتف
RunService.RenderStepped:Connect(function()
	if isFlying and character and rootPart then
		local camera = workspace.CurrentCamera
		bodyGyro.CFrame = camera.CFrame
		
		if humanoid.MoveDirection.Magnitude > 0 then
			bodyVelocity.Velocity = camera.CFrame:VectorToWorldSpace(camera.CFrame:VectorToObjectSpace(humanoid.MoveDirection)) * flySpeed
		else
			bodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end
	end
end)
