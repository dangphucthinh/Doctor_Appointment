//
//  ViewController.swift
//  youMed
//
//  Created by thinhdang on 11/11/20.
//

import UIKit
import iOSDropDown

class AdviserViewController: UIViewController {

    @IBOutlet weak var mainDropDown: DropDown!
  
    @IBOutlet weak var symtom1: DropDown!
    @IBOutlet weak var symptom2: DropDown!
    @IBOutlet weak var symptom4: DropDown!
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var specialty: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var ContentDiseaseView: UIView!
    @IBOutlet weak var ContentSpecVIew: UIView!
    
    var specialText = ""
    
    var ListDisease = [String]()
    let option =  Options()
    let ListSpec = [String]()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       self.showNavigationBar(animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarLogo(title: "ADVISER", controlEvents: .touchUpInside,  ForAction:{() -> Void in
            // Search action
            print("Search")
        })
      loadData()
        btnAction.isHidden = true
        ContentDiseaseView.roundedView(cornerRadius: 15, borderWidth: 1, borderCorlor: .init(red: 0, green: 0, blue: 255, alpha: 0.5))
        ContentSpecVIew.roundedView(cornerRadius: 15, borderWidth: 1, borderCorlor: .init(red: 0, green: 0, blue: 255, alpha: 0.5))
        ContentDiseaseView.isHidden = true
        ContentSpecVIew.isHidden = true
    }
    

   func loadData(){
    // Do any additional setup after loading the view.
   // mainDropDown.optionArray = option.disease_value
    mainDropDown.optionArray = option.disease_key
    symtom1.optionArray = option.disease_key
    symptom2.optionArray = option.disease_key
    symptom4.optionArray = option.disease_key

    mainDropDown.didSelect{(selectedText , index , id) in

        print(selectedText)
        print(index)
        self.ListDisease.append(selectedText)
    }
    
    symtom1.didSelect{(selectedText , index , id) in
       
        for (i, v) in self.option.disease_value.enumerated() {
            if i == index{
                self.ListDisease.append(v)
            }
        }
        print(self.ListDisease)
    }
    symptom2.didSelect{(selectedText , index , id) in
           
        for (i, v) in self.option.disease_value.enumerated() {
            if i == index{
                self.ListDisease.append(v)
            }
        }
    }
    symptom4.didSelect{(selectedText , index , id) in
        for (i, v) in self.option.disease_value.enumerated() {
            if i == index{
                self.ListDisease.append(v)
            }
        }
    }
}
    
    @IBAction func moveToListDoctor(_ sender: Any){
        let controller: DoctorViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorViewControllerId) as! DoctorViewController
        controller.isAdvise = true
        controller.spec = specialText
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @IBAction func sendData(_ sender: Any) {
        BaseClient.shared.Prediction(data: self.ListDisease,
                                     completion: { [self]
                                 (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                          
                                 if(isSuccess!){
                                   let rs = value as! ResponsePrediction
                                    print(rs.data as Any)
                                    if rs.status == 0 {
                                        self.result.text = "You are diagnosed with \((rs.data?.disease?.uppercased())!)"
                                        self.specialText = rs.data?.spec.randomElement()! ?? ""
                                        self.specialty.text = "You should make appointment with doctor who has their specialty is \(specialText.uppercased())"
                                        btnAction.isHidden = false
                                        ContentDiseaseView.isHidden = false
                                        ContentSpecVIew.isHidden = false
                                    }
                                    if rs.status == 1 {
                                        
                                    }
                                }
                         })
        ListDisease.removeAll()
        symtom1.text = ""
        symptom2.text = ""
        symptom4.text = ""
        mainDropDown.text = ""
    }
}
