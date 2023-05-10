//
//  ViewController.swift
//  ScelatonView-Vivek-PHN-deve
//
//  Created by Mac on 10/05/23.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.showGradientSkeleton(usingGradient: .init(baseColor: .gray) , transition: .crossDissolve(0.25))
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.view.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor(named: "lightPurple") ?? UIColor.red), animation: .none, transition: .crossDissolve(0.25))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.view.hideSkeleton()
        }
    }

}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension ViewController : SkeletonTableViewDataSource{
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
}
