//
//  UserHeaderView.swift
//  youMed
//
//  Created by Duy Dinh on 10/29/20.
//

import UIKit
import SDWebImage

class UserHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var name = BaseClient.shared.fullName
    var avatar = BaseClient.shared.avatar
    var id = BaseClient.shared.userId
    
    func LoadInform(UserId :String){
            BaseClient.shared.GetUserInfo(UserId: UserId,
                                          completion: { [self]
                  (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                  
                  if(isSuccess!){
                    let user = value as! ResponseUser
                    
                    nameLabel.text = name!.uppercased()
                    
                    let ava: String? = user.data?.avatar
                    let url = URL.init(string:"\(ava ?? "No image found")")
        
                    self.imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "User"))
                  }
                
          })
        }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.backgroundColor = .systemBlue
        LoadInform(UserId: id!)
      
       
    }
}
