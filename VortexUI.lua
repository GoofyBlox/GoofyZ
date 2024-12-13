-- testing but you can get the source 

local UI = {}

-- Create a new UI window
function UI:CreateWindow(options)
    local window = Instance.new("ScreenGui")
    window.Name = options.Name or "CustomUI"
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Window background
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 300)
    frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.Parent = window

    -- Title label
    local title = Instance.new("TextLabel")
    title.Text = options.Name or "Custom UI"
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 24
    title.Parent = frame
    
    -- Settings for storing window buttons
    window.buttons = {}

    -- Add sections
    function window:CreateSection(sectionOptions)
        local sectionFrame = Instance.new("Frame")
        sectionFrame.Size = UDim2.new(1, 0, 0, sectionOptions.Size or 50)
        sectionFrame.Position = UDim2.new(0, 0, 0, title.Size.Y.Offset)
        sectionFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        sectionFrame.Parent = frame

        local sectionLabel = Instance.new("TextLabel")
        sectionLabel.Text = sectionOptions.Name or "Section"
        sectionLabel.Size = UDim2.new(1, 0, 0, 30)
        sectionLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        sectionLabel.TextSize = 18
        sectionLabel.Parent = sectionFrame

        return sectionFrame
    end

    -- Add a button to the UI
    function window:CreateButton(buttonOptions)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.8, 0, 0, 40)
        button.Position = UDim2.new(0.1, 0, 0, 40)
        button.Text = buttonOptions.Name or "Button"
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 20
        button.Parent = frame

        -- Button click functionality
        button.MouseButton1Click:Connect(function()
            if buttonOptions.Callback then
                buttonOptions.Callback()
            end
        end)

        table.insert(window.buttons, button)
    end

    -- Add a switch button (on/off toggle)
    function window:CreateSwitch(switchOptions)
        local switchFrame = Instance.new("Frame")
        switchFrame.Size = UDim2.new(0.8, 0, 0, 40)
        switchFrame.Position = UDim2.new(0.1, 0, 0, 40)
        switchFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        switchFrame.Parent = frame

        local switchLabel = Instance.new("TextLabel")
        switchLabel.Text = switchOptions.Name or "Switch"
        switchLabel.Size = UDim2.new(0.6, 0, 1, 0)
        switchLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        switchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        switchLabel.TextSize = 18
        switchLabel.Parent = switchFrame

        local switchToggle = Instance.new("TextButton")
        switchToggle.Size = UDim2.new(0.3, 0, 1, 0)
        switchToggle.Position = UDim2.new(0.7, 0, 0, 0)
        switchToggle.Text = switchOptions.CurrentValue and "ON" or "OFF"
        switchToggle.BackgroundColor3 = switchOptions.CurrentValue and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        switchToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        switchToggle.TextSize = 18
        switchToggle.Parent = switchFrame

        switchToggle.MouseButton1Click:Connect(function()
            switchOptions.CurrentValue = not switchOptions.CurrentValue
            switchToggle.Text = switchOptions.CurrentValue and "ON" or "OFF"
            switchToggle.BackgroundColor3 = switchOptions.CurrentValue and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

            if switchOptions.Callback then
                switchOptions.Callback(switchOptions.CurrentValue)
            end
        end)
    end

    return window
end

return UI
