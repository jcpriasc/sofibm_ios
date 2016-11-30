//
//  UtilizacionesTabAdministracionesViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesTabAdministracionesViewCellController: UITableViewCell {

    
    
    @IBOutlet var lblTotal: UILabel!
    @IBOutlet var lblTrm: UILabel!
    @IBOutlet var lblSubTotal: UILabel!
    @IBOutlet var lblPorcentajeIva: UILabel!
    @IBOutlet var lblValorIva: UILabel!
    @IBOutlet var lblFechaCreado: UILabel!
    
    @IBOutlet var txtTotal: UILabel!
    @IBOutlet var txtTrm: UILabel!
    @IBOutlet var txtSubtotal: UILabel!
    @IBOutlet var txtPorcentajeIva: UILabel!
    @IBOutlet var txtValorIva: UILabel!
    @IBOutlet var txtFechaCreado: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblTotal.text = NSLocalizedString("lbl_total", comment: "lbl_total")
        lblTrm.text = NSLocalizedString("lbl_trm", comment: "lbl_trm")
        lblSubTotal.text = NSLocalizedString("lbl_subtotal", comment: "lbl_subtotal")
        lblPorcentajeIva.text = NSLocalizedString("lbl_porcentaje_iva", comment: "lbl_porcentaje_iva")
        lblValorIva.text = NSLocalizedString("lbl_valor_iva", comment: "lbl_valor_iva")
        lblFechaCreado.text = NSLocalizedString("lbl_fecha_creado", comment: "lbl_fecha_creado")
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
