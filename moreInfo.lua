-- for continuing report on bully after selecting
-- the type of attack

-- to upload images
-- https://docs.coronalabs.com/daily/api/library/media/selectPhoto.html

-- more
-- https://coronalabs.com/blog/2013/11/05/tutorial-captureselect-photo-and-video/

local composer = require( "composer" )
local scene = composer.newScene()
local s = require('storage')
local w = require('widget')

local defaultBox
local function textListener( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        print( event.target.text )
 
    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end
end

local function btnHandler_1(event)

	if (event.phase == "ended") then
		
	end

end

local function btnHandler_2(event)

	if (event.phase == "ended") then
		
		print('next was pressed!')
		
	end

end

function scene:create( event )
	local sceneGroup = self.view
	
	local back = display.newRect(display.contentWidth*0.5, display.contentHeight*0.5, display.contentWidth*2, display.contentHeight*2 )
	local title = display.newText("Report Information", display.contentWidth*0.5, display.contentHeight*0.1, s.headerFont, 32)
	title:setFillColor(0, 0, 0)

	local subtitle = display.newText("Now, we need more", display.contentWidth*0.5, display.contentHeight*0.2, s.headerFont, 18)
	subtitle:setFillColor(0, 0, 0)
	local subtitleCont = display.newText("information on the issue.", display.contentWidth*0.5, display.contentHeight*0.25, s.headerFont, 18)
	subtitleCont:setFillColor(0, 0, 0)
	
	defaultBox = native.newTextBox(display.contentWidth*0.5, display.contentHeight*0.6, display.contentWidth*0.8, display.contentHeight*0.6)
	defaultBox.text = "This is line 1.\nAnd this is line2"
	defaultBox.isEditable = true
	defaultBox:addEventListener( "userInput", textListener )
	defaultBox.size = 32

	sceneGroup:insert(back)
	sceneGroup:insert(title)
	sceneGroup:insert(subtitle)
	sceneGroup:insert(defaultBox)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	
	elseif phase == "did" then
		prevScene = composer.getSceneName(previous)
	end	
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene
