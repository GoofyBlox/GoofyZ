local Library = {}

function Library:CreateWindow(title)
    -- Create the main UI components
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local TabHolder = Instance.new("Frame")
    local UICorner2 = Instance.new("UICorner")
    local TabButtons = Instance.new("Frame")
    local ContentHolder = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    ScreenGui.Name = "CustomLibrary"
    ScreenGui.Parent = game.CoreGui

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    MainFrame.Size = UDim2.new(0, 500, 0, 300)

    UICorner.Parent = MainFrame

    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, 0, 0, 30)
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20

    TabHolder.Name = "TabHolder"
    TabHolder.Parent = MainFrame
    TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabHolder.Position = UDim2.new(0, 0, 0, 30)
    TabHolder.Size = UDim2.new(0.2, 0, 1, -30)

    UICorner2.Parent = TabHolder

    TabButtons.Name = "TabButtons"
    TabButtons.Parent = TabHolder
    TabButtons.BackgroundTransparency = 1
    TabButtons.Size = UDim2.new(1, 0, 1, 0)

    UIListLayout.Parent = TabButtons
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    ContentHolder.Name = "ContentHolder"
    ContentHolder.Parent = MainFrame
    ContentHolder.BackgroundTransparency = 1
    ContentHolder.Position = UDim2.new(0.2, 0, 0, 30)
    ContentHolder.Size = UDim2.new(0.8, 0, 1, -30)

    -- Dragging functionality
    local dragging, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            input.Changed:Connect(function()
                if dragging then
                    update(input)
                end
            end)
        end
    end)

    -- Tab creation function
    function Library:CreateTab(tabName)
        local TabButton = Instance.new("TextButton")
        local TabFrame = Instance.new("Frame")
        local UIListLayout2 = Instance.new("UIListLayout")

        TabButton.Name = "TabButton"
        TabButton.Parent = TabButtons
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 18

        TabFrame.Name = "TabFrame"
        TabFrame.Parent = ContentHolder
        TabFrame.BackgroundTransparency = 1
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.Visible = false

        UIListLayout2.Parent = TabFrame
        UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(ContentHolder:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            TabFrame.Visible = true
        end)

        return TabFrame
    end

    -- Button creation function
    function Library:CreateButton(tab, btnName, callback)
        local Button = Instance.new("TextButton")

        Button.Name = "Button"
        Button.Parent = tab
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Button.Size = UDim2.new(1, 0, 0, 30)
        Button.Font = Enum.Font.SourceSans
        Button.Text = btnName
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 18

        Button.MouseButton1Click:Connect(callback)
    end

    return Library
end

return Library
