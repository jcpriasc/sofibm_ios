//
//  ServicioNoAsistencialTabServicioAdicionadoViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ServicioNoAsistencialTabServicioAdicionadoViewCellController: UITableViewCell {

    
    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblDescripcion: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    
    @IBOutlet var txtNombre: UILabel!
    @IBOutlet var txtDescripcion: UILabel!
    @IBOutlet var txtProveedor: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblNombre.text = NSLocalizedString("nombre", comment: "nombre")
        lblDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
