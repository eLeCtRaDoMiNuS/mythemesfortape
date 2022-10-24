local blur = Instance.new("BlurEffect")
blur.Parent = game.Lighting
blur.Size = 5
game.Lighting.Ambient = Color3.new(245, 134, 255)
game.Lighting.FogEnd = "200"
game.Lighting.FogStart = "0"
game.Lighting.Ambient = Color3.new(0.89, 0, 1)
game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=5084575798"
game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=5084575916"
game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=5103949679"
game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=5103948542"
game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=5103948784"
game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=5084576400"
--skidded motion blur
local camera = workspace.CurrentCamera
local blurAmount = 7
local blurAmplifier = 5
local lastVector = camera.CFrame.LookVector

local motionBlur = Instance.new("BlurEffect", camera)

local runService = game:GetService("RunService")

workspace.Changed:Connect(function(property)
 if property == "CurrentCamera" then
  print("Changed")
  local camera = workspace.CurrentCamera
  if motionBlur and motionBlur.Parent then
   motionBlur.Parent = camera
  else
   motionBlur = Instance.new("BlurEffect", camera)
  end
 end
end)

runService.Heartbeat:Connect(function()
 if not motionBlur or motionBlur.Parent == nil then
  motionBlur = Instance.new("BlurEffect", camera)
 end
 
 local magnitude = (camera.CFrame.LookVector - lastVector).magnitude
 motionBlur.Size = math.abs(magnitude)*blurAmount*blurAmplifier/2
 lastVector = camera.CFrame.LookVector
end)
