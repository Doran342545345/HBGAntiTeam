local player = game.Players.LocalPlayer
local targetFolder = workspace:WaitForChild("Live"):WaitForChild(player.Name)



local blacklist = {
    ["ForwardDashCD"] = true,
    ["DashCD"] = true,
    ["DashPunchCD"] = true,
    ["RecentStun"] = true,
    ["RecentStunNoAction"] = true,
    ["DASHCD"] = true,
    ["RecentDash"] = true,
    ["Dashing"] = true,
    ["BDStun"] = true,
    ["DontAllowBlocking"] = true,
    ["CantPunchONCLIENT"] = true,
    ["Stun"] = true,
    ["TRUECANTSIDEDASH"] = true,
    ["recentdashok"] = true,
    ["SideDashCounter"] = true,
    ["CantBeHitByPunches"] = true,
    ["IFrame2"] = true,
    ["Ok"] = true,
    ["InterruptEffectsVal"] = true,
    ["BlueFlamesDashPunch"] = true,
    ["TargetFoundBD"] = true,
    ["ResettingTimer"] = true,
	["AirDASHCD"] = true,
	["NoDashingTrue"] = true,
	["EventInteractableCDTree"] = true,
	["IFrame"] = true,

	}
if getgenv().RemoveStun == true then return end
-- Remove existing bad instances just in case
for _, child in pairs(targetFolder:GetChildren()) do
    if blacklist[child.Name] then
        child:Destroy()
        --print("Removed existing: " .. child.Name)
    end
end

-- Automatically remove any blacklisted instance as soon as it's added
targetFolder.ChildAdded:Connect(function(child)
	task.wait()
    if blacklist[child.Name] then
        child:Destroy()
        --print("Removed instantly: " .. child.Name)
    end
end)
getgenv().RemoveStun = true
