//
//  FacturaViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaViewCellController: UITableViewCell {

    @IBOutlet var lblValorTotalFactura: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblFechaExpedicion: UILabel!
    @IBOutlet var lblNumeroFactura: UILabel!
    
    
    @IBOutlet var txtValorTotalFactura: UILabel!
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtFechaExpedicion: UILabel!
    @IBOutlet var txtNumeroFactura: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
