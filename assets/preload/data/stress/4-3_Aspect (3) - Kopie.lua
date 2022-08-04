function onCreate()
    addHaxeLibrary('Lib', 'openfl')
    runHaxeCode([[
            var newin = Lib.application.createWindow({
                width: 700,
                height: 500,
                title: "test",
                borderless: false
            });
    ]])
    
end