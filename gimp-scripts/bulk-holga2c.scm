

(define (bulk-holga2c pattern)
(let* ((filelist (cadr (file-glob pattern 1))))
(while (not (null? filelist))
	(let* ((filename (car filelist))
	       (outfile "output.jpg")
		(image (car (gimp-file-load RUN-NONINTERACTIVE
				filename filename)))
		(drawable (car (gimp-image-get-active-drawable image))))
		(diana-holga2c image drawable 2 2 2 3 80 TRUE)
		(set! drawable (car (gimp-image-get-active-layer image)))
		(set! outfile (string-append 
			(substring filename 0 (- (string-length filename) 4))
			"-holga.jpg"))
		(gimp-file-save RUN-NONINTERACTIVE
				image drawable outfile outfile)
		(gimp-image-delete image))
	(set! filelist (cdr filelist)))))

