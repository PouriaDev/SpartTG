do
local function run(msg, matches, callback, extra)
local hash = 'group:'..msg.to.id
local group_lang = redis:hget(hash,'lang')
if matches[1] == 'setlang' and  matches[2] == 'en' and is_owner(msg) then 
    
   redis:hdel(hash,'lang')
        return 'Done!\nGroup lang is english now!'
end



if matches[1] == 'setlang' and matches[2] == 'fa' and is_owner(msg) then
redis:hset(hash,'lang',matches[2])
        return 'انجام شد!\nزبان گروه اکنون فارسی است!'
end
if matches[1] == 'lang' then
if group_lang then 
return "زبان گروه شما فارسی است"
else
return "Group lang : English"
end
end
end
return {
  patterns = {
    "^[!#/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ff][Aa])$",
  "^[!#/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ee][Nn])$",
  "^[!#/]([Ll][Aa][Nn][Gg])"
  },
  run = run
}
end
