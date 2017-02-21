//
//  UtilizacionesTabUtilizacionesViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesTabUtilizacionesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static var jsonTabUtilizaciones: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let solicitud =  UtilizacionesViewController.jsonDetalleUtilizaciones as? Dictionary<String, Any>{
            UtilizacionesTabUtilizacionesViewController.jsonTabUtilizaciones = solicitud["utilizaciones"] as? NSArray
            
        }
        // Do any additional setup after loading the view.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (UtilizacionesTabUtilizacionesViewController.jsonTabUtilizaciones!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UtilizacionesTabUtilizacionesViewCellController
        
        if let solicitud = UtilizacionesTabUtilizacionesViewController.jsonTabUtilizaciones?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtTipoSeguro.text = (solicitud["tipoSeguro"] as? String ?? " ");
            cell.txtSeguroNumero.text = (solicitud["seguroNumero"] as? String ?? " ");
            cell.txtPrestadorProveedor.text = (solicitud["prestador"] as? String ?? " ");
            cell.txtConcepto.text = (solicitud["concepto"] as? String ?? " ");
            cell.txtTotal.text = FormatoDinero.formatearMoneda(texto: (solicitud["total"] as? String ?? " "));
            cell.txtTotalGlosa.text = FormatoDinero.formatearMoneda(texto: (solicitud["totalGlosa"] as? String ?? " "));
            cell.txtFechaCreado.text = (solicitud["fechaCreado"] as? String ?? " ");

        }
        
        return (cell)
        
        
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
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "utilizacionesTabController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    

}
