//
//  HospitalSpecialtiesViewController.swift
//  youMed
//
//  Created by thinhdang on 12/10/20.
//

import UIKit
import RealmSwift

class HospitalSpecialtiesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var listSpec = List<HospitalSpecialty>()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listSpec.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : SpecialistCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "specialistCell", for: indexPath) as! SpecialistCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true

        
        if indexPath.row < listSpec.count {
           cell.data = listSpec[indexPath.row]
        } else {
            // Handle non-existing object here
            print("hihi")
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationTitle(title: "SPECIALTIES")
        collectionView.delegate = self
        collectionView.dataSource = self
        loadInformation()
        collectionView.register(UINib(nibName: "SpecialistCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "specialistCell")
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

//extension HospitalSpecialtiesViewController : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 80, height: 80)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        16
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
//}

