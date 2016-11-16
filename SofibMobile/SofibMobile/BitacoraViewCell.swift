//
//  BitacoraViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class BitacoraViewCell: UITableViewCell {
    
    @IBOutlet weak var lblSolicitud: UILabel!
    @IBOutlet weak var txtSolicitud: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var txtNombre: UILabel!
    @IBOutlet weak var lblTipoRegistro: UILabel!
    @IBOutlet weak var txtTipoRegistro: UILabel!
    @IBOutlet weak var lblTipoAccion: UILabel!
    @IBOutlet weak var txtTipoAccion: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var txtEstado: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblNombre.text = NSLocalizedString("lbl_nombre_paciente", comment: "lbl_nombre_paciente")
        lblSolicitud.text = NSLocalizedString("lbl_solicitud_atencion", comment: "lbl_solicitud_atencion")
        lblTipoRegistro.text = NSLocalizedString("lbl_tipo_registro", comment: "lbl_tipo_registro")
        lblTipoAccion.text = NSLocalizedString("lbl_tipo_accion", comment: "lbl_tipo_accion")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
