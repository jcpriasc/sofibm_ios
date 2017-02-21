//
//  ServicioNoAsistencialTabServiciosAdicionadosViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ServicioNoAsistencialTabServiciosAdicionadosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var lblServiciosAdicionados: UILabel!
    static var jsonServicioAdicionado: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

         lblServiciosAdicionados.text = NSLocalizedString("lbl_tab_servicios_adicionados", comment: "lbl_tab_servicios_adicionados")
        
        if let solicitud = DetalleServicioNoAsistencialViewController.jsonDetalleServicioNoAsistencial as? Dictionary<String, Any>{
            ServicioNoAsistencialTabServiciosAdicionadosViewController.jsonServicioAdicionado = solicitud["detalle"] as? NSArray
            
        }
        
        
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        // self.obtenerServiciosNoAsistenciales()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (ServicioNoAsistencialTabServiciosAdicionadosViewController.jsonServicioAdicionado!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServicioNoAsistencialTabServicioAdicionadoViewCellController
        
        if let solicitud = ServicioNoAsistencialTabServiciosAdicionadosViewController.jsonServicioAdicionado?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNombre.text = (solicitud["nombre"] as? String ?? " ");
            cell.txtDescripcion.text = (solicitud["descripcion"] as? String ?? " ");
            cell.txtProveedor.text = (solicitud["proveedor2"] as? String ?? " ");
        }
        
        return (cell)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "serviciosAdicionadosController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    
    
    
}
