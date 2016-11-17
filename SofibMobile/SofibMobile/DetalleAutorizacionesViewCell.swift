//
//  DetalleAutorizacionesViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/16/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleAutorizacionesViewCell: UITableViewCell {

    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var txtDescripcion: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var txtEstado: UILabel!
    @IBOutlet weak var lblJustificacion: UILabel!
    @IBOutlet weak var txtJustificacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Initialization code
        lblDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblJustificacion.text = NSLocalizedString("lbl_justificacion_cancelacion", comment: "lbl_justificacion_cancelacion")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
