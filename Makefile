validate: .validate-stamp
upload: .upload-stamp

clean::
	$(RM) .upload-stamp .validate-stamp

.PHONY: upload clean validate

upload_files := nvidia-versions.txt

.upload-stamp: .validate-stamp $(upload_files)
	scp $(upload_files) people.freedesktop.org:public_html/
	@touch .upload-stamp

.validate-stamp: nvidia-versions.txt
	@touch .validate-stamp
