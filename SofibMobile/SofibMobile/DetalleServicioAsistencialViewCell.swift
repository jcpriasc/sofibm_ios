//
//  DetalleServicioAsistencialViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 3/13/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class DetalleServicioAsistencialViewCell: UITableViewCell {
    

    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var txtEstado: UILabel!
    
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var txtFecha: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblFecha.text = NSLocalizedString("lbl_fecha", comment: "lbl_fecha")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
