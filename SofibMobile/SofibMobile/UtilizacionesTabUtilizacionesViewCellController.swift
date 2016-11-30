//
//  UtilizacionesTabUtilizacionesViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesTabUtilizacionesViewCellController: UITableViewCell {

    @IBOutlet var lblTipoSeguro: UILabel!
    @IBOutlet var lblSeguroNumero: UILabel!
    @IBOutlet var lblPrestadorProveedor: UILabel!
    @IBOutlet var lblConcepto: UILabel!
    @IBOutlet var lblTotal: UILabel!
    @IBOutlet var lblTotalGlosa: UILabel!
    @IBOutlet var lblFechaCreado: UILabel!
    
    @IBOutlet var txtTipoSeguro: UILabel!
    @IBOutlet var txtSeguroNumero: UILabel!
    @IBOutlet var txtPrestadorProveedor: UILabel!
    @IBOutlet var txtConcepto: UILabel!
    @IBOutlet var txtTotal: UILabel!
    @IBOutlet var txtTotalGlosa: UILabel!
    @IBOutlet var txtFechaCreado: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblTipoSeguro.text = NSLocalizedString("lbl_tipo_seguro", comment: "lbl_tipo_seguro")
        lblSeguroNumero.text = NSLocalizedString("lbl_numero_seguro", comment: "lbl_numero_seguro")
        lblPrestadorProveedor.text = NSLocalizedString("lbl_prestador_proveedor", comment: "lbl_prestador_proveedor")
        lblConcepto.text = NSLocalizedString("lbl_concepto", comment: "lbl_concepto")
        lblTotal.text = NSLocalizedString("lbl_total", comment: "lbl_total")
        lblTotalGlosa.text = NSLocalizedString("lbl_total_glosa", comment: "lbl_total_glosa")
        lblFechaCreado.text = NSLocalizedString("lbl_fecha_creado", comment: "lbl_fecha_creado")
        
    
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    


}
