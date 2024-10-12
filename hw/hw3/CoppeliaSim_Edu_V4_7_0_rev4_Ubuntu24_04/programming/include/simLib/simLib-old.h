typedef int (__cdecl *ptrSimRunSimulator)(const char* applicationName,int options,void(*setToNull1)(),void(*setToNull2)(),void(*setToNull3)());
typedef int (__cdecl *ptrSimRunSimulatorEx)(const char* applicationName,int options,void(*setToNull1)(),void(*setToNull2)(),void(*setToNull3)(),int stopDelay,const char* sceneOrModelToLoad);
typedef int (__cdecl *ptrSimExtLaunchUIThread)(const char* applicationName,int options,const char* sceneOrModelOrUiToLoad,const char* applicationDir_);
typedef int (__cdecl *ptrSimExtCanInitSimThread)();
typedef int (__cdecl *ptrSimExtSimThreadInit)();
typedef int (__cdecl *ptrSimExtSimThreadDestroy)();
typedef int (__cdecl *ptrSimExtPostExitRequest)();
typedef int (__cdecl *ptrSimExtGetExitRequest)();
typedef int (__cdecl *ptrSimExtStep)(bool stepIfRunning);
typedef int (__cdecl *ptrSimExtCallScriptFunction)(int scriptHandleOrType, const char* functionNameAtScriptName,const int* inIntData, int inIntCnt,const SIMDOUBLE* inFloatData, int inFloatCnt,const char** inStringData, int inStringCnt,const char* inBufferData, int inBufferCnt,int** outIntData, int* outIntCnt,SIMDOUBLE** outFloatData, int* outFloatCnt,char*** outStringData, int* outStringCnt,char** outBufferData, int* outBufferSize);
typedef int (__cdecl *ptrSimAddModuleMenuEntry)(const char* entryLabel,int itemCount,int* itemHandles);
typedef int (__cdecl *ptrSimSetModuleMenuItemState)(int itemHandle,int state,const char* label);
typedef int (__cdecl *ptrSimAddPointCloud)(int pageMask,int layerMask,int objectHandle,int options,SIMDOUBLE pointSize,int ptCnt,const SIMDOUBLE* pointCoordinates,const char* defaultColors,const char* pointColors,const SIMDOUBLE* pointNormals);
typedef int (__cdecl *ptrSimModifyPointCloud)(int pointCloudHandle,int operation,const int* intParam,const SIMDOUBLE* floatParam);
typedef void (__cdecl *ptr_simGetJointOdeParameters)(const void* joint,SIMDOUBLE* stopERP,SIMDOUBLE* stopCFM,SIMDOUBLE* bounce,SIMDOUBLE* fudge,SIMDOUBLE* normalCFM);
typedef void (__cdecl *ptr_simGetJointBulletParameters)(const void* joint,SIMDOUBLE* stopERP,SIMDOUBLE* stopCFM,SIMDOUBLE* normalCFM);
typedef void (__cdecl *ptr_simGetOdeMaxContactFrictionCFMandERP)(const void* geomInfo,int* maxContacts,SIMDOUBLE* friction,SIMDOUBLE* cfm,SIMDOUBLE* erp);
typedef bool (__cdecl *ptr_simGetBulletCollisionMargin)(const void* geomInfo,SIMDOUBLE* margin,int* otherProp);
typedef SIMDOUBLE (__cdecl *ptr_simGetBulletRestitution)(const void* geomInfo);
typedef void (__cdecl *ptr_simGetVortexParameters)(const void* object,int version,SIMDOUBLE* floatParams,int* intParams);
typedef void (__cdecl *ptr_simGetNewtonParameters)(const void* object,int* version,SIMDOUBLE* floatParams,int* intParams);
typedef void (__cdecl *ptr_simGetDamping)(const void* geomInfo,SIMDOUBLE* linDamping,SIMDOUBLE* angDamping);
typedef SIMDOUBLE (__cdecl *ptr_simGetFriction)(const void* geomInfo);
typedef bool (__cdecl *ptr_simGetBulletStickyContact)(const void* geomInfo);
typedef int (__cdecl *ptrSimCallScriptFunction)(int scriptHandleOrType,const char* functionNameAtScriptName,SLuaCallBack* data,const char* reservedSetToNull);
typedef int (__cdecl *ptrSimGetJointMatrix)(int objectHandle,SIMDOUBLE* matrix);
typedef int (__cdecl *ptrSimSetSphericalJointMatrix)(int objectHandle,const SIMDOUBLE* matrix);
typedef const void* (__cdecl *ptr_simGetGeomProxyFromShape)(const void* shape);
typedef int (__cdecl *ptrSimReorientShapeBoundingBox)(int shapeHandle,int relativeToHandle,int reservedSetToZero);
typedef int (__cdecl *ptrSimIsDeprecated)(const char* funcOrConst);
typedef int (__cdecl *ptrSimLoadModule)(const char* filenameAndPath,const char* pluginName);
typedef int (__cdecl *ptrSimUnloadModule)(int pluginhandle);
typedef int (__cdecl *ptrSimSetModuleInfo)(const char* moduleName,int infoType,const char* stringInfo,int intInfo);
typedef int (__cdecl *ptrSimGetModuleInfo)(const char* moduleName,int infoType,char** stringInfo,int* intInfo);
typedef char* (__cdecl *ptrSimGetModuleName)(int index,unsigned char* moduleVersion);
typedef int (__cdecl *ptrSimIsStackValueNull)(int stackHandle);
typedef int (__cdecl *ptrSimIsRealTimeSimulationStepNeeded)();
typedef int (__cdecl *ptrSimAdjustRealTimeTimer)(int instanceIndex,SIMDOUBLE deltaTime);
typedef int (__cdecl *ptrSimSetSimulationPassesPerRenderingPass)(int p);
typedef int (__cdecl *ptrSimGetSimulationPassesPerRenderingPass)();
typedef int (__cdecl *ptrSimAdvanceSimulationByOneStep)();
typedef int (__cdecl *ptrSimHandleMainScript)();
typedef int (__cdecl *ptrSimGetScriptInt32Param)(int scriptHandle,int parameterID,int* parameter);
typedef int (__cdecl *ptrSimSetScriptInt32Param)(int scriptHandle,int parameterID,int parameter);
typedef char* (__cdecl *ptrSimGetScriptStringParam)(int scriptHandle,int parameterID,int* parameterLength);
typedef int (__cdecl *ptrSimSetScriptStringParam)(int scriptHandle,int parameterID,const char* parameter,int parameterLength);
typedef int (__cdecl *ptrSimAddScript)(int scriptProperty);
typedef int (__cdecl *ptrSimRemoveScript)(int scriptHandle);
typedef int (__cdecl *ptrSimAssociateScriptWithObject)(int scriptHandle,int associatedObjectHandle);
typedef int (__cdecl *ptrSimPersistentDataWrite)(const char* dataName,const char* dataValue,int dataLength,int options);
typedef char* (__cdecl *ptrSimPersistentDataRead)(const char* dataName,int* dataLength);
typedef char* (__cdecl *ptrSimGetPersistentDataTags)(int* tagCount);


