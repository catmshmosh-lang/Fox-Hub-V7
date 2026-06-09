local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart", 5)
local humanoid = character:WaitForChild("Humanoid", 5)

if not rootPart or not humanoid then 
	return 
end

local isFlying = false
local flySpeed = 70

local attachment = Instance.new("Attachment")
attachment.Name = "FlyAttachment"
attachment.Parent = rootPart

local linearVelocity = Instance.new("LinearVelocity")
linearVelocity.Attachment0 = attachment
linearVelocity.MaxForce = 0
linearVelocity.VectorVelocity = Vector3.new(0, 0, 0)
linearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World

local alignOrientation = Instance.new("AlignOrientation")
alignOrientation.Attachment0 = attachment
alignOrientation.MaxTorque = 0
alignOrientation.Responsiveness = 200

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FOX_FlySystem"
screenGui.ResetOnSpawn = false 
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 140, 0, 120)
mainFrame.Position = UDim2.new(0.82, 0, 0.6, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 20, 60)
mainFrame.BackgroundTransparency = 0.2

local frameCorner = Instance.new("UICorner", mainFrame)
frameCorner.CornerRadius = UDim.new(0, 10)

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "FOX FLY"
titleLabel.TextColor3 = Color3.fromRGB(200, 100, 255)
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.BackgroundTransparency = 1

local toggleButton = Instance.new("TextButton", mainFrame)
toggleButton.Size = UDim2.new(0.9, 0, 0, 35)
toggleButton.Position = UDim2.new(0.05, 0, 0.35, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(120, 30, 160)
toggleButton.Text = "إيقاف"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 18

local btnCorner = Instance.new("UICorner", toggleButton)

local speedUpButton = Instance.new("TextButton", mainFrame)
speedUpButton.Size = UDim2.new(0.42, 0, 0, 30)
speedUpButton.Position = UDim2.new(0.05, 0, 0.7, 0)
speedUpButton.BackgroundColor3 = Color3.fromRGB(60, 30, 90)
speedUpButton.Text = "+ السرعة"
speedUpButton.TextColor3 = Color3.fromRGB(230, 180, 255)
speedUpButton.TextSize = 12
Instance.new("UICorner", speedUpButton)

local speedDownButton = Instance.new("TextButton", mainFrame)
speedDownButton.Size = UDim2.new(0.42, 0, 0, 30)
speedDownButton.Position = UDim2.new(0.53, 0, 0.7, 0)
speedDownButton.BackgroundColor3 = Color3.fromRGB(60, 30, 90)
speedDownButton.Text = "- السرعة"
speedDownButton.TextColor3 = Color3.fromRGB(230, 180, 255)
speedDownButton.TextSize = 12
Instance.new("UICorner", speedDownButton)

local dragging, dragInput, dragStart, startPos
local function update(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

speedUpButton.MouseButton1Click:Connect(function()
	flySpeed = math.min(flySpeed + 20, 200)
end)

speedDownButton.MouseButton1Click:Connect(function()
	flySpeed = math.max(flySpeed - 20, 20)
end)

toggleButton.MouseButton1Click:Connect(function()
	isFlying = not isFlying
	if isFlying then
		toggleButton.Text = "تشغيل"
		toggleButton.BackgroundColor3 = Color3.fromRGB(180, 50, 255)
		humanoid.PlatformStand = true
		
		linearVelocity.Parent = rootPart
		linearVelocity.MaxForce = 9e9
		
		alignOrientation.Parent = rootPart
		alignOrientation.MaxTorque = 9e9
	else
		toggleButton.Text = "إيقاف"
		toggleButton.BackgroundColor3 = Color3.fromRGB(120, 30, 160)
		humanoid.PlatformStand = false
		
		linearVelocity.MaxForce = 0
		linearVelocity.Parent = nil
		
		alignOrientation.MaxTorque = 0
		alignOrientation.Parent = nil
	end
end)

RunService.RenderStepped:Connect(function()
	if isFlying and character and rootPart and workspace.CurrentCamera then
		local camera = workspace.CurrentCamera
		alignOrientation.CFrame = camera.CFrame
		
		if humanoid.MoveDirection.Magnitude > 0 then
			linearVelocity.VectorVelocity = camera.CFrame:VectorToWorldSpace(camera.CFrame:VectorToObjectSpace(humanoid.MoveDirection)) * flySpeed
		else
			linearVelocity.VectorVelocity = Vector3.new(0, 0, 0)
		end
	end
end)
