.DEFAULT_GOAL := annoy

install:
	@touch .env
	@echo "\n\n#$$(date)\n#export GOOGLE_APPLICATION_CREDENTIALS=?\n" >> .env
	@$(MAKE) node-modules
	@echo "***************************************************\n\nOPEN .ENV AND CHANGE THE VARIABLE TO RUN YOUR ENVIRONMENT\n\nYOU CAN COMMENT OUT LINES WITH # AND HAVE MULTIPLE ENVIRONMENTS\n\nBEFORE RUNNING npm start YOU NEED TO RUN source .env\n\n***************************************************"

node-modules: package.json
	npm install

start: package.json
	npm start

annoy:
	killall node|true && killall nodemon|true && . .env && $(MAKE) start