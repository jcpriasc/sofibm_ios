//
//  GiroConceptoViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroConceptoViewCellController: UITableViewCell {

    
    @IBOutlet var txtTotal: UILabel!
    @IBOutlet var txtTrm: UILabel!
    @IBOutlet var txtSubTotal: UILabel!
    @IBOutlet var txtReliquidacion: UILabel!
    @IBOutlet var txtValor: UILabel!
    @IBOutlet var txtCantidad: UILabel!
    @IBOutlet var txtDescripcion: UILabel!
    @IBOutlet var txtConcepto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        //lblNumeroSolicitud.text = NSLocalizedString("lbl_numero_solicitud", comment: "lbl_numero_solicitud")
        //lblIdentificacion.text = NSLocalizedString("identificacion", comment: "identificacion")
        //lblNombre.text = NSLocalizedString("nombre", comment: "nombre")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
