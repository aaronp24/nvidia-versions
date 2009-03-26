validate: .validate-stamp
upload: .upload-stamp

clean::
	$(RM) .upload-stamp .validate-stamp validate-versions *.o *.hi

.PHONY: upload clean validate

upload_files := nvidia-versions.txt

.upload-stamp: .validate-stamp $(upload_files)
	scp $(upload_files) people.freedesktop.org:public_html/
	@touch $@

.validate-stamp: nvidia-versions.txt validate-versions
	@./validate-versions
	@touch $@

validate-versions: NVVersionParser.hs validate-versions.hs
	ghc --make $@
