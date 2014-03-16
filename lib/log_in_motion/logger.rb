module LogInMotion
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    #TODO this needs to be refactored to be more DRY
    def debug(message)
      message = "#{Time.now}<=>#{self.class.name}<=>:#{message}\n"
      fileManager = NSFileManager.defaultManager
      filePath = App.documents_path + "/" + Constants::LOG_FILENAME

      if !fileManager.fileExistsAtPath(filePath)
        data = "".dataUsingEncoding(NSUTF8StringEncoding)
        data.writeToFile(filePath, atomically:true)
      end

      #check how big the log file is
      attrs = fileManager.attributesOfItemAtPath(filePath, error: nil)
      fileSize = attrs.fileSize
      if fileSize > 100000
        data = "".dataUsingEncoding(NSUTF8StringEncoding)
        data.writeToFile(filePath, atomically:true)
      end

      data = message.dataUsingEncoding(NSUTF8StringEncoding)
      myHandle = NSFileHandle.fileHandleForWritingAtPath(filePath)
      myHandle.seekToEndOfFile
      myHandle.writeData(data, dataUsingEncoding:NSUTF8StringEncoding)

      puts message
    end
  end

  #instance method
  def debug(message)
    message = "#{Time.now}<=>#{self.class.name}<=>:#{message}\n"
    logMessage(message) if Constants::LOG_LEVEL >= 2
  end

  def error(message)
    message = "!!!!!!#{Time.now}<=>#{self.class.name}<=>:#{message}\n"
    logMessage(message) if Constants::LOGLEVEL >= 1
  end

  private
  def logMessage(message)
    fileManager = NSFileManager.defaultManager
    filePath = App.documents_path + "/" + Constants::LOG_FILENAME

    if !fileManager.fileExistsAtPath(filePath)
      data = "".dataUsingEncoding(NSUTF8StringEncoding)
      data.writeToFile(filePath, atomically:true)
    end

    #check how big the log file is
    attrs = fileManager.attributesOfItemAtPath(filePath, error: nil)
    fileSize = attrs.fileSize
    if fileSize > 100000
      data = "".dataUsingEncoding(NSUTF8StringEncoding)
      data.writeToFile(filePath, atomically:true)
    end

    data = message.dataUsingEncoding(NSUTF8StringEncoding)
    myHandle = NSFileHandle.fileHandleForWritingAtPath(filePath)
    myHandle.seekToEndOfFile
    myHandle.writeData(data, dataUsingEncoding:NSUTF8StringEncoding)

    puts message
  end
end
