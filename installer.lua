local getfile = function(name)
    return "return loadstring(http_get('https://storage.renderintents.lol/packages/".. name .. ".lua?ria=".. getgenv().ria.. "'))()"
end
if not isfolder('vape') then
    makefolder('vape')
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
for i,v in {'Universal', 'MainScript', 'loader', 'GuiLibrary'} do
    writefile(`vape/{v}.lua`, getfile(v))
end
for i,v in {'6872274481', '12552538292', '17750024818', '893973440'} do
    writefile(`vape/CustomModules/{v}.lua`, getfile(v))
end
writefile('vape/Render/lib/utils.lua', game:HttpGet('https://raw.githubusercontent.com/MaxlaserTechAlt/betterinstaller/main/utils.lua'))
writefile('vape/Render/lib/solarapoop.lua', game:HttpGet('https://raw.githubusercontent.com/MaxlaserTechAlt/betterinstaller/main/solara.lua'))
warn('finished installing')
