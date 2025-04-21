local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local frameSize = isMobile and UDim2.new(0, 300, 0, 250) or UDim2.new(0, 600, 0, 400)
local titleTextSize = isMobile and 16 or 20
local paragraphTitleSize = isMobile and 14 or 16
local paragraphTextSize = isMobile and 12 or 14

local gui = Instance.new("ScreenGui")
gui.Name = "SemanticGuideUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = frameSize
frame.Position = UDim2.new(0.5, -frameSize.X.Offset / 2, 0.5, -frameSize.Y.Offset / 2) 
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "📄 Semantic Versioning Guide"
title.Font = Enum.Font.GothamBold
title.TextSize = titleTextSize
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "❌"
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.Parent = frame

local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(0, 8)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 8
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = frame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 10)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scroll

local function addParagraph(titleText, contentText)
	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, 0, 0, 0)
	title.AutomaticSize = Enum.AutomaticSize.Y
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.GothamBold
	title.TextSize = paragraphTitleSize
	title.TextColor3 = Color3.fromRGB(255, 170, 0)
	title.Text = titleText
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = scroll

	local content = Instance.new("TextLabel")
	content.Size = UDim2.new(1, 0, 0, 0)
	content.AutomaticSize = Enum.AutomaticSize.Y
	content.BackgroundTransparency = 1
	content.Font = Enum.Font.Gotham
	content.TextSize = paragraphTextSize
	content.TextColor3 = Color3.fromRGB(230, 230, 230)
	content.TextWrapped = true
	content.TextXAlignment = Enum.TextXAlignment.Left
	content.TextYAlignment = Enum.TextYAlignment.Top
	content.Text = contentText
	content.Parent = scroll
end

addParagraph("Overview", [[ This shows how to use Semantic Versioning to label updates in the format: 

 vMAJOR.MINOR.PATCH]])

addParagraph("MAJOR", " Big changes. Breaking compatibility.\n Example: Revamping the project with new core logic, layout, or structure.\n E.g., v1.0.0 → v2.0.0")

addParagraph("MINOR", " New features, still compatible with older versions.\n Example: Adding new commands or enhancements.\n E.g., v0.1.0 → v0.2.0")

addParagraph("PATCH", " Bug fixes or small improvements.\n Example: Fixing a broken response or typo.\n E.g., v0.1.0 → v0.1.1")

addParagraph("Examples", [[
 v0.0.0 – Project setup, nothing works yet  
 v0.1.0 – First working version  
 v0.1.1 – Fixed small bugs  
 v0.2.0 – Added new features  
 v1.0.0 – First full release, stable and ready for everyone  
]])

addParagraph("Credits", "Developed by Peteware")
