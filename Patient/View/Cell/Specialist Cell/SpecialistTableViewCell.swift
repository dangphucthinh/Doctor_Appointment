//
//  SpecialistTableViewCell.swift
//  youMed
//
//  Created by thinhdang on 10/24/20.
//

import UIKit
import RealmSwift

class SpecialistTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnMore : UIButton!
    
    var listSpec = List<HospitalSpecialty>()
    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }

        set {
            collectionView.contentOffset.x = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "SpecialistCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadInformation(){
        BaseClient.shared.GetListSpecialty(completion: { [self]
                                        (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                                 
                                        if(isSuccess!){
                                          let user = value as! ResponseHospitalSpecialty
                                          
                                            let listTemp = user.data as List<HospitalSpecialty>
                                            
                                            for item in listTemp{
                                                self.listSpec.append(item)
                                            }
                                            DispatchQueue.main.async {
                                                // Run on main thread
                                               self.collectionView.reloadData()
                                               self.collectionView!.collectionViewLayout.invalidateLayout()
                                               self.collectionView!.layoutSubviews()
                                            }
                                      }
                                })
    }

}

extension SpecialistTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SpecialistCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
//        switch indexPath.row {
//        case 0:
//            cell.imageView!.image = UIImage(named: "stomach")
//            cell.label.text = "Stomach"
//        default:
//            cell.imageView.image = UIImage(named: "stomach")
//            cell.label.text = "Stomach"
//        }
        
        if indexPath.row < listSpec.count {
           cell.data = listSpec[indexPath.row]
        } else {
            // Handle non-existing object here
            print("hihi")
        }
        
        return cell
    }

    
}

extension SpecialistTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
