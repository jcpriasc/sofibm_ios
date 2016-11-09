//
//  InformesMedicosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class InformesMedicosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let informesMedicos = ["informesMedicos 1", "informesMedicos 2", "informesMedicos 3", "informesMedicos 4", "informesMedicos 5", "informesMedicos 6", "informesMedicos 7", "informesMedicos 9"]
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (informesMedicos.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformesMedicosViewCell
        
        cell.txtFechaRegistro.text = informesMedicos[indexPath.row]
        cell.txtCiudad.text = informesMedicos[indexPath.row]
        cell.txtDadoAlta.text = informesMedicos[indexPath.row]
        cell.txtFallecido.text = informesMedicos[indexPath.row]
        cell.txtEstado.text = informesMedicos[indexPath.row]
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
