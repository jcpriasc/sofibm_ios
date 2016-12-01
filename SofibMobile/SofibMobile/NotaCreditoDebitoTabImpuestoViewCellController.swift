//
//  NotaCreditoDebitoTabImpuestoViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoDebitoTabImpuestoViewCellController: UITableViewCell {

    
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblNumeroOrden: UILabel!
    @IBOutlet var lblServicio: UILabel!
    @IBOutlet var lblValorServicio: UILabel!
    
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtNumeroOrden: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtValorServicio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
        lblNumeroOrden.text = NSLocalizedString("lbl_numero_orden", comment: "lbl_numero_orden")
        lblServicio.text = NSLocalizedString("lbl_servicio", comment: "lbl_servicio")
        lblValorServicio.text = NSLocalizedString("lbl_valor_servicio", comment: "lbl_valor_servicio")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
