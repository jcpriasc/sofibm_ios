//
//  FacturaTabFacturaViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaTabFacturaViewCellController: UITableViewCell {
    
    
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblNumeroOrdenServicio: UILabel!
    @IBOutlet var lblServicio: UILabel!
    @IBOutlet var lblFechaInicio: UILabel!
    @IBOutlet var lblFechaFinalizacion: UILabel!
    @IBOutlet var lblValorServicio: UILabel!
    @IBOutlet var lblSeguroHotelero: UILabel!
    @IBOutlet var lblTipoPago: UILabel!

    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtNumeroOrdenServicio: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtFechaInicio: UILabel!
    @IBOutlet var txtFechaFinalizacion: UILabel!
    @IBOutlet var txtValorServicio: UILabel!
    @IBOutlet var txtSeguroHotelero: UILabel!
    @IBOutlet var txtTipoPago: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
        lblNumeroOrdenServicio.text = NSLocalizedString("lbl_numero_orden_servicio", comment: "lbl_numero_orden_servicio")
        lblServicio.text = NSLocalizedString("lbl_servicio", comment: "lbl_servicio")
        lblFechaInicio.text = NSLocalizedString("lbl_fecha_inicio", comment: "lbl_fecha_inicio")
        lblFechaFinalizacion.text = NSLocalizedString("lbl_fecha_fin", comment: "lbl_fecha_fin")
        lblValorServicio.text = NSLocalizedString("lbl_valor_servicio", comment: "lbl_valor_servicio")
        lblSeguroHotelero.text = NSLocalizedString("lbl_seguro_hotelero", comment: "lbl_seguro_hotelero")
        lblTipoPago.text = NSLocalizedString("lbl_tipo_pago", comment: "lbl_tipo_pago")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
