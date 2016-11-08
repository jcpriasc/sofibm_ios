//
//  OpcionesSecundariasLogViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/5/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class OpcionesSecundariasLogViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    let opciones = [NSLocalizedString("lbl_servicio_no_asistencial", comment: "lbl_servicio_no_asistencial"),
                    NSLocalizedString("lbl_titulo_giro", comment: "lbl_titulo_giro"),
                    NSLocalizedString("lbl_titulo_nota_credito_giro", comment: "lbl_titulo_nota_credito_giro"),
                    NSLocalizedString("lbl_titulo_factura", comment: "lbl_titulo_factura"),
                    NSLocalizedString("lbl_titulo_notas_credito_debito", comment: "lbl_titulo_notas_credito_debito"),
                    NSLocalizedString("lbl_titulo_utilizaciones", comment: "lbl_titulo_utilizaciones"),
                    NSLocalizedString("lbl_titulo_encuesta_satisfaccion", comment: "lbl_titulo_encuesta_satisfaccion"),
                    NSLocalizedString("lbl_consultar_solicitudes_aprobacion", comment: "lbl_consultar_solicitudes_aprobacion")]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (opciones.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellOpcion = tableView.dequeueReusableCell(withIdentifier: "cellOpcion", for: indexPath) as! OpcionesSecundariasViewCell
        
        
        cellOpcion.lblOpcion.text = opciones[indexPath.row]
        
        let opcionSeleccionada = indexPath.row
        
        switch opcionSeleccionada {
        case 0:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_no_asistenciales")
        case 1:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_giros")
        case 2:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_nota_credito_giro")
        case 3:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_factura")
        case 4:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_nota_credito_debito")
        case 5:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_utilizaciones")
        case 6:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_encuestas")
        default:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_aprobacion")
        }
        
        
        
        return cellOpcion
    }
    
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        switch opcionSeleccionada {
        case 0:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "servicioNoAsistencialController")
            self.show(vc as! UIViewController, sender: vc)
        case 1:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "testView2")
            self.show(vc as! UIViewController, sender: vc)
            print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        
        return indexPath
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

}
