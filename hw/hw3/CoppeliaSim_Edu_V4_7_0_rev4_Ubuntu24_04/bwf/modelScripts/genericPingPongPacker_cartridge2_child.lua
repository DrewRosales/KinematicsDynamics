simBWF=require('simBWF')
putCartridgeDown=function()
    sim.wait(dwellTimeUp)
    sim.rmlMoveToJointPositions({j},-1,{0},{0},{maxVel},{maxAccel},{9999},{0},{0})
    sim.wait(dwellTimeDown)
    sim.rmlMoveToJointPositions({j},-1,{0},{0},{maxVel},{maxAccel},{9999},{-45*math.pi/180},{0})
end

enableStopper=function(enable)
    if enable then
        sim.setObjectInt32Param(stopper,sim.objintparam_visibility_layer,1) -- make it visible
        sim.setObjectSpecialProperty(stopper,sim.objectspecialproperty_collidable+sim.objectspecialproperty_measurable+sim.objectspecialproperty_detectable_all+sim.objectspecialproperty_renderable) -- make it collidable, measurable, detectable, etc.
        sim.setObjectInt32Param(stopper,sim.shapeintparam_respondable,1) -- make it respondable
        sim.resetDynamicObject(stopper)
    else
        sim.setObjectInt32Param(stopper,sim.objintparam_visibility_layer,0)
        sim.setObjectSpecialProperty(stopper,0)
        sim.setObjectInt32Param(stopper,sim.shapeintparam_respondable,0)
        sim.resetDynamicObject(stopper)
    end
end

waitForSensor=function(ind,signal)
    while true do
        local r=sim.handleProximitySensor(sens[ind])
        if signal then
            if r>0 then break end
        else
            if r<=0 then break end
        end
        sim.step()
    end
end

enableConveyor=function(enable)
    sim.setStepping(true)
    local data=sim.readCustomStringData(model,simBWF.modelTags.CONVEYOR)
    data=sim.unpackTable(data)
    local r=data['stopRequests']
    if enable then
        r[objectHandle]=nil
    else
        r[objectHandle]=true
    end
    data['stopRequests']=r
    sim.writeCustomStringData(model,simBWF.modelTags.CONVEYOR,sim.packTable(data))
    sim.setStepping(false)
end

waitForCartridgeFull=function()
    while true do
        local data=sim.readCustomStringData(model,simBWF.modelTags.CONVEYOR)
        data=sim.unpackTable(data)
        if data['putCartridgeDown'][2] then
            break
        end
        sim.step()
    end
end

setCartridgeEmpty=function()
    sim.setStepping(true)
    local data=sim.readCustomStringData(model,simBWF.modelTags.CONVEYOR)
    data=sim.unpackTable(data)
    data['putCartridgeDown'][2]=false
    sim.writeCustomStringData(model,simBWF.modelTags.CONVEYOR,sim.packTable(data))
    sim.setStepping(false)
end

objectHandle=sim.getObject('..')
model=sim.getObject('../genericPingPongPacker')
local data=sim.readCustomStringData(model,simBWF.modelTags.CONVEYOR)
data=sim.unpackTable(data)
maxVel=data['cartridgeVelocity']
maxAccel=data['cartridgeAcceleration']
dwellTimeDown=data['cartridgeDwellTimeDown']
dwellTimeUp=data['cartridgeDwellTimeUp']
j=sim.getObject('../genericPingPongPacker_cartridge2_upDownJoint')
sens={}
sens[1]=sim.getObject('../genericPingPongPacker_cartridge2_sensor')
sens[2]=sim.getObject('../genericPingPongPacker_cartridge2_sensor2')
stopper=sim.getObject('../genericPingPongPacker_cartridge2_stopper')

while sim.getSimulationState()~=sim.simulation_advancing_abouttostop do
    waitForSensor(1,true)
    waitForSensor(1,false)
    waitForSensor(1,true)
    enableStopper(true)
    waitForSensor(2,true)
    enableConveyor(false)
    waitForCartridgeFull()
    putCartridgeDown()
    setCartridgeEmpty()
    enableStopper(false)
    enableConveyor(true)
    waitForSensor(1,false)
end