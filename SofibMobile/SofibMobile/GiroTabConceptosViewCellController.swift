//
//  GiroTabConceptosViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroTabConceptosViewCellController: UITableViewCell {
    
    
    @IBOutlet var lblConcepto: UILabel!
    @IBOutlet var lblDescripcion: UILabel!
    @IBOutlet var lblCantidad: UILabel!
    @IBOutlet var lblValor: UILabel!
    @IBOutlet var lblReliquidacion: UILabel!
    @IBOutlet var lblSubtotal: UILabel!
    @IBOutlet var lblTrm: UILabel!
    @IBOutlet var lblTotal: UILabel!
    
    @IBOutlet var txtSubtotal: UILabel!
    @IBOutlet var txtConcepto: UILabel!
    @IBOutlet var txtDescripcion: UILabel!
    @IBOutlet var txtCantidad: UILabel!
    @IBOutlet var txtValor: UILabel!
    @IBOutlet var txtReliquidacion: UILabel!
    @IBOutlet var txtTrm: UILabel!
    @IBOutlet var txtTotal: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblConcepto.text = NSLocalizedString("lbl_conceptos", comment: "lbl_conceptos")
        lblDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
        lblCantidad.text = NSLocalizedString("lbl_cantidad", comment: "lbl_cantidad")
        lblValor.text = NSLocalizedString("lbl_valor", comment: "lbl_valor")
        lblReliquidacion.text = NSLocalizedString("lbl_reliquidacion", comment: "lbl_reliquidacion")
        lblSubtotal.text = NSLocalizedString("lbl_subtotal", comment: "lbl_subtotal")
        lblTrm.text = NSLocalizedString("lbl_trm", comment: "lbl_trm")
        lblTotal.text = NSLocalizedString("lbl_total", comment: "lbl_total")
  
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
