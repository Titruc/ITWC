class_name FileLoader

static func getAllFile(folderPath : String):
	var absolutePath : String = GameManager.gamePath.path_join(folderPath)
	var fileGet : Array
	fileGet = DirAccess.get_directories_at(absolutePath)
	if fileGet == []:
		absolutePath = "res://".path_join(folderPath)
		fileGet = DirAccess.get_directories_at(absolutePath)
	return fileGet
		
static func addFileDirectory(path : String, fileName : String):
	if path[-1] == "/":
		return path.path_join(fileName)
	return path + "/" + fileName
	
static func loadFileToRead(filePath : String):
	return FileLoader.openFile(filePath, FileAccess.READ)

static func loadFileToWrite(filePath):
	return FileLoader.openFile(filePath, FileAccess.WRITE)

static func openFile(filePath : String, flag : FileAccess.ModeFlags):
	var absolutePath : String = GameManager.gamePath.path_join(filePath)
	MKUtil.print("path to load [absolutePath : " + absolutePath +", local : " + "res://".path_join(filePath)+"]")
	if FileAccess.file_exists(absolutePath):
		MKUtil.print("'" + absolutePath + "' correctly loaded")
		return FileAccess.open(absolutePath, flag)
	elif FileAccess.file_exists("res://".path_join(filePath)):
		absolutePath = "res://".path_join(filePath)
		MKUtil.print("'" + absolutePath + "' correctly loaded")
		return FileAccess.open(absolutePath, flag)
	else:
		MKUtil.print("Error : the file '" + str(filePath) + "' doesn't exist")
		return null

static func loadJsonToRead(filePath : String):
	var json : JSON = JSON.new()
	var loadedFileAsText = loadFileToRead(filePath)
	if loadedFileAsText != null:
		json.parse(loadedFileAsText.get_as_text())
	else:
		MKUtil.print("Error : cannot load the json file : '" + str(filePath) + "'")
		return null
	return json

static func JsonToDict(json : JSON):
	if json != null:
		return json.data
	else:
		MKUtil.print("ERROR : unable to convert JSON")
	return null

static func getAbsolutePath():
	return OS.get_executable_path().get_base_dir()
	
static func getGameDataPath():
	return "user://"

static func createFolder(path : String):
	if !DirAccess.dir_exists_absolute(path):
		var err = DirAccess.make_dir_recursive_absolute(path)
		if err != OK:
			MKUtil.print("Unable to create folder: " + path + " Error: " + str(err))

static func saveConfigFile(config_file: ConfigFile, file_path: String):
	var folder_path = file_path.get_base_dir()
	createFolder(folder_path)
	var err = config_file.save(file_path)
	if err != OK:
		MKUtil.print("Unable to create config file: " + file_path + " Error: " + str(err))

static func loadITWCdataToRead(filePath : String):
	var ITWCData : ITWCdata = ITWCdata.new()
	var loadedFileAsText = loadFileToRead(filePath)
	if loadedFileAsText != null:
		ITWCData.parse(loadedFileAsText.get_as_text())
	else:
		MKUtil.print("Error : cannot load the ITWCdata file : '" + str(filePath) + "'")
		return null
	return ITWCData

static func loadITWCdata(path : String):
	var absolutePath : String = GameManager.gamePath.path_join(path)
	var data : ITWCdata = ITWCdata.new()
	data.load(absolutePath)
	if data == null:
		absolutePath = "res://".path_join(path)
		data.load(absolutePath)
	return data
