//
//  NotaCreditoGiroViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoGiroViewCellController: UITableViewCell {

    @IBOutlet var lblTipoGiro: UILabel!
    @IBOutlet var lblNombreBeneficiario: UILabel!
    @IBOutlet var lblIdGiroAsociado: UILabel!
    @IBOutlet var lblConsecutivoNotaCredito: UILabel!
    
    
    @IBOutlet var txtTipoGiro: UILabel!
    @IBOutlet var txtNombreBeneficiario: UILabel!
    @IBOutlet var txtIdGiroAsociado: UILabel!
    @IBOutlet var txtConsecutivoNotaCredito: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
