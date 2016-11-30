//
//  UtilizacionesTabAdministracionesViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesTabAdministracionesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static var jsonTabAdministraciones: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let solicitud = UtilizacionesViewController.jsonDetalleUtilizaciones as? Dictionary<String, Any>{
            UtilizacionesTabAdministracionesViewController.jsonTabAdministraciones = solicitud["administraciones"] as? NSArray
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (UtilizacionesTabAdministracionesViewController.jsonTabAdministraciones!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UtilizacionesTabAdministracionesViewCellController
        
        if let solicitud = UtilizacionesTabAdministracionesViewController.jsonTabAdministraciones?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtTotal.text = (solicitud["total"] as? String ?? " ");
            cell.txtTrm.text = (solicitud["trm"] as? String ?? " ");
            cell.txtSubtotal.text = (solicitud["subtotal"] as? String ?? " ");
            cell.txtPorcentajeIva.text = (solicitud["porcentaje"] as? String ?? " ");
            cell.txtValorIva.text = (solicitud["valorIva"] as? String ?? " ");
            cell.txtFechaCreado.text = (solicitud["fechaCreado"] as? String ?? " ");
        
        }
        
        return (cell)
        
        
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
