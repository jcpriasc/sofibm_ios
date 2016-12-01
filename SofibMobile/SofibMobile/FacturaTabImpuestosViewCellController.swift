//
//  FacturaTabImpuestosViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaTabImpuestosViewCellController: UITableViewCell {

    
    @IBOutlet var lblNumeroOrdenServicio: UILabel!
    @IBOutlet var lblTipoImpuesto: UILabel!
    @IBOutlet var lblServicio: UILabel!
    @IBOutlet var lblPorcentaje: UILabel!
    @IBOutlet var lblValorImpuesto: UILabel!
    @IBOutlet var lblAplicaSeguroHotelero: UILabel!
    
    @IBOutlet var txtNumeroOrdenServicio: UILabel!
    @IBOutlet var txtTipoImpuesto: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtPorcentaje: UILabel!
    @IBOutlet var txtValorImpuesto: UILabel!
    @IBOutlet var txtAplicaSeguroHotelero: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblNumeroOrdenServicio.text = NSLocalizedString("lbl_numero_orden_servicio", comment: "lbl_numero_orden_servicio")
        lblTipoImpuesto.text = NSLocalizedString("lbl_tipo_impuesto", comment: "lbl_tipo_impuesto")
        lblServicio.text = NSLocalizedString("lbl_servicio", comment: "lbl_servicio")
        lblPorcentaje.text = NSLocalizedString("lbl_porcentaje", comment: "lbl_porcentaje")
        lblValorImpuesto.text = NSLocalizedString("lbl_valor_impuesto", comment: "lbl_valor_impuesto")
        lblAplicaSeguroHotelero.text = NSLocalizedString("lbl_aplica_seguro_hotelero", comment: "lbl_aplica_seguro_hotelero")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
