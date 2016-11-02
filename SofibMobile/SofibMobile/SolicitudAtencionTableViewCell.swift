//
//  SolicitudAtencionTableViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/1/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class SolicitudAtencionTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var solicitudAtencionTxt: UILabel!
    
    @IBOutlet weak var identificacionTxt: UILabel!
    @IBOutlet weak var nombreTxt: UILabel!
    @IBOutlet weak var convenioTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
