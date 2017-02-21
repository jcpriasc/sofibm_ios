//
//  ServicioNoAsistencialTabDocumentacionViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ServicioNoAsistencialTabDocumentacionViewController: UIViewController {

    @IBOutlet var lblDocumentacionServicio: UILabel!
    @IBOutlet var lblDescripcion: UILabel!
    
    @IBOutlet var txtDescripcion: UILabel!
    
    static var detalleServicioNoAsistencial = DetalleServicioNoAsistencial()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblDocumentacionServicio.text = NSLocalizedString("lbl_titulo_documentacion_servicio", comment: "lbl_titulo_documentacion_servicio")
        lblDescripcion.text = NSLocalizedString("lbl_descripcion_restriccion", comment: "lbl_descripcion_restriccion")
        
        
        if let solicitud = DetalleServicioNoAsistencialViewController.jsonDetalleServicioNoAsistencial as? Dictionary<String, Any>{
            txtDescripcion.text = (solicitud["descripcionYRestricciones"] as? String ?? "")
            
        }
        
        
        
        
        
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
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "servicioDocumentacionTab"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
