//
//  FuncionariosTableViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FuncionariosTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFuncionario: UILabel!
    @IBOutlet weak var txtFuncionario: UILabel!
    
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var txtFecha: UILabel!
    
    @IBOutlet weak var lblMedico: UILabel!
    @IBOutlet weak var txtMedico: UILabel!
    
    @IBOutlet weak var lblEspecialidad: UILabel!
    @IBOutlet weak var txtEspecialidad: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblFuncionario.text = NSLocalizedString("lbl_area_medica", comment: "lbl_area_medica")
        lblFecha.text = NSLocalizedString("lbl_fecha_cita", comment: "lbl_fecha_cita")
        lblMedico.text = NSLocalizedString("lbl_medico", comment: "lbl_medico")
        lblEspecialidad.text = NSLocalizedString("lbl_especialidad", comment: "lbl_especialidad")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
