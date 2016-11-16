//
//  GiroConceptoViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroConceptoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let lstConceptos = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    
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
        return (lstConceptos.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GiroConceptoViewCellController
        
        cell.txtTotal.text = lstConceptos[indexPath.row]
        cell.txtTrm.text = lstConceptos[indexPath.row]
        cell.txtSubTotal.text = lstConceptos[indexPath.row]
        cell.txtReliquidacion.text = lstConceptos[indexPath.row]
        cell.txtValor.text = lstConceptos[indexPath.row]
        cell.txtCantidad.text = lstConceptos[indexPath.row]
        cell.txtDescripcion.text = lstConceptos[indexPath.row]
        cell.txtConcepto.text = lstConceptos[indexPath.row]
        
        return (cell)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
