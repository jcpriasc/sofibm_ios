//
//  NotaCreditoDebitoViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoDebitoViewCellController: UITableViewCell {

    @IBOutlet var lblFechaAprobacion: UILabel!
    @IBOutlet var lblFechaExpedicion: UILabel!
    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblNumeroNota: UILabel!
    
    @IBOutlet var txtNumeroNota: UILabel!
    @IBOutlet var txtNumeroFactura: UILabel!
    @IBOutlet var txtFechaExpedicion: UILabel!
    @IBOutlet var txtFechaAprobacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblFechaAprobacion.text = NSLocalizedString("lbl_fecha_aprobacion", comment: "lbl_fecha_aprobacion")
        lblFechaExpedicion.text = NSLocalizedString("lbl_fecha_expedicion", comment: "lbl_fecha_expedicion")
        lblNumeroFactura.text = NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura")
        lblNumeroNota.text = NSLocalizedString("lbl_numero_nota", comment: "lbl_numero_nota")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
