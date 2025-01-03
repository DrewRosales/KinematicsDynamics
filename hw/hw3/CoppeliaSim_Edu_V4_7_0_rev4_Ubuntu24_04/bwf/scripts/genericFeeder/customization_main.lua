function model.setModelSize()
    local c=model.readInfo()
    local v=c['size']
    for i=1,3,1 do
        if v[i]<0.05 then
            v[i]=0.05
        end
    end
    local mmin=sim.getObjectFloatParam(model.handle,sim.objfloatparam_objbbox_min_x)
    local mmax=sim.getObjectFloatParam(model.handle,sim.objfloatparam_objbbox_max_x)
    local sx=mmax-mmin
    local mmin=sim.getObjectFloatParam(model.handle,sim.objfloatparam_objbbox_min_y)
    local mmax=sim.getObjectFloatParam(model.handle,sim.objfloatparam_objbbox_max_y)
    local sy=mmax-mmin
    local mmin=sim.getObjectFloatParam(model.handle,sim.objfloatparam_objbbox_min_z)
    local mmax=sim.getObjectFloatParam(model.handle,sim.objfloatparam_objbbox_max_z)
    local sz=mmax-mmin
    sim.scaleObject(model.handle,v[1]/sx,v[2]/sy,v[3]/sz)
end

function model.getAvailableSensors()
    local l=sim.getObjectsInTree(sim.handle_scene,sim.handle_all,0)
    local retL={}
    for i=1,#l,1 do
        local data=sim.readCustomStringData(l[i],simBWF.modelTags.BINARYSENSOR)
        if data and #data > 0 then
            retL[#retL+1]={simBWF.getObjectAltName(l[i]),l[i]}
        end
        if not data then
            data=sim.readCustomStringData(l[i],simBWF.modelTags.OLDSTATICPICKWINDOW)
            if data and #data > 0 then
                retL[#retL+1]={simBWF.getObjectAltName(l[i]),l[i]}
            end
        end
    end
    return retL
end

function model.getAvailableConveyors()
    local l=sim.getObjectsInTree(sim.handle_scene,sim.handle_all,0)
    local retL={}
    for i=1,#l,1 do
        local data=sim.readCustomStringData(l[i],simBWF.modelTags.CONVEYOR)
        if data and #data > 0 then
            retL[#retL+1]={simBWF.getObjectAltName(l[i]),l[i]}
        end
    end
    return retL
end

function sysCall_init()
    model.codeVersion=1

    model.dlg.init()

    local info=model.readInfo()
    -- Following for backward compatibility:
    if info['sensor'] then
        simBWF.setReferencedObjectHandle(model.handle,model.objRefIdx.SENSOR,sim.getObjectHandle_noErrorNoSuffixAdjustment(info['sensor']))
        info['sensor']=nil
    end
    if info['conveyor'] then
        simBWF.setReferencedObjectHandle(model.handle,model.objRefIdx.CONVEYOR,sim.getObjectHandle_noErrorNoSuffixAdjustment(info['conveyor']))
        info['conveyor']=nil
    end
    ----------------------------------------
    model.writeInfo(info)
    
    model.handleJobConsistency(simBWF.isModelACopy_ifYesRemoveCopyTag(model.handle))
    model.updatePluginRepresentation()
end

function sysCall_nonSimulation()
    model.dlg.showOrHideDlgIfNeeded()
end

function sysCall_sensing()
    if model.simJustStarted then
        model.dlg.updateEnabledDisabledItems()
    end
    model.simJustStarted=nil
    model.dlg.showOrHideDlgIfNeeded()
--    model.ext.outputPluginRuntimeMessages()
end

function sysCall_suspended()
    model.dlg.showOrHideDlgIfNeeded()
end

function sysCall_afterSimulation()
    model.dlg.updateEnabledDisabledItems()
    sim.setObjectInt32Param(model.handle,sim.objintparam_visibility_layer,1)
    local conf=model.readInfo()
    conf['multiFeederTriggerCnt']=0
    model.writeInfo(conf)
end

function sysCall_beforeSimulation()
    model.simJustStarted=true
    model.ext.outputBrSetupMessages()
    model.ext.outputPluginSetupMessages()
    local conf=model.readInfo()
    conf['multiFeederTriggerCnt']=0
    model.writeInfo(conf)
    local show=simBWF.modifyAuxVisualizationItems((conf['bitCoded']&1)==0)
    if not show then
        sim.setObjectInt32Param(model.handle,sim.objintparam_visibility_layer,0)
    end
end

function sysCall_beforeInstanceSwitch()
    model.dlg.removeDlg()
    model.removeFromPluginRepresentation()
end

function sysCall_afterInstanceSwitch()
    model.updatePluginRepresentation()
end

function sysCall_cleanup()
    model.dlg.removeDlg()
    model.removeFromPluginRepresentation()
    model.dlg.cleanup()
end
