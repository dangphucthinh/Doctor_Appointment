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
    
    var yourArray = [String]()
    let option =  Options()

    
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
        
        
    }
    

   func loadData(){
    // Do any additional setup after loading the view.
    mainDropDown.optionArray = option.disease
    symtom1.optionArray = option.disease
    symptom2.optionArray = option.disease
    symptom4.optionArray = option.disease

    mainDropDown.didSelect{(selectedText , index , id) in
//            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index) \n Id: \(id)"

        print(selectedText)
        print(index)
        self.yourArray.append(selectedText)
        
        print(self.yourArray)
       
    }
    
    symtom1.didSelect{(selectedText , index , id) in
//            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index) \n Id: \(id)"

        print(selectedText)
        print(index)
        self.yourArray.append(selectedText)
        
        print(self.yourArray)
        
    }
    symptom2.didSelect{(selectedText , index , id) in
//            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index) \n Id: \(id)"

        print(selectedText)
        print(index)
        self.yourArray.append(selectedText)
        
        print(self.yourArray)
      
    }
    symptom4.didSelect{(selectedText , index , id) in
//            self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index) \n Id: \(id)"

        print(selectedText)
        print(index)
        self.yourArray.append(selectedText)
        
        print(self.yourArray)
        
    }
    
    print(self.yourArray)
   }

    @IBAction func sendData(_ sender: Any) {
        BaseClient.shared.Prediction(data: self.yourArray,
                                     completion: { [self]
                                 (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                          
                                 if(isSuccess!){
                                   let rs = value as! ResponsePrediction
                                    
                                    self.result.text = (rs.data?.disease)!
                                    
    }
                                     })
    }
}
