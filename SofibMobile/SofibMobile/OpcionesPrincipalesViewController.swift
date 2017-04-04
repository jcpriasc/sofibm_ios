//
//  OpcionesPrincipalesViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 5/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class OpcionesPrincipalesViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    let opciones = [NSLocalizedString("lbl_consultar_info_medica", comment: "lbl_consultar_info_medica"),
                    NSLocalizedString("lbl_consultar_info_logistica", comment: "lbl_consultar_info_logistica")]
    
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
            cellOpcion.imgOpcion.image = UIImage(named: "icon_buscar")
        default:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_consulta_info_logistica")
        }
        
        
        
        return cellOpcion
    }
    
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        switch opcionSeleccionada {
        case 0:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tableViewMedicoController")
            self.show(vc as! UIViewController, sender: vc)
            print("The first letter of the alphabet")
        case 1:
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tableViewLogisticoController")
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
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        
        AjustesViewController.viewBack = "opcionesPrincipalesView"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    
  

}
