.PHONY: data download

data: download
	papermill controller-parse.ipynb /dev/null
	papermill ctsa-list-cleanup.ipynb /dev/null
	papermill dedupe.ipynb /dev/null

download:
	bash download-official-gsheet.sh
