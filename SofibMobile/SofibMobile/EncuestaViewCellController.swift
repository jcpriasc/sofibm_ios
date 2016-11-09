//
//  EncuestaViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class EncuestaViewCellController: UITableViewCell {

    @IBOutlet var lblObservacion: UILabel!
    @IBOutlet var lblRespuesta: UILabel!
    @IBOutlet var lblPregunta: UILabel!
    
    @IBOutlet var txtPregunta: UILabel!
    @IBOutlet var txtRespuesta: UILabel!
    @IBOutlet var txtObservacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
