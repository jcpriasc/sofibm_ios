//
//  InformesMedTabProcedimientoViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 2/19/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class InformesMedTabProcedimientoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    static var jsonTabProcedimiento: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for det in InformesMedicosViewController.jsonDetalleInformeMedico! {
            if let solicitud = det  as? Dictionary<String, Any>{
                InformesMedTabProcedimientoViewController.jsonTabProcedimiento = solicitud["nombreProcedimiento"] as? NSArray
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (InformesMedTabProcedimientoViewController.jsonTabProcedimiento!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformesMedTabProcedimientoTableViewCell
        
        if let solicitud = InformesMedTabProcedimientoViewController.jsonTabProcedimiento?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtProcedimiento.text = (solicitud["nombreProcedimiento"] as? String ?? " ");
            
        }
        
        return (cell)
    }
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "procedimientoController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
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
