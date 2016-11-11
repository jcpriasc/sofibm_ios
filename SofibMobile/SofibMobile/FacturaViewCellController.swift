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
        lblValorTotalFactura.text = NSLocalizedString("lbl_valor_total_factura", comment: "lbl_valor_total_factura")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblFechaExpedicion.text = NSLocalizedString("lbl_fecha_expedicion", comment: "lbl_fecha_expedicion")
        lblNumeroFactura.text = NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
