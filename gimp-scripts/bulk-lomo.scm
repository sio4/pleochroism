

(define (bulk-lomo pattern)
(let* ((filelist (cadr (file-glob pattern 1))))
(while (not (null? filelist))
	(let* ((filename (car filelist))
	       (outfile "output.jpg")
	       (postfix "-lomo.jpg")
		(image (car (gimp-file-load RUN-NONINTERACTIVE
				filename filename)))
		(drawable (car (gimp-image-get-active-drawable image))))

		(script-fu-lomo image drawable 1.5 20 20 FALSE)
		(gimp-image-flatten image)

		(set! drawable (car (gimp-image-get-active-layer image)))
		(set! outfile (string-append 
			(substring filename 0 (- (string-length filename) 4))
			postfix))
		(gimp-file-save RUN-NONINTERACTIVE
				image drawable outfile outfile)
		(gimp-image-delete image))
	(set! filelist (cdr filelist)))))

