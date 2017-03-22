//
//  DetalleListaAutorizacionViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 22/03/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class DetalleListaAutorizacionViewController: UIViewController {

    
    @IBOutlet var lblTituloDetalle: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var lblNumeroOrdenServicio: UILabel!
    @IBOutlet var txtNumeroOrdenServicio: UILabel!
    @IBOutlet var lblServicio: UILabel!
    @IBOutlet var txtServicio: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTituloDetalle.text = NSLocalizedString("lbl_autorizaciones", comment: "lbl_autorizaciones")
        lblProveedor.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
        lblNumeroOrdenServicio.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblServicio.text = NSLocalizedString("lbl_justificacion", comment: "lbl_justificacion")

        txtProveedor.text = DetalleAutorizacionesViewController.autorizacionDetalle.descripcion
        txtNumeroOrdenServicio.text = DetalleAutorizacionesViewController.autorizacionDetalle.estado
        txtServicio.text = DetalleAutorizacionesViewController.autorizacionDetalle.justificacion
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnAjuste(_ sender: AnyObject) {
        AjustesViewController.viewBack = "detalleListaAutorizacion"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
        
    }
}
