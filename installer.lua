local getfile = function(name)
    return `return loadstring(http_get('https://storage.renderintents.lol/packages/{name}.lua?ria={ria}'))()`
end
if not isfolder('vape') then
    makefolder('vape')
end
if not isfolder('vape/assets') then
    makefolder('vape/assets')
end
if not isfolder('vape/CustomModules') then
    makefolder('vape/CustomModules')
end
if not isfolder('vape/Render') then
    makefolder('vape/Render')
end
if not isfolder('vape/Render/lib') then
    makefolder('vape/Render/lib')
end
if not isfolder('vape/Render/scripts') then
    makefolder('vape/Render/scripts')
end
if not isfolder('vape/Libraries') then
    makefolder('vape/Libraries')
end
writefile('vape/loader.lua', `return loadstring(game:HttpGet('https://storage.renderintents.lol/packages/loader.lua?ria={ria}'))()`)
for i,v in {'Universal', 'MainScript', 'GuiLibrary'} do
    writefile(`vape/{v}.lua`, getfile(v))
end
local assets = {}
for i,v in game:GetService('HttpService'):JSONDecode(game:HttpGet('https://api.github.com/repos/7GrandDadPGN/VapeV4ForRoblox/contents/assets')) do
    if v.name then
        table.insert(assets, v.name)
    end
end
task.spawn(function()
    for i,v in assets do
      writefile('vape/assets/'.. v, game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/assets/'..v))
    end
end)
for i,v in {'6872274481', '12552538292', '17750024818', '893973440', '6872265039'} do
    writefile(`vape/CustomModules/{v}.lua`, getfile(v))
end
writefile('vape/Render/lib/utils.lua', game:HttpGet('https://raw.githubusercontent.com/MaxlaserTechAlt/betterinstaller/main/utils.lua'))
writefile('vape/Render/lib/solarapoop.lua', game:HttpGet('https://raw.githubusercontent.com/MaxlaserTechAlt/betterinstaller/main/solara.lua'))
writefile('vape/Libraries/sha.lua', game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/sha.lua'))
writefile('vape/Libraries/entityHandler.lua', game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua'))
cloneref(game:GetService('StarterGui')):SetCore('SendNotification', ({
        Title = 'Render Installer', 
        Text = 'Installation finished', 
        Duration = 10
    }))
