color = "^5" 
clients = {}
gamestate = -1
randomseed = -1

function et_InitGame(_levelTime, _randomSeed, _restart)
  et.RegisterModname("AmbiStats")
  gamestate = et.trap_Cvar_Get( "gamestate" )
  randomseed = _randomSeed
  if valid_match() then
    do return end
  end
  local file = get_file() 
  local mname =  et.trap_Cvar_Get("mapname")
  file:write(string.format("%s,%s\n", mname, get_datetime()))
  file:close()
end

function et_ClientConnect(_clientNum, _firstTime, _isBot, _reason)
  local name = et.Info_ValueForKey( et.trap_GetUserinfo( _clientNum ), "name" ) 
  local guid = et.Info_ValueForKey( et.trap_GetUserinfo( _clientNum ), "cl_guid" )
  clients[guid] = {}
  clients[guid].name = name
  clients[guid].id = _clientNum
end

function et_ShutdownGame(_restart)
  if valid_match() then
    do return end
  end
  local file = get_file()
  for k, v in pairs(clients) do
    file:write(k .. "," .. v.name .. "," .. v.id .. ",")
    for i = 0, 25, 1 do
      local wstat = et.gentity_get (v.id, "sess.aWeaponStats", i)
      local atts = wstat[1]
      local deaths = wstat[2]
      local headshots = wstat[3]
      local hits = wstat[4]
      local kills = wstat[5]
      file:write(string.format("%s,%s,%s,%s,%s,", atts, deaths, headshots, hits, kills))
    end
    local battlesense = et.gentity_get (v.id, "sess.skillpoints", 0) -- BATTLESENSE
    local engineering = et.gentity_get (v.id, "sess.skillpoints", 1) -- ENGINEERING
    local medic = et.gentity_get (v.id, "sess.skillpoints", 2) -- MEDIC
    local fieldops = et.gentity_get (v.id, "sess.skillpoints", 3) -- FIELDOPS
    local lightweapons = et.gentity_get (v.id, "sess.skillpoints", 4) -- LIGHTWEAPONS
    local heavyweapons = et.gentity_get (v.id, "sess.skillpoints", 5) -- HEAVYWEAPONS
    local covertops = et.gentity_get (v.id, "sess.skillpoints", 6) -- COVERTOPS
    file:write(string.format("%s,%s,%s,%s,%s,%s,%s\n", battlesense, engineering, medic, fieldops, lightweapons, heavyweapons, covertops))
  end
  file:close()
end

function et_Obituary(_victim, _killer, _meansOfDeath)
  if valid_match() then
    do return end
  end
  if _killer == '1022' or _killer == 1022 then
    do return end
  end
  local killer_guid = et.Info_ValueForKey( et.trap_GetUserinfo( _killer ), "cl_guid" )
  local victim_guid = et.Info_ValueForKey( et.trap_GetUserinfo( _victim ), "cl_guid" )
  local file = get_file()
  file:write(string.format("%s,%s,%s\n", killer_guid, victim_guid, _meansOfDeath))
  file:close()
end

-- HELPER FUNCTIONS
function get_datetime()
  local dt = os.date('*t')
  return string.format("%s-%02d-%02dT%02d:%02d:%02d", dt.year, dt.month, dt.day, dt.hour, dt.min, dt.sec)
end

function valid_match()
  if gamestate ~= "0" then
      et.G_Print(color .. "Not right game state\n")
      return true
  end
  if randomseed == -1 then
      et.G_Print(color .. "bad game seed\n")
      return true
  end
  et.G_Print(color .. "good game\n")
  return false
end

function get_file()
  return io.open(string.format('stats/%s.csv', randomseed), 'a')
end
