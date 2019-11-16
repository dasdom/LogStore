//  Created by dasdom on 03.11.19.
//  
//

import UIKit
import CoreMotion

public class TriggerWindow : UIWindow {
  
  let motionManager = CMMotionManager()
  
  public override init(frame: CGRect) {

    super.init(frame: frame)

    LogStore.setupLog()
    
    motionManager.startAccelerometerUpdates(to: OperationQueue.main) {
      [unowned self] data, error in

      guard let data = data else { return }
      if data.acceleration.x < -5 {
        print("x acceleration: \(data.acceleration.x)")
        self.presentLog()
      }
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }

  func presentLog() {
    let logViewController = LogViewController()
    let visibleViewController =
      self.visibleViewController(from: self.rootViewController)
    visibleViewController?.present(
      logViewController, animated: true, completion: nil)
  }
  
  func visibleViewController(
    from viewController: UIViewController?) -> UIViewController? {
    
    guard let viewController = viewController else {
      return nil
    }
    if let navigationController =
      viewController as? UINavigationController {
      
      return visibleViewController(
        from: navigationController.topViewController)
    }
    if let tabBarController =
      viewController as? UITabBarController {
      
      return visibleViewController(
        from: tabBarController.selectedViewController)
    }
    if let presentedViewController =
      viewController.presentingViewController {
      
      return visibleViewController(
        from: presentedViewController)
    }
    
    return viewController
  }
}

