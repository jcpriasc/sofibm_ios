//
//  ServicioAsistencialViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 3/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class ServicioAsistencialViewCell: UITableViewCell {

    @IBOutlet var lblNumeroOrden: UILabel!
    
    @IBOutlet var txtNumeroOrden: UILabel!
    @IBOutlet var lblIdPrestador: UILabel!
    @IBOutlet var txtIdPrestador: UILabel!
    @IBOutlet var lblNombrePrestador: UILabel!
    @IBOutlet var txtNombrePrestador: UILabel!
    @IBOutlet var lblTipoPrestador: UILabel!
    @IBOutlet var txtTipoPrestador: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblNumeroOrden.text = NSLocalizedString("lbl_numero_orden", comment: "lbl_numero_orden")
        lblIdPrestador.text = NSLocalizedString("lbl_id_prestador", comment: "lbl_id_prestador")
        lblNombrePrestador.text = NSLocalizedString("lbl_nombre_prestador", comment: "lbl_nombre_prestador")
        lblTipoPrestador.text = NSLocalizedString("lbl_tipo_servicio", comment: "lbl_tipo_servicio")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
