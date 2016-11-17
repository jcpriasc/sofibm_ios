//
//  FacturaInformacionViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaInformacionViewCellController: UITableViewCell {

    @IBOutlet var txtTipoPago: UILabel!
    @IBOutlet var txtSeguroHotelero: UILabel!
    @IBOutlet var txtValorServicio: UILabel!
    @IBOutlet var txtFechaFinalizacion: UILabel!
    @IBOutlet var txtFechaInicio: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtNumeroOrdenServicio: UILabel!
    @IBOutlet var txtProveedor: UILabel!
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
