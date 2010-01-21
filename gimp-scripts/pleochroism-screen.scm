(define (script-fu-pc-screen image adraw opacity flatten)
(let* ((img (car (gimp-drawable-get-image adraw)))
	(screenlayer (car (gimp-layer-copy adraw FALSE))))

	; init
	(gimp-context-push)
	(gimp-image-undo-group-start img)
	(gimp-context-set-foreground '(0 0 0))
	(gimp-context-set-background '(255 255 255))


	; work
	(gimp-image-add-layer img screenlayer -1)
	(gimp-drawable-set-name screenlayer "Screen")
	(gimp-layer-set-mode screenlayer SCREEN-MODE)
	(gimp-layer-set-opacity screenlayer opacity)

	(if (= flatten TRUE)
	(gimp-image-flatten img)
	)


	; tidy up
	(gimp-image-undo-group-end img)
	(gimp-displays-flush)
	(gimp-context-pop)
)
)

(script-fu-register "script-fu-pc-screen"
		_"_Screen..."
		"Screening on image. for brightness control.
http://plugin/"
		"Yonghwan SO <scinix@gmail.com>"
		"Yonghwan SO"
		"2010-01-20"
		"*"
		SF-IMAGE	"Input image"	0
		SF-DRAWABLE	"Input drawable"	0
		SF-ADJUSTMENT	_"Opacity" '(100 0 100 1 5 0 0)
		SF-TOGGLE	"Flatten" FALSE
)

(script-fu-menu-register "script-fu-pc-screen" _"<Image>/Filters/Pleochroism")
