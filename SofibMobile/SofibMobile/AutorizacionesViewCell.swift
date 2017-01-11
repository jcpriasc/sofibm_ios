//
//  AutorizacionesViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/5/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class AutorizacionesViewCell: UITableViewCell {

    @IBOutlet var txtDescripcion: UILabel!
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtTipoSolicitud: UILabel!
    @IBOutlet var txtFechaSolicitud: UILabel!
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtFechaAprobacion: UILabel!
    @IBOutlet var txtFechaRechazo: UILabel!
    
    @IBOutlet var textDescripcion: UILabel!
    @IBOutlet var textCiudad: UILabel!
    @IBOutlet var textTipoSolicitud: UILabel!
    @IBOutlet var textFechaSolicitud: UILabel!
    @IBOutlet var textEstado: UILabel!
    @IBOutlet var textFechaAprobacion: UILabel!
    @IBOutlet var textFechaRechazo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         txtDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
         txtCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
         txtTipoSolicitud.text = NSLocalizedString("lbl_tipo_solicitud", comment: "lbl_tipo_solicitud")
         txtFechaSolicitud.text = NSLocalizedString("lbl_fecha_solicitud", comment: "lbl_fecha_solicitud")
         txtEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
         txtFechaAprobacion.text = NSLocalizedString("lbl_fecha_aprobacion", comment: "lbl_fecha_aprobacion")
         txtFechaRechazo.text = NSLocalizedString("lbl_fecha_rechazo", comment: "lbl_fecha_rechazo")
        
        // Initialization code
    }
    @IBOutlet weak var lblAutorizaciones: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
