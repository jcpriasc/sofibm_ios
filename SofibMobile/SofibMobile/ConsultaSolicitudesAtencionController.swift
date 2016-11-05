//
//  ConsultaSolicitudesAtencionController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/1/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ConsultaSolicitudesAtencionController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let solicitudesAtencion = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
   
    
    override func viewWillAppear(_ animated: Bool) {
      

    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (solicitudesAtencion.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SolicitudAtencionTableViewCell
        
        cell.solicitudAtencionTxt.text = solicitudesAtencion[indexPath.row]
        cell.identificacionTxt.text = solicitudesAtencion[indexPath.row]
        cell.nombreTxt.text = solicitudesAtencion[indexPath.row]
        cell.convenioTxt.text = solicitudesAtencion[indexPath.row]
        
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
