//
//  FacturaImpuestoViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaImpuestoViewCellController: UITableViewCell {
  
    @IBOutlet var txtAplicaSeguroHotelero: UILabel!
    @IBOutlet var txtValorImpuesto: UILabel!
    @IBOutlet var txtPorcentaje: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtTipoImpuesto: UILabel!
    @IBOutlet var txtNumeroOrdenServicio: UILabel!
    
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
