function model.getAssociatedRobotHandle()
    local ragnars=sim.getObjectsWithTag(simBWF.modelTags.RAGNAR,true)
    for i=1,#ragnars,1 do
        if simBWF.callCustomizationScriptFunction('model.ext.checkIfRobotIsAssociatedWithLocationFrameOrTrackingWindow',ragnars[i],model.handle) then
            return ragnars[i]
        end
    end
    return -1
end

function sysCall_init()
    model.codeVersion=1
    
    local data=model.readInfo()
    model.showPoints=(data.bitCoded&16)>0
    model.isPick=(data.type==0)
    model.createParts=model.isPick and ((data.bitCoded&8)>0)
    model.robot=model.getAssociatedRobotHandle()
    model.m=sim.getObjectMatrix(model.handle,-1)
    model.sphereContainer=sim.addDrawingObject(sim.drawing_spherepoints,0.007,0,-1,9999,{1,0,1})
    model.online=simBWF.isSystemOnline()
    model.createdPartsInOnlineMode={}
    model.allProducedPartsInOnlineMode={}
end

function sysCall_sensing()
    local t=sim.getSimulationTime()
    local dt=sim.getSimulationTimeStep()
    sim.addDrawingObjectItem(model.sphereContainer,nil)
   
    if model.robot>0 then
        local data={}
        data.id=model.handle
        local reply,retData=simBWF.query('locationFrame_getPoints',data)
        if simBWF.isInTestMode() then
            reply='ok'
            retData={}
            retData.points={{0,0,0.3}}
            retData.pointIds={1}
            retData.partIds={sim.getObject('../genericBox#')}
        end
        if reply=='ok' then
            local pts=retData.points
            local ptIds=retData.pointIds
            if model.online then
                local partIds=retData.partIds
                for i=1,#pts,1 do
                    local ptRel=pts[i]
                    if model.showPoints then
                        local ptAbs=sim.multiplyVector(model.m,ptRel)
                        sim.addDrawingObjectItem(model.sphereContainer,ptAbs)
                    end
 --                   print(ptIds[i],partIds[i],sim.getObjectAlias(partIds[i],1)
                    -- We create parts that were detected / that exist in the real world:
                    if model.createParts and partIds and partIds[i]>=0 and model.createdPartsInOnlineMode[ptIds[i]]==nil then
                        local partData=simBWF.readPartInfo(partIds[i])
                        local vertMinMax=partData.vertMinMax
                        ptRel[1]=ptRel[1]-0.5*vertMinMax[1][2]-0.5*vertMinMax[1][1]
                        ptRel[2]=ptRel[2]-0.5*vertMinMax[2][2]-0.5*vertMinMax[2][1]
                        ptRel[3]=ptRel[3]-vertMinMax[3][2]
                        local itemPosition=sim.multiplyVector(model.m,ptRel)
                        local itemOrientation=sim.getEulerAnglesFromMatrix(model.m)

                        simBWF.instanciatePart(partIds[i],itemPosition,itemOrientation,nil,nil,nil,false)
                        model.createdPartsInOnlineMode[ptIds[i]]=true
                    end
                end
            else
                if model.showPoints then
                    for i=1,#pts,1 do
                        local ptRel=pts[i]
                        local ptAbs=sim.multiplyVector(model.m,ptRel)
                        sim.addDrawingObjectItem(model.sphereContainer,ptAbs)
                    end
                end
            end
        end
    end
end

