class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    home_controller = UINavigationController.alloc.initWithRootViewController(Table.new)
    @window.rootViewController = home_controller
    @window.rootViewController.wantsFullScreenLayout = false
    true
  end
end
