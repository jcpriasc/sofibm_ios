//
//  ServiciosAsistencialesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 3/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class ServiciosAsistencialesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    let jsonServicioAsistencial: NSArray = OpcionesSecundariasViewController.jsonServiciosAsistenciales!;
    let params: String = "/SAC/ABCD1234/"
    static var servicioAsistencial = ServicioAsistencial()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonServicioAsistencial.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServicioAsistencialViewCell
        
        
        if let solicitud = self.jsonServicioAsistencial[indexPath.row] as? Dictionary<String, Any>{
            
            cell.txtNumeroOrden.text = (solicitud["numerioSias"] as? String ?? "");

            let idPrestador = solicitud["idPrestador"] as! Int?            
            cell.txtIdPrestador.text = idPrestador?.description;
            cell.txtNombrePrestador.text = (solicitud["nombrePrestador"] as? String ?? "");
            cell.txtTipoPrestador.text = (solicitud["nombreServicio"] as? String ?? "");
            
        }
        
        return (cell)
        
        
    }
    
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonServicioAsistencial[opcionSeleccionada] as? Dictionary<String, Any>{

            //ServiciosAsistencialesViewController.servicioAsistencial.id = (solicitud["id"] as! Int?)!
            ServiciosAsistencialesViewController.servicioAsistencial.numerioSias = (solicitud["numerioSias"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.ciudad = (solicitud["ciudad"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.idPrestador = (solicitud["idPrestador"] as! Int?)!
            ServiciosAsistencialesViewController.servicioAsistencial.nombrePrestador = (solicitud["nombrePrestador"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.nombreServicio = (solicitud["nombreServicio"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.codigoProcedimiento = (solicitud["codigoProcedimiento"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.cantidad = (solicitud["cantidad"] as! Int?)!
            ServiciosAsistencialesViewController.servicioAsistencial.nombreEspanol = (solicitud["nombreEspanol"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.nombreIngles = (solicitud["nombreIngles"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.fecha = (solicitud["fecha"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.estado = (solicitud["estado"] as? String ?? "");
            
            
            consultarDetalle(codigo: solicitud["id"] as? String ?? "")
            
            //result["artworkUrl60"] as? String ?? ""
        }
        
        return indexPath
    }
    
    
    
    func consultarDetalle(codigo: String){
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_ServiciosAsistenciales_detalle+params+codigo)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        
                        let jsonSolicitudDetalleServicioAsistencial: NSDictionary? = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        DispatchQueue.main.async {
                        if ((jsonSolicitudDetalleServicioAsistencial?.count)!>0){
                            //print(jsonSolicitudDetalleServicioAsistencial)
                            ServiciosAsistencialesViewController.servicioAsistencial.detalleServicio = jsonSolicitudDetalleServicioAsistencial?["historico"] as? NSArray
                            print(ServiciosAsistencialesViewController.servicioAsistencial.detalleServicio)
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleServicioAsis")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
                            //print(NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"));
                            let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        }
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        //{"orden":"57636383","historico":[{"estado":"IMPRESA","fecha":"2015-01-19"}]}
        
        
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
