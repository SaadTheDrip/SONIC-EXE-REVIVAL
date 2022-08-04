-- window resize code by stilic
-- PLEASE CREDIT IF YOU USE IT
-- [vars]
local leWidth

-- [helpers]
local function resizeGame(w, h)
    runHaxeCode('FlxG.resizeGame(' .. w .. ', ' .. h .. ');')
    setPropertyFromClass('openfl.Lib', 'application.window.width', w)
    setPropertyFromClass('openfl.Lib', 'application.window.height', h)
end

local function allowResizing(state)
    setPropertyFromClass('openfl.Lib', 'application.window.resizable', state)
end

local function setCursing(state)
    setPropertyFromClass('ClientPrefs', 'cursing', state)
end

local function centerX(obj)
    setProperty(obj .. '.x', leWidth / 2 - getProperty(obj .. '.width') / 2 - 30)
end

-- [callbacks]
function onCreatePost()
    local balls = 1.35
    leWidth = math.floor(screenWidth / (balls - 0.025))

    resizeGame(leWidth, screenHeight)
    allowResizing(false)
    if not getPropertyFromClass('ClientPrefs', 'cursing') then
        setCursing(true)
    else
        setCursing(false)
        restartSong(true)
    end

    leWidth = math.floor(leWidth * balls)
    local leY = -(balls * 100)

    setProperty('camGame.y', leY)
    setProperty('camGame.width', leWidth)
    setProperty('camGame.height', screenHeight * (balls + 0.5))

    local oy = leY / 1.15

    setProperty('camHUD.height', leY / 1.25)
    setProperty('camHUD.x', -(leWidth / 6.35))
    setProperty('camHUD.y', oy)

    setProperty('camOther.y', oy)

    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup(
                                 'strumLineNotes', i, 'x') + 77)
    end
    local add = 69
    if getPropertyFromClass('PlayState', 'isPixelStage') then add = add - 7 end
    for i = 4, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup(
                                 'strumLineNotes', i, 'x') - add)
    end

    centerX('timeBar')
    centerX('timeTxt')
    centerX('botplayTxt')
    centerX('healthBar')
    centerX('scoreTxt')


end

function opponentNoteHit() setProperty('camZooming', false) end

function onDestroy()
    resizeGame(screenWidth, screenHeight)
    allowResizing(true)
end
