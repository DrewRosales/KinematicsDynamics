local codeEditorInfos = [[
sysCall_info()
sysCall_thread()
sysCall_init()
sysCall_cleanup()
sysCall_nonSimulation()
sysCall_beforeMainScript()
sysCall_beforeSimulation()
sysCall_afterSimulation()
sysCall_actuation()
sysCall_sensing()
sysCall_suspended()
sysCall_suspend()
sysCall_resume()
sysCall_beforeInstanceSwitch()
sysCall_afterInstanceSwitch()
sysCall_beforeCopy()
sysCall_afterCopy()
sysCall_beforeDelete()
sysCall_afterDelete()
sysCall_afterCreate()
sysCall_joint()
sysCall_vision()
sysCall_userConfig()
sysCall_moduleEntry()
sysCall_trigger()
sysCall_contact()
sysCall_dyn()
sysCall_event()
sysCall_ext()
sysCall_realTimeIdle()
sysCall_beforeSave()
sysCall_afterSave()
sysCall_msg()
sysCall_selChange()
sysCall_data()
quit()
exit()
any value = rawget(table t, any index)
table t = rawset(table t, any key, any value)
any module = require(string name)
any module = require(int scriptHandle)
function iterator = pairs(table t)
function iterator = ipairs(table t)
any index, any value = next(table t, any previousIndex)
bool status, any errOrRet, ... = pcall(function f)
bool status, any errOrRet, ... = xpcall(function f)
any metatable = getmetatable(table t)
table t = setmetatable(table t, any metatable)
error(string message)
assert(bool condition, string errorMessage)
thread c = coroutine.create(function f)
bool ok, ... = coroutine.resume(thread c, ...)
string status = coroutine.status(thread c)
function fResume = coroutine.wrap(function f)
... = coroutine.yield(...)
io.close(file f)
io.flush(file f)
file prev = io.input()
file f = io.input(string fileName)
function iterator = io.lines(file f)
file f = io.open(string fileName)
file prev = io.output()
file f = io.output(string fileName)
string data, ... = io.read(file f, string format1, ...)
string data, ... = io.read(file f, int maxSize, ...)
file f = io.tmpfile()
string t = io.type(file f)
bool success, string errorMessage, int errorCode = io.write(file f, any value, ...)
io.stdin
io.stdout
io.stderr
number t = os.clock()
string s = os.date(string format)
string s = os.date(string format, number time)
number diff = os.difftime(number t1, number t2)
... = os.execute(string command)
os.exit(number exitCode)
string value = os.getenv(string varName)
bool success, string errorMessage = os.remove(string fileName)
bool success, string errorMessage = os.rename(string oldName, string newName)
string name = os.setlocale(string locale, string category)
number time = os.time()
number time = os.time(table t)
string fileName = os.tmpname()
debug.debug()
function f, string mask, int count = debug.gethook()
function f, string mask, int count = debug.gethook(thread t)
table info = debug.getinfo(thread t, function f)
table info = debug.getinfo(thread t, function f, string what)
table info = debug.getinfo(function f)
table info = debug.getinfo(function f, string what)
string name, any val = debug.getlocal(int level, int index)
table mt = debug.getmetatable(table t)
table t = debug.getregistry()
string name, any value = debug.getupvalue(int level, int index)
any value = debug.getuservalue(userdata u)
debug.sethook()
debug.sethook(thread t, function f, string mask, int count)
debug.sethook(function f, string mask, int count)
debug.setlocal(int level, int index, any value)
debug.setmetatable(table t, table mt)
debug.setupvalue(function f, int index, any value)
debug.setuservalue(userdata u, any value)
debug.traceback(thread t, string message, int level)
debug.traceback(thread t, string message)
debug.traceback(string message, int level)
debug.traceback(string message)
]]
registerCodeEditorInfos("", codeEditorInfos)
