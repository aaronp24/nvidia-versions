validate: .validate-stamp
stuff: .validate-stamp generate-stuff
	@./generate-stuff
upload: .upload-stamp

clean::
	$(RM) .upload-stamp .validate-stamp validate-versions generate-stuff *.o *.hi

.PHONY: validate stuff upload clean

upload_files := nvidia-versions.txt .htaccess

.upload-stamp: .validate-stamp $(upload_files)
	scp $(upload_files) people.freedesktop.org:public_html/
	@touch $@

.validate-stamp: nvidia-versions.txt validate-versions
	@./validate-versions
	@touch $@

validate-versions: NVVersionParser.hs validate-versions.hs
	ghc --make $@

generate-stuff: NVVersionParser.hs generate-stuff.hs URLs.hs
	ghc --make $@

generate-htaccess: NVVersionParser.hs generate-htaccess.hs
	ghc --make $@

.htaccess: generate-htaccess
	./generate-htaccess > $@
