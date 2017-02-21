//
//  InformesMedTabMedicinaViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 2/19/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class InformesMedTabMedicinaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    static var jsonTabMedicina: NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for det in InformesMedicosViewController.jsonDetalleInformeMedico! {
            if let solicitud = det  as? Dictionary<String, Any>{
                InformesMedTabMedicinaViewController.jsonTabMedicina = solicitud["medicamentoNombre"] as? NSArray
                
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
        return (InformesMedTabMedicinaViewController.jsonTabMedicina!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformesMedTabMedicinaTableViewCell
        
        if let solicitud = InformesMedTabMedicinaViewController.jsonTabMedicina?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtMedicina.text = (solicitud["medicamentoNombre"] as? String ?? " ");
        }
        
        return (cell)
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
