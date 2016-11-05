//
//  OpcionesSecundariasViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/4/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class OpcionesSecundariasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let opciones = ["Solicitud 1"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (opciones.count)
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellOpcion = tableView.dequeueReusableCell(withIdentifier: "cellOpcion", for: indexPath) as! OpcionesSecundariasViewCell
        
        cellOpcion.imgOpcion.image = UIImage(named: "icon_aprobacion")
        cellOpcion.lblOpcion.text = opciones[indexPath.row]
        return cellOpcion
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
