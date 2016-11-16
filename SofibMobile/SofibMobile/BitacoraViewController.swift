//
//  BitacoraViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class BitacoraViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let bitacoras = ["bitacoras 1", "bitacoras 2", "bitacoras 3", "bitacoras 4", "bitacoras 5", "bitacoras 6", "bitacoras 7", "bitacoras 9"]
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (bitacoras.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BitacoraViewCell
        
        cell.txtSolicitud.text = bitacoras[indexPath.row]
        cell.txtNombre.text = bitacoras[indexPath.row]
        cell.txtTipoRegistro.text = bitacoras[indexPath.row]
        cell.txtTipoAccion.text = bitacoras[indexPath.row]
        cell.txtEstado.text = bitacoras[indexPath.row]
        
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
