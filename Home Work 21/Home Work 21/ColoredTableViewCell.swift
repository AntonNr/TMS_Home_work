//
//  TableViewCell.swift
//  Home Work 21
//
//  Created by Антон Нарижный on 31.08.22.
//

import Foundation
import UIKit

class ColoredTableViewCell: UITableViewCell {
    
    @IBOutlet var coloredButton: UIButton!
    
    var recolored: (() -> Void)?
    
    @IBAction func recoloredButton() {
        recolored?()
    }
    
}
