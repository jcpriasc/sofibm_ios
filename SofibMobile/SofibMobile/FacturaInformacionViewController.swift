//
//  FacturaInformacionViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaInformacionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    let lstFactura = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    
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
        return (lstFactura.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FacturaInformacionViewCellController
        
        cell.txtTipoPago.text = lstFactura[indexPath.row]
        cell.txtSeguroHotelero.text = lstFactura[indexPath.row]
        cell.txtValorServicio.text = lstFactura[indexPath.row]
        cell.txtFechaFinalizacion.text = lstFactura[indexPath.row]
        cell.txtFechaInicio.text = lstFactura[indexPath.row]
        cell.txtServicio.text = lstFactura[indexPath.row]
        cell.txtNumeroOrdenServicio.text = lstFactura[indexPath.row]
        cell.txtProveedor.text = lstFactura[indexPath.row]
        
        
        return (cell)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
