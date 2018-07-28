/*
 bug workaround:
 version: Swift Playground 2.1 for iPad
 https://makeapppie.com/2018/05/07/bug-workaround-swift-playgrounds-for-ipad/
 */

import UIKit

// usage: StartVC(viewController)
public class StartVC: UIViewController {
    
    // view controller to be presented
    var vc: UIViewController!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        present(vc, animated: false)    // bug workaround
    }
    
    
    public init(_ vc:UIViewController){
        self.vc = vc
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
