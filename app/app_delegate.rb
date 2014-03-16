LOG_IN_MOTION_FILENAME = 'logger.txt'
LOG_IN_MOTION_LEVEL = 2

class AppDelegate
  include LogInMotion

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    debug "hello world!"
    true
  end
end
