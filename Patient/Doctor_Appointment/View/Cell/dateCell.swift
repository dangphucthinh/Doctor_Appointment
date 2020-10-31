//
//  dateCell.swift
//  Doctor_Appointment
//
//  Created by DUY on 9/26/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class dateCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - 1, to: today) }  // use `flatMap` in Xcode versions before 9.3
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"

        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dateCollectionViewCell
            cell.label.text = "Mon"
            cell.button.setTitle(formatter.string(from: days[0]), for: .normal)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dateCollectionViewCell
            cell.label.text = "Tue"
            cell.button.setTitle(formatter.string(from: days[1]), for: .normal)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dateCollectionViewCell
            cell.label.text = "Wed"
            cell.button.setTitle(formatter.string(from: days[2]), for: .normal)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dateCollectionViewCell
            cell.label.text = "Thu"
            cell.button.setTitle(formatter.string(from: days[3]), for: .normal)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dateCollectionViewCell
            cell.label.text = "Fri"
            cell.button.setTitle(formatter.string(from: days[4]), for: .normal)
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dateCollectionViewCell
            cell.label.text = "Sat"
            cell.button.setTitle(formatter.string(from: days[5]), for: .normal)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dateCollectionViewCell
            return cell
        }
    }
        
}
