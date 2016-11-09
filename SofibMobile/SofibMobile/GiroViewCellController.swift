//
//  GiroViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroViewCellController: UITableViewCell {

    
    
    @IBOutlet var lblidentificacion: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblBeneficiario: UILabel!
    @IBOutlet var lblIdentificacionBeneficiario: UILabel!
    @IBOutlet var lblTipoGiro: UILabel!
    
    
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtBeneficiario: UILabel!
    @IBOutlet var txtIdentificacionBeneficiario: UILabel!
    @IBOutlet var txtTipoGiro: UILabel!
    @IBOutlet var txtIdentificacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
