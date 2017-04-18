-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local storage = require("storage")
local w = require("widget")
function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
	
	-- create some text
	local title = display.newText( "Bully Buster", display.contentCenterX, 75, storage.headerFont, 50 )
	title:setFillColor( 0 )	-- black
	--local 
	--[[local newTextParams = { text = "Loaded by the first tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
						x = display.contentCenterX + 10, 
						y = title.y + 215, 
						width = 310, height = 310, 
						font = storage.bodyFont, fontSize = 14, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black]]--
	local formButtonOptions = {
		shape="roundedRect",
		x=display.contentCenterX,
		y=display.contentCenterY *0.9,
		width=200,
		height=75,
		cornerRadius=15,
		label="Report",
		font=storage.buttonFont,
		fontSize=25,
		labelColor = {
			default = {0, 0, 0},
			over = {1, 0, 0}
		},
		fillColor = {
			default = {0.85, 0.9, 1},
			over = {0.7, 0.7, 0.8}
		},
		onEvent = function (event) if("ended" == event.phase) then composer.gotoScene("typeOfAttack") end end
	}
	local formButtonShadOp = {}
	formButtonShadOp.shape = "roundedRect"
	formButtonShadOp.cornerRadius = 15
	formButtonShadOp.x = formButtonOptions.x
	formButtonShadOp.y = formButtonOptions.y
	formButtonShadOp.width = formButtonOptions.width + 20
	formButtonShadOp.height = formButtonOptions.height + 20
	formButtonShadOp.label = ""
	formButtonShadOp.fillColor = {
		default = {0.92, 0.95, 1},
		over = {0.92, 0.95, 1}
	}
	local formButtonShad2Op = {}
	formButtonShad2Op.shape = "roundedRect"
	formButtonShad2Op.cornerRadius = 15
	formButtonShad2Op.x = formButtonOptions.x
	formButtonShad2Op.y = formButtonOptions.y
	formButtonShad2Op.width = formButtonOptions.width + 35
	formButtonShad2Op.height = formButtonOptions.height + 35
	formButtonShad2Op.label = ""
	formButtonShad2Op.fillColor = {
		default = {0.95, 0.99, 1},
		over = {0.95, 0.99, 1}
	}
	local formButtonShad2 = w.newButton(formButtonShad2Op)
	local formButtonShad = w.newButton(formButtonShadOp)
	local formButton = w.newButton(formButtonOptions)
	local infoButtonOptions = {
		shape="roundedRect",
		x=display.contentCenterX,
		y=display.contentCenterY *1.5,
		width=200,
		height=75,
		cornerRadius=15,
		label="Information",
		font=storage.buttonFont,
		fontSize=25,
		labelColor = {
			default = {0, 0, 0},
			over = {1, 0, 0}
		},
		fillColor = {
			default = {0.85, 1, 0.9},
			over = {0.7, 0.8, 0.7}
		},
		onEvent = function (event) if("ended" == event.phase) then composer.gotoScene("info") end end
	}
	local infoButtonShadOp = {}
	infoButtonShadOp.shape = "roundedRect"
	infoButtonShadOp.cornerRadius = 15
	infoButtonShadOp.x = infoButtonOptions.x
	infoButtonShadOp.y = infoButtonOptions.y
	infoButtonShadOp.width = infoButtonOptions.width + 20
	infoButtonShadOp.height = infoButtonOptions.height + 20
	infoButtonShadOp.label = ""
	infoButtonShadOp.fillColor = {
		default = {0.90, 1, 0.92},
		over = {0.90, 1, 0.92}
	}
	local infoButtonShad2Op = {}
	infoButtonShad2Op.shape = "roundedRect"
	infoButtonShad2Op.cornerRadius = 15
	infoButtonShad2Op.x = infoButtonOptions.x
	infoButtonShad2Op.y = infoButtonOptions.y
	infoButtonShad2Op.width = infoButtonOptions.width + 35
	infoButtonShad2Op.height = infoButtonOptions.height + 35
	infoButtonShad2Op.label = ""
	infoButtonShad2Op.fillColor = {
		default = {0.95, 1, 0.99},
		over = {0.95, 1, 0.99}
	}
	local infoButtonShad2 = w.newButton(infoButtonShad2Op)
	local infoButtonShad = w.newButton(infoButtonShadOp)
	local infoButton = w.newButton(infoButtonOptions)
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert(formButtonShad2)
	sceneGroup:insert(formButtonShad)
	sceneGroup:insert(formButton)
	sceneGroup:insert(infoButtonShad2)
	sceneGroup:insert(infoButtonShad)
	sceneGroup:insert(infoButton)
	sceneGroup:insert( title )
	--sceneGroup:insert( summary )
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