extern ptrSimRunSimulator simRunSimulator;
extern ptrSimRunSimulatorEx simRunSimulatorEx;
extern ptrSimExtLaunchUIThread simExtLaunchUIThread;
extern ptrSimExtCanInitSimThread simExtCanInitSimThread;
extern ptrSimExtSimThreadInit simExtSimThreadInit;
extern ptrSimExtSimThreadDestroy simExtSimThreadDestroy;
extern ptrSimExtPostExitRequest simExtPostExitRequest;
extern ptrSimExtGetExitRequest simExtGetExitRequest;
extern ptrSimExtStep simExtStep;
extern ptrSimExtCallScriptFunction simExtCallScriptFunction;
extern ptrSimAddModuleMenuEntry simAddModuleMenuEntry;
extern ptrSimSetModuleMenuItemState simSetModuleMenuItemState;
extern ptrSimAddPointCloud simAddPointCloud;
extern ptrSimModifyPointCloud simModifyPointCloud;
extern ptr_simGetJointOdeParameters _simGetJointOdeParameters;
extern ptr_simGetJointBulletParameters _simGetJointBulletParameters;
extern ptr_simGetOdeMaxContactFrictionCFMandERP _simGetOdeMaxContactFrictionCFMandERP;
extern ptr_simGetBulletCollisionMargin _simGetBulletCollisionMargin;
extern ptr_simGetBulletStickyContact _simGetBulletStickyContact;
extern ptr_simGetBulletRestitution _simGetBulletRestitution;
extern ptr_simGetVortexParameters _simGetVortexParameters;
extern ptr_simGetNewtonParameters _simGetNewtonParameters;
extern ptr_simGetDamping _simGetDamping;
extern ptr_simGetFriction _simGetFriction;
extern ptrSimCallScriptFunction simCallScriptFunction;
extern ptrSimGetJointMatrix simGetJointMatrix;
extern ptrSimSetSphericalJointMatrix simSetSphericalJointMatrix;
extern ptr_simGetGeomProxyFromShape _simGetGeomProxyFromShape;
extern ptrSimReorientShapeBoundingBox simReorientShapeBoundingBox;
extern ptrSimIsDeprecated simIsDeprecated;
extern ptrSimLoadModule simLoadModule;
extern ptrSimUnloadModule simUnloadModule;
extern ptrSimGetModuleName simGetModuleName;
extern ptrSimSetModuleInfo simSetModuleInfo;
extern ptrSimGetModuleInfo simGetModuleInfo;
extern ptrSimIsStackValueNull simIsStackValueNull;
extern ptrSimIsRealTimeSimulationStepNeeded simIsRealTimeSimulationStepNeeded;
extern ptrSimAdjustRealTimeTimer simAdjustRealTimeTimer;
extern ptrSimSetSimulationPassesPerRenderingPass simSetSimulationPassesPerRenderingPass;
extern ptrSimGetSimulationPassesPerRenderingPass simGetSimulationPassesPerRenderingPass;
extern ptrSimAdvanceSimulationByOneStep simAdvanceSimulationByOneStep;
extern ptrSimHandleMainScript simHandleMainScript;
extern ptrSimGetScriptInt32Param simGetScriptInt32Param;
extern ptrSimSetScriptInt32Param simSetScriptInt32Param;
extern ptrSimGetScriptStringParam simGetScriptStringParam;
extern ptrSimSetScriptStringParam simSetScriptStringParam;
extern ptrSimAddScript simAddScript;
extern ptrSimRemoveScript simRemoveScript;
extern ptrSimAssociateScriptWithObject simAssociateScriptWithObject;
extern ptrSimPersistentDataWrite simPersistentDataWrite;
extern ptrSimPersistentDataRead simPersistentDataRead;
extern ptrSimGetPersistentDataTags simGetPersistentDataTags;

#ifdef SIM_INTERFACE_OLD
#include "simLib-old2.h"
#endif
