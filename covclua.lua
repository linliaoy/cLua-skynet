local rawcoroutinecreate = coroutine.create
covfilenum=1
coroutine.create = function(...) -- luacheck: no global
   local co = rawcoroutinecreate(...)
   local cl = require("libclua")
   cl.sethook(co,"/tmp/test/test-service.cov"..covfilenum, 5)
   covfilenum = covfilenum +1
   return co
end
