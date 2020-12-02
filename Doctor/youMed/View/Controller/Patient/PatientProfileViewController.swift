//
//  PatientProfileViewController.swift
//  youMed
//
//  Created by thinhdang on 12/2/20.
//

import UIKit

class PatientProfileViewController: UIViewController {

    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var lbName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ContentView.roundedView(cornerRadius: 10, borderWidth: 3, borderCorlor: .init(red: 0, green: 0, blue: 0, alpha: 0))
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
