io.stdout:setvbuf("no")						-- Enable Debugging Console with Sublime Text 2

function love.conf(t)
	t.identity = nil						-- The name of the save directory (string)
	t.version = "0.9.1"						-- The LÖVE version this game was made for (string)
	t.console = false						-- Attach a console (boolean, Windows only)
	t.author = "Sherlock & Jasper"			-- The author of the game (string)

	t.window.title = "Asteröids"			-- The window title (string)
	t.window.icon = nil						-- Filepath to an image to use as the window's icon (string)
	t.window.width = 750					-- The window width (number)
	t.window.height = 750					-- The window height (number)
	t.window.borderless = false				-- Remove all border visuals from the window (boolean)
	t.window.resizable = false				-- Let the window be user-resizable (boolean)
	t.window.minwidth = 750					-- Minimum window width if the window is resizable (number)
	t.window.minheight = 750				-- Minimum window height if the window is resizable (number)
	t.window.fullscreen = false				-- Enable fullscreen (boolean)
	t.window.fullscreentype = "normal"		-- Normal fullscreen or desktop fullscreen mode (string)
	t.window.vsync = true					-- Enable vertical sync (boolean)
	t.window.fsaa = 4						-- The number of samples to use with multi-sampled antialiasing (number)
	t.window.display = 0					-- Index of the monitor to show the window in (number)
	t.window.highdpi = false				-- Enable high-dpi mode for the window on a Retina display (boolean). Added in 0.9.1
	t.window.srgb = false					-- Enable sRGB gamma correction when drawing to the screen (boolean). Added in 0.9.1

	t.modules.audio = true					-- Enable the audio module (boolean)
	t.modules.event = true					-- Enable the event module (boolean)
	t.modules.graphics = true				-- Enable the graphics module (boolean)
	t.modules.image = true					-- Enable the image module (boolean)
	t.modules.joystick = true				-- Enable the joystick module (boolean)
	t.modules.keyboard = true				-- Enable the keyboard module (boolean)
	t.modules.math = true					-- Enable the math module (boolean)
	t.modules.mouse = true					-- Enable the mouse module (boolean)
	t.modules.physics = true				-- Enable the physics module (boolean)
	t.modules.sound = true					-- Enable the sound module (boolean)
	t.modules.system = true					-- Enable the system module (boolean)
	t.modules.timer = true					-- Enable the timer module (boolean)
	t.modules.window = true					-- Enable the window module (boolean)
	t.modules.thread = true					-- Enable the thread module (boolean)
end