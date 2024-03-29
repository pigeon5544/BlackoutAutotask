-- ignore how horrifically this is coded i ws making this super fast js for fun lol not a true auto farm so u gotta put it in a loop urself i cba

local Players = game:GetService("Players")
local Character = Players.LocalPlayer.Character
local active = workspace.ActiveTasks
for i,v in pairs(workspace:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
        if v.Parent.Name == "HumanoidRootPart" then
            local Distance = math.floor((v.Parent.Position - Character.HumanoidRootPart.Position).Magnitude)
            if Distance > 5 then continue end
            print("hi my dearest nigga tyrone ur broker is this far away: "..Distance)
            fireproximityprompt(v, Distance)
            task.wait(1)
            local args = {
                [1] = "1: Got any work to do around here?"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dialogue"):WaitForChild("Event"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = v.Parent,
                [2] = "MedicalAid"
            }
            local OURTASKLOL = nil
            local con = active.ChildAdded:Connect(function(obj)
                if obj.Name == "Location" then
                    OURTASKLOL = obj
                end
            end)
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stations"):WaitForChild("StartTask"):FireServer(unpack(args))
            print("???")
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stations"):WaitForChild("StopInteracting"):FireServer()
            task.wait(3)
            con:Disconnect()
            local ActiveTasks = OURTASKLOL.Destinations
            local Civilian = OURTASKLOL.Civilian.HumanoidRootPart.TalkWithNPC
            Character.HumanoidRootPart.CFrame = ActiveTasks.Civilian.CFrame
            task.wait(2)
            fireproximityprompt(Civilian, 1)
            task.wait(0.7)
            local args = {
                [1] = "1: Rebels sent me, here to deliver some medical supplies."
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dialogue"):WaitForChild("Event"):FireServer(unpack(args))
            task.wait(0.8)
            local args = {
                [1] = "1: Glad I could help."
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dialogue"):WaitForChild("Event"):FireServer(unpack(args))
            task.wait(2)
            Character.HumanoidRootPart.CFrame = v.Parent.CFrame
        end
    end
end
