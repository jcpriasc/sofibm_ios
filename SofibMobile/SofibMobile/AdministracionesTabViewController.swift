//
//  AdministracionesTabViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class AdministracionesTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let lstAdministraciones = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.lstServicioNoAsistencial.delegate = self;
        // self.lstServicioNoAsistencial.dataSource = self;
        
        // let archivo  = UINib(nibName: idCelda, bundle:nil);
        // self.lstServicioNoAsistencial.register(archivo, forCellReuseIdentifier: idCelda)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // self.obtenerServiciosNoAsistenciales()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (lstAdministraciones.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AdministracionesTabViewCellController
        
        cell.txtFechaCreado.text = lstAdministraciones[indexPath.row]
        cell.txtValorIva.text = lstAdministraciones[indexPath.row]
        cell.txtPorcentajeIva.text = lstAdministraciones[indexPath.row]
        cell.txtSubtotal.text = lstAdministraciones[indexPath.row]
        cell.txtTrm.text = lstAdministraciones[indexPath.row]
        cell.txtTotal.text = lstAdministraciones[indexPath.row]
        
        return (cell)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
