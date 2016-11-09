//
//  InformesMedicosViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class InformesMedicosViewCell: UITableViewCell {

    @IBOutlet weak var lblFechaRegistro: UILabel!
    @IBOutlet weak var lblCiudad: UILabel!
    @IBOutlet weak var lblDadoAlta: UILabel!
    @IBOutlet weak var lblFallecido: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    
    @IBOutlet weak var txtFechaRegistro: UILabel!
    @IBOutlet weak var txtCiudad: UILabel!
    @IBOutlet weak var txtFallecido: UILabel!
    @IBOutlet weak var txtEstado: UILabel!
    @IBOutlet weak var txtDadoAlta: UILabel!
    
    override func awakeFromNib() {
        
        
        lblFechaRegistro.text = NSLocalizedString("lbl_fecha_registro", comment: "lbl_fecha_registro")
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblDadoAlta.text = NSLocalizedString("lbl_dado_alta", comment: "lbl_dado_alta")
        lblFallecido.text = NSLocalizedString("lbl_fallecio", comment: "lbl_fallecio")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
