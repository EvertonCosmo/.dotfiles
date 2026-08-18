hl.monitor({
	output = "eDP-1",
	mode = "highres",
	position = "auto",
	scale = 1,
})

hl.monitor({
	output = "DP-3",
	mode = "highres",
	position = "0x0",
	scale = 1,
	bitdepth = 8,
	vrr = 1, -- 0 -off, 1 - on 2 - fullscreen only, 3 - game or video content
})
