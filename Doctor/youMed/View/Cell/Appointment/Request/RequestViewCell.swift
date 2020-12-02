//
//  RequestViewCell.swift
//  youMed
//
//  Created by thinhdang on 11/7/20.
//

import UIKit

protocol ResquestAcceptCellDelegate : AnyObject {
    func accepted(_ data: Appointment)
    
}

protocol RequestDenyCellDelegate : AnyObject {
    func denied(_ data: Int)
}
class RequestViewCell: UITableViewCell {
    
    weak var delegateAccept: ResquestAcceptCellDelegate?
    weak var delegateDeny: RequestDenyCellDelegate?

    @IBOutlet weak var imgAva: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbIssue: UILabel!
    @IBOutlet weak var lbDateBook: UILabel!
    
    let formatter = DateFormatter()
    var returnDate = ""
    var id: Int?
    
    var data: Appointment? {
            didSet {
                guard let data = data else { return }
                
          

                    self.imgAva.sd_setImage(with: URL(string: "\(data.patientAvatar ?? "Not found")"), placeholderImage: UIImage(named: "no_image_poster"))
                    
                    lbName.text = String(format: " \(data.patientName ?? "Not found")")
                    lbIssue.text = String(format: " \(data.issue ?? "Not found")")
                    lbDateBook.text = dateToSQLDate(data.meetingTime!)
   
            }
        }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     
        
    }
    
  
    func commonInit(_ name: String, _ issue: String, _ date: String){
        lbName.text = name
        lbIssue.text = issue
        lbDateBook.text = dateToSQLDate(date)            
    }
    
    @IBAction func acceptBtn(_ sender: Any) {
        print("cc")
        delegateAccept?.accepted(data!)
    }
    
    @IBAction func denyBtn(_ sender: Any) {
        print("ececec")
        delegateDeny?.denied(id!)
    }
    private func dateToSQLDate(_ DateString: String) -> String {
  
        let dateFormatter = DateFormatter()
       // dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let string = String(DateString)
        if let date = dateFormatter.date(from: string) {
        dateFormatter.dateFormat = "MM/dd/yyyy"
            returnDate = dateFormatter.string(from: date)
        }
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        return returnDate
    }
}
