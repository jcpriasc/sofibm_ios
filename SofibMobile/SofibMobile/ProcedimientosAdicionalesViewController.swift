//
//  ProcedimientosAdicionalesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ProcedimientosAdicionalesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let procedimientosAdicionales = ["procedimientosAdicionales 1", "procedimientosAdicionales 2", "procedimientosAdicionales 3", "procedimientosAdicionales 4", "procedimientosAdicionales 5", "procedimientosAdicionales 6", "procedimientosAdicionales 7", "procedimientosAdicionales 9"]
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (procedimientosAdicionales.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProcedimientosAdicionalesViewCell
        
        /*cell.lblNombreProcedimiento.text = procedimientosAdicionales[indexPath.row]
        cell.lblCiudad.text = procedimientosAdicionales[indexPath.row]
        cell.lblPrestador.text = procedimientosAdicionales[indexPath.row]*/
        
        return (cell)
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
