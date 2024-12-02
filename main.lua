
if game.CoreGui:FindFirstChild("UICopied") then
    game.CoreGui:FindFirstChild("UICopied"):Destroy()
end

function dragify(Frame)
    dragToggle = nil
    dragSpeed = .25
    dragInput = nil
    dragStart = nil
    dragPos = nil

    function updateInput(input)
        Delta = input.Position - dragStart
        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if (input.UserInputState == Enum.UserInputState.End) then
                    dragToggle = false
                end
            end)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if (input == dragInput and dragToggle) then
            updateInput(input)
        end
    end)
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local library = {}

function library:new(txt, desc)
    local UICopied = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TabList = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Banner = Instance.new("Frame")
    local Text = Instance.new("TextLabel")
    local Desc = Instance.new("TextLabel")
    local Imagelogo = Instance.new("ImageButton")
    local Tabl = Instance.new("ScrollingFrame")
    local FrameAll = Instance.new("Folder")

    UICopied.Name = "UICopied"
    UICopied.Parent = game.CoreGui
    UICopied.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Background.Name = "Background"
    Background.Parent = UICopied
    Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Background.Position = UDim2.new(0.5, -283, 0.5, -155)  
    Background.Size = UDim2.new(0, 567, 0, 310)  
    local toggledui = false
    UserInputService.InputBegan:Connect(function(input)
        pcall(function()
            if input.KeyCode == Enum.KeyCode.RightControl then
                if toggledui == false then
                    toggledui = true
                    UICopied.Enabled = false
                else
                    toggledui = false
                    UICopied.Enabled = true
                end
            end
        end)
    end)

    dragify(Background)

    UICorner.Parent = Background

    FrameAll.Name = "FrameAll"
    FrameAll.Parent = Background

    TabList.Name = "TabList"
    TabList.Parent = Background
    TabList.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TabList.Size = UDim2.new(0, 128, 0, 310)

    UICorner_2.Parent = TabList

    Banner.Name = "Banner"
    Banner.Parent = TabList
    Banner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Banner.BackgroundTransparency = 1.000
    Banner.Position = UDim2.new(0, 0, 0, 7)
    Banner.Size = UDim2.new(0, 128, 0, 56)

    Text.Name = "Text"
    Text.Parent = Banner
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(0, 39, 0, 0)
    Text.Size = UDim2.new(0, 78, 0, 26)
    Text.Font = Enum.Font.SourceSansBold
    Text.Text = txt
    Text.TextColor3 = Color3.fromRGB(181, 16, 68)
    Text.TextSize = 16.000
    Text.TextXAlignment = Enum.TextXAlignment.Left

    Desc.Name = "Desc"
    Desc.Parent = Banner
    Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Desc.BackgroundTransparency = 1.000
    Desc.Position = UDim2.new(0, 39, 0, 19)
    Desc.Size = UDim2.new(0, 78, 0, 24)
    Desc.Font = Enum.Font.SourceSansBold
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(132, 132, 132)
    Desc.TextSize = 13.000
    Desc.TextWrapped = true
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    Imagelogo.Name = "Imagelogo"
    Imagelogo.Parent = Banner
    Imagelogo.BackgroundTransparency = 1.000
    Imagelogo.Position = UDim2.new(0, 8, 0, 9)
    Imagelogo.Size = UDim2.new(0, 25, 0, 25)
    Imagelogo.ZIndex = 2
    Imagelogo.Image = "rbxassetid://8324568288"  
    Imagelogo.ImageRectOffset = Vector2.new(50, 800)
    Imagelogo.ImageRectSize = Vector2.new(50, 50)

    Tabl.Name = "Tabl"
    Tabl.Parent = TabList
    Tabl.Active = true
    Tabl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabl.BackgroundTransparency = 1.000
    Tabl.Position = UDim2.new(0, 0, 0, 51)
    Tabl.Size = UDim2.new(0, 128, 0, 259)
    Tabl.CanvasSize = UDim2.new(0, 0, 0, 0)
    Tabl.ScrollBarThickness = 0
    Tabl.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding_2 = Instance.new("UIPadding")

    UIListLayout.Parent = Tabl
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 15)

    UIPadding_2.Parent = Tabl
    UIPadding_2.PaddingTop = UDim.new(0, 7)

    
end
