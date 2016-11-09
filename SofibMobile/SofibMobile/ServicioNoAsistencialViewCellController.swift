//
//  ServicioNoAsistencialViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ServicioNoAsistencialViewCellController: UITableViewCell {

    
    @IBOutlet var lblNumeroSolicitud: UILabel!
    @IBOutlet var lblIdentificacion: UILabel!
    @IBOutlet var lblNombre: UILabel!
    
    
    @IBOutlet var txtNombre: UILabel!
    @IBOutlet var txtNumeroSolicitud: UILabel!
    @IBOutlet var txtIdentificacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblNumeroSolicitud.text = NSLocalizedString("lbl_numero_solicitud", comment: "lbl_numero_solicitud")
        lblIdentificacion.text = NSLocalizedString("identificacion", comment: "identificacion")
        lblNombre.text = NSLocalizedString("nombre", comment: "nombre")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setdata(servicioNoAsistencial: Dictionary<String, Any>){
        
        print("factura \(servicioNoAsistencial)")
        
        if let numeroFactura = servicioNoAsistencial["codSolicitud"] as? Int{
            print("codSolicitud: \(numeroFactura)")
            self.txtNumeroSolicitud.text = "\(numeroFactura)"
        }else{
            print("No entro")
        }
    }

}
