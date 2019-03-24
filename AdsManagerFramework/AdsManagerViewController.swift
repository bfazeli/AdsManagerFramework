//
//  AdsManagerViewController.swift
//  AdsManagerFramework
//
//  Created by Bijan Fazeli on 3/24/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import UIKit

public enum AdProvider {
    case facebook(String)
    case google(String)
}

public final class AdsManagerViewController: UIViewController {
    fileprivate var adManager: AdManager?
    
    open var provider: AdProvider = .google("Google") {
        didSet {
            guard let adManager = self.adManager else {
                return
            }
            
            adManager.provider = provider
        }
    }
    
    public init(with apiKeys: [String: String]) {
        super.init(nibName: nil, bundle: nil)
        self.adManager = AdManager(with: self, apiKeys)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let adManager = self.adManager else {
            return
        }
        
        createUI()
        adManager.update()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func createUI() {
        guard let adManager = self.adManager else {
            return
        }
        self.view.layer.addSublayer(previewLayer)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
