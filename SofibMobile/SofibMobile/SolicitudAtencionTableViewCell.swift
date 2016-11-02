//
//  SolicitudAtencionTableViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/1/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class SolicitudAtencionTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var solicitudAtencionTxt: UILabel!
    
    @IBOutlet weak var identificacionTxt: UILabel!
    @IBOutlet weak var nombreTxt: UILabel!
    @IBOutlet weak var convenioTxt: UILabel!
    
    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblConvenio: UILabel!
    @IBOutlet var lblSolicitudAtencion: UILabel!
    @IBOutlet var lblIdentificacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblNombre.text = NSLocalizedString("nombre", comment: "Nombre")
        lblSolicitudAtencion.text = NSLocalizedString("solicitud_atencion", comment: "solicitud_atencion")
        lblIdentificacion.text = NSLocalizedString("identificacion", comment: "identificacion")
        lblConvenio.text = NSLocalizedString("convenio", comment: "convenio")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
