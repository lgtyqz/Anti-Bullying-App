-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local s = require('storage')
local w = require('widget')
local info = require('infotext')
local numOfScreens = table.getn(info)
local currentScreen = 1
local contentOffset = 0
local function btnHandler_1(event)

	if (event.phase == "ended" and currentScreen > 1) then
		currentScreen = currentScreen - 1
		transition.to(content, {time = 500, transition=easing.outQuad, x=-(currentScreen - 1) * display.contentWidth})
	end

end

local function btnHandler_2(event)

	if (event.phase == "ended" and currentScreen < numOfScreens) then
		currentScreen = currentScreen + 1
		print(-currentScreen * display.contentWidth)
		transition.to(content, {time = 500, transition=easing.outQuad, x=-(currentScreen - 1) * display.contentWidth})
	end

end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	-- outside of 'create'

	-- starting here - inside of create
	local back = display.newRect(display.contentWidth*0.5, display.contentHeight*0.5, display.contentWidth*2, display.contentHeight*2 )
	local title = display.newText("Information", display.contentWidth*0.5, display.contentHeight*0.1, s.headerFont, 26)
	title:setFillColor(0, 0, 0)

	local subtitle = display.newText("Helping to further inform you on bullying.", display.contentWidth*0.5, display.contentHeight*0.1625, s.bodyFont, 16)
	subtitle:setFillColor(0, 0, 0)

	--[[local newTextParams = {
		text = "Loaded by the first tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
		x = display.contentWidth*0.5, 
		y = display.contentHeight*0.6,
		width = 310, height = 310, 
		font = s.bodyFont, fontSize = 18, 
		align = "center"
	}
	local infoBlock = display.newText(newTextParams)]]--
	--infoBlock:setFillColor(0, 0, 0)
	--infoBlock.anchorY = display.contentHeight*0.3
	local globOp = {
			label = "Next",
			labelColor = {
				default = {0, 0, 0},
				over = {1, 0, 0},
			},
			onEvent = btnHandler_2,
			shape = "roundedRect",
			width = display.contentWidth*0.3,
			height = 40,
			cornerRadius = 2,
			strokeColor = { default={0.92,0.95,1,1}, over={0.92, 0.95, 1, 1} },
			fillColor = { default={0.85,0.9,1,1}, over={0.7,0.7,0.8,1} },
			strokeWidth = 10,
			font=s.buttonFont,
		fontSize=15,
		}

	local btn_1 = w.newButton(
		{
			label = "Prev.",
			labelColor = {
				default = {0, 0, 0},
				over = {1, 0, 0},
			},
			onEvent = btnHandler_1,
			shape = "roundedRect",
			width = display.contentWidth*0.3,
			height = 40,
			cornerRadius = 2,
			strokeColor = { default={0.92,0.95,1,1}, over={0.92, 0.95, 1, 1} },
			fillColor = { default={0.85,0.9,1,1}, over={0.7,0.7,0.8,1} },
			strokeWidth = 10,
			font=s.buttonFont,
		fontSize=15,
		}
	)

	local btn_2 = w.newButton(
		{
			label = "Next",
			labelColor = {
				default = {0, 0, 0},
				over = {1, 0, 0},
			},
			onEvent = btnHandler_2,
			shape = "roundedRect",
			width = display.contentWidth*0.3,
			height = 40,
			cornerRadius = 2,
			strokeColor = { default={0.92,0.95,1,1}, over={0.92, 0.95, 1, 1} },
			fillColor = { default={0.85,0.9,1,1}, over={0.7,0.7,0.8,1} },
			strokeWidth = 10,
			font=s.buttonFont,
		fontSize=15,
		}
	)
	local backButOp = deepcopy(globOp)
	print(backButOp)
	btn_2.x = display.contentWidth*0.8
	btn_2.y = display.contentHeight*0.92
	backButOp.label = "Back"
	backButOp.x = display.contentWidth/2
	backButOp.y = display.contentHeight*0.92
	backButOp.onEvent = function (event) if("ended" == event.phase) then composer.gotoScene("home") end end
	backButOp = w.newButton(backButOp)
	btn_1.x = display.contentWidth*0.2
	btn_1.y = display.contentHeight*0.92
	content = display.newGroup()
	sceneGroup:insert(back)
	local W = display.contentWidth
	local H = display.contentHeight
	for i = 1, numOfScreens do
		T = display.newText(content, info[i].title, W * (i - 0.5), H * 0.25, s.headerFont, 26)
		T:setFillColor(0, 0, 0)
		if info[i].subtitle ~= nil then
			SUB = display.newText(content, info[i].subtitle, W * (i - 0.5), H * 0.3125, s.headerFont, 18)
			SUB:setFillColor(0, 0, 0)
		end
		if info[i].text ~= nil then
			if info[i].image == nil then
				TXT = display.newText(content, info[i].text, W * (i - 0.5), H * 0.35, W * 0.95, H * 0.45, s.bodyFont, 14)
				TXT.anchorY = 0
				TXT:setFillColor(0, 0, 0)
			else
				IMG = display.newImage(content, info[i].image, W * (i - 0.5), H * 0.45)
				scalar = (H * 0.2) / IMG.height
				IMG.height = IMG.height * scalar
				IMG.width = IMG.width * scalar
				TXT = display.newText(content, info[i].text, W * (i - 0.5), H * 0.55, W * 0.95, H * 0.35, s.bodyFont, 14)
				TXT.anchorY = 0
				TXT:setFillColor(0, 0, 0)
			end
		end
	end
	sceneGroup:insert(title)
	sceneGroup:insert(subtitle)
	L = display.newLine(sceneGroup, display.contentWidth * 0.05, display.contentHeight * 0.2,
					display.contentWidth * 0.95, display.contentHeight * 0.2)
	L:setStrokeColor(0, 0, 0)
	sceneGroup:insert(btn_1)
	sceneGroup:insert(btn_2)
	sceneGroup:insert(backButOp)
	sceneGroup:insert(content)
--
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	-- display.remove(content)
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
