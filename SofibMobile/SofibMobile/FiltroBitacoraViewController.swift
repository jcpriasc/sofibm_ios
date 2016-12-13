//
//  FiltroBitacoraViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/10/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FiltroBitacoraViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var lblBusqueda: UILabel!
    @IBOutlet var txtNombrePaciente: UITextField!
    @IBOutlet var pickerCiudad: UITextField!
    @IBOutlet var pickerTipoRegistro: UITextField!
    @IBOutlet var pickerTipoServicio: UITextField!
    
    static var jsonBitacoras: NSArray?
    
    /*var tipoServicio = ["Medicamentos", "Prestador por fuera de la red", "Servicio de Alojamiento", "Servicio de Ambulancia Aérea", "Servicio de Ambulancia Terrestre"]
    var tipoRegistro = ["Devolución", "Solicitud de Atención", "Solicitud No Asistencial", "Giro", "Nota Crédito"]
    var ciudades = ["CALI", "BOGOTA", "CARTAGENA", "MEDELLIN", "PEREIRA"]
    */
    
    let ciudadPickerView = UIPickerView()
    let tipoRegistroPickerView = UIPickerView()
    let tipoServicioPickerView = UIPickerView()
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblBusqueda.text = NSLocalizedString("lbl_titulo_bitacora", comment: "lbl_titulo_bitacora")
        
        pickerCiudad.placeholder = NSLocalizedString("seleccionar_ciudad", comment: "seleccionar_ciudad")
        pickerTipoRegistro.placeholder = NSLocalizedString("seleccionar_tipo_registro", comment: "seleccionar_tipo_registro")
        pickerTipoServicio.placeholder = NSLocalizedString("seleccionar_tipo_servicio", comment: "seleccionar_tipo_servicio")

    }
    
    @IBAction func action_consultar_bitacora(_ sender: AnyObject) {
        
        var tipoRegistro: String = "0"
        var tipoServicio: String = "0"
        var ciudad: String = "0"
        var nombrePaciente: String = "0"
        
        if((pickerCiudad.text) != nil && (pickerCiudad.text) != ""){
            if let data = CargarPickers.ciudadJson![ciudadPickerView.selectedRow(inComponent: 0)] as? Dictionary<String, Any>{
                ciudad = (data["codigo"] as! String?)!;
            }
        }
        
        if((pickerTipoRegistro.text) != nil && (pickerTipoRegistro.text) != ""){
            if let data = CargarPickers.tipoRegistrosJson![tipoRegistroPickerView.selectedRow(inComponent: 0)] as? Dictionary<String, Any>{
                tipoRegistro = (data["codigo"] as! String?)!;
            }
        }
        
        if((pickerTipoServicio.text) != nil && (pickerTipoServicio.text) != ""){
            if let data = CargarPickers.tipoServiciosJson![tipoServicioPickerView.selectedRow(inComponent: 0)] as? Dictionary<String, Any>{
                tipoServicio = (data["codigo"] as! String?)!;
            }
        }
        
        if((txtNombrePaciente.text) != nil && (txtNombrePaciente.text) != ""){
            nombrePaciente = txtNombrePaciente.text!
        }
        
        var listParams: String = "/SAC/ABCD1234/"+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud;
        listParams+="/"+nombrePaciente;
        listParams+="/"+ciudad;
        listParams+="/"+tipoRegistro;
        listParams+="/"+tipoServicio;
        listParams+="/dnsepr07";
        listParams+="/0";
        listParams+="/0";
        listParams+="/NA";
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_Bitacoras+listParams)
        print(PropertiesProject.URL+PropertiesProject.complement_Bitacoras+listParams)
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
                        //Array
                        FiltroBitacoraViewController.jsonBitacoras = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                        if ((FiltroBitacoraViewController.jsonBitacoras?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "bitacorasController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
                            //print(NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"));
                            let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se crea el picker para ciudad
        
        ciudadPickerView.delegate = self
        ciudadPickerView.tag = 1
        pickerCiudad.inputView = ciudadPickerView
        //Se crea el picker para tipo registro
        
        tipoRegistroPickerView.delegate = self
        tipoRegistroPickerView.tag = 2
        pickerTipoRegistro.inputView = tipoRegistroPickerView
        //Se crea el picker para tipo servicio
        
        tipoServicioPickerView.delegate = self
        tipoServicioPickerView.tag = 3
        pickerTipoServicio.inputView = tipoServicioPickerView
        

        //Se crea el toolBar para el picker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor.white
        toolBar.barTintColor = UIColor.init(colorLiteralRed: 0.0, green: 0.40000000000000002, blue: 0.70196078429999997, alpha: 1)
        toolBar.isOpaque = true
        toolBar.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 0.40000000000000002, blue: 0.70196078429999997, alpha: 1)
        toolBar.isTranslucent = true
        toolBar.alpha = 1
        let defaultButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FiltrosSolicitudAtencionController.tappedToolBarBtn))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(FiltrosSolicitudAtencionController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        // label.text = ""
        label.textAlignment = NSTextAlignment.center
        
        let textBtn = UIBarButtonItem(customView: label)
        toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        pickerCiudad.inputAccessoryView = toolBar
        pickerTipoRegistro.inputAccessoryView = toolBar
        pickerTipoServicio.inputAccessoryView = toolBar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePressed(_ sender: UIBarButtonItem) {
        
        pickerCiudad.resignFirstResponder()
        pickerTipoRegistro.resignFirstResponder()
        pickerTipoServicio.resignFirstResponder()
        
    }
    
    func tappedToolBarBtn(_ sender: UIBarButtonItem) {
        
        pickerCiudad.text = ""
        pickerTipoRegistro.text = ""
        pickerTipoServicio.text = ""
        
        pickerCiudad.resignFirstResponder()
        pickerTipoRegistro.resignFirstResponder()
        pickerTipoServicio.resignFirstResponder()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return CargarPickers.ciudadJson!.count
        }
        
        if pickerView.tag == 2 {
            return CargarPickers.tipoRegistrosJson!.count
        }
        
        if pickerView.tag == 3 {
            return CargarPickers.tipoServiciosJson!.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            var ciudadIniSeleccionado = "";
            if let data = CargarPickers.ciudadJson![row] as? Dictionary<String, Any>{
                ciudadIniSeleccionado = (data["ciudad"] as! String?)!;
            }
            return ciudadIniSeleccionado
        }
        
        if pickerView.tag == 2 {
            var tipoRegistroSeleccionado = "";
            if let data = CargarPickers.tipoRegistrosJson![row] as? Dictionary<String, Any>{
                tipoRegistroSeleccionado = (data["descripcion"] as! String?)!;
            }
            return tipoRegistroSeleccionado
        }
        
        if pickerView.tag == 3 {
            var tipoServicioSeleccionado = "";
            if let data = CargarPickers.tipoServiciosJson![row] as? Dictionary<String, Any>{
                tipoServicioSeleccionado = (data["descripcion"] as! String?)!;
            }
            return tipoServicioSeleccionado
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            if let data = CargarPickers.ciudadJson![row] as? Dictionary<String, Any>{
                pickerCiudad.text = (data["ciudad"] as! String?)!;
            }
        }
        
        if pickerView.tag == 2 {
            if let data = CargarPickers.tipoRegistrosJson![row] as? Dictionary<String, Any>{
                pickerTipoRegistro.text = (data["descripcion"] as! String?)!;
            }
        }
        
        if pickerView.tag == 3 {
            if let data = CargarPickers.tipoServiciosJson![row] as? Dictionary<String, Any>{
                pickerTipoServicio.text = (data["descripcion"] as! String?)!;
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
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
