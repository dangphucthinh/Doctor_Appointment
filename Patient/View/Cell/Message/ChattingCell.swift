//
//  ChattingCell.swift
//  youMed
//
//  Created by thinhdang on 11/14/20.
//

import UIKit

class ChattingCell: UITableViewCell {


    enum  MessageType {
        case incoming
        case outgoing
    }
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var viewContainer: DesignableView!
    @IBOutlet weak var txtMessage: DesignableTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setMessageType(type: MessageType){
        if type == .incoming{
            stackView.alignment = .leading
            viewContainer.layer.backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
        }
        else if type == .outgoing{
            stackView.alignment = .trailing
            viewContainer.layer.backgroundColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
        }
    }
}
