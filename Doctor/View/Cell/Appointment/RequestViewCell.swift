//
//  RequestViewCell.swift
//  youMed
//
//  Created by thinhdang on 11/7/20.
//

import UIKit

class RequestViewCell: UITableViewCell {

    @IBOutlet weak var imgAva: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbIssue: UILabel!
    @IBOutlet weak var lbDateBook: UILabel!
    
    let formatter = DateFormatter()
    var returnDate = ""

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
