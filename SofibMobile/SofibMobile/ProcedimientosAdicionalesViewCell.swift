//
//  ProcedimientosAdicionalesViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ProcedimientosAdicionalesViewCell: UITableViewCell {

    @IBOutlet weak var lblNombreProcedimiento: UILabel!
    @IBOutlet weak var txtNombreProcedimiento: UILabel!
    
    @IBOutlet weak var lblCiudad: UILabel!
    @IBOutlet weak var txtCiudad: UILabel!
    
    @IBOutlet weak var lblPrestador: UILabel!
    @IBOutlet weak var txtPrestador: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblNombreProcedimiento.text = NSLocalizedString("lbl_nombre_procedimiento", comment: "lbl_nombre_procedimiento")
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblPrestador.text = NSLocalizedString("lbl_prestador_proveedor", comment: "lbl_prestador_proveedor")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
