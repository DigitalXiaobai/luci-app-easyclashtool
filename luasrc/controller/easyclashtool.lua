-- Controller
module("luci.controller.easyclashtool", package.seeall)
function index()
entry({"admin", "services", "easyclashtool"}, firstchild(), "EasyClashTool", 10).dependent = false
entry({"admin", "services", "easyclashtool", "config"}, cbi("easyclashtool.config"), "config", 10)
entry({"admin", "services", "easyclashtool", "status"}, cbi("easyclashtool.status"), "status", 10)
entry({"admin", "services", "easyclashtool", "subscription"}, cbi("easyclashtool.subscription"), "subscription", 10)
entry({"admin", "services", "easyclashtool", "log"}, cbi("easyclashtool.log"), "log", 10)
entry({"admin", "services", "easyclashtool", "rule"}, cbi("easyclashtool.rule"), "rule", 10)
entry({"admin", "services", "easyclashtool", "test"}, cbi("easyclashtool.test"), "test", 10)
entry({"admin", "services", "easyclashtool", "cron"}, cbi("easyclashtool.cron"), "cron", 10)
entry({"admin", "services", "easyclashtool", "multiuser"}, cbi("easyclashtool.multiuser"), "multiuser", 10)
entry({"admin", "services", "easyclashtool", "upload"}, cbi("easyclashtool.upload"), "upload", 10)
entry({"admin", "services", "easyclashtool", "autodetect"}, cbi("easyclashtool.autodetect"), "autodetect", 10)
end