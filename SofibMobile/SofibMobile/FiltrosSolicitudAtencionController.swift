//
//  FiltrosSolicitudAtencionController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 1/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FiltrosSolicitudAtencionController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var pickeConvenio: UITextField!
    @IBOutlet var pickerEstado: UITextField!
    @IBOutlet var pickerCiudadInicial: UITextField!
    @IBOutlet var pickerCiudadFinal: UITextField!
    @IBOutlet var pickerTraslados: UITextField!
    @IBOutlet var lblBusquedaAvanzada: UILabel!
    
    @IBOutlet var txtIdentificacion: UITextField!
    @IBOutlet var txtSolicitudAtencion: UITextField!
    @IBOutlet var txtNombre: UITextField!
    
    /*var convenios = ["SVB-AG", "INSURANCE XYZ", "FATUM HEALTH", "EJEMPLO1", "FATUM SBV"]
     var estados = ["PENDIENTE", "ACEPTADA", "RECHAZADA", "FINALIZADO", "EN ESPERA"]
     var ciudadesIncial = ["CALI", "BOGOTA", "CARTAGENA", "MEDELLIN", "PEREIRA"]
     var ciudadesActual = ["CALI", "BOGOTA", "CARTAGENA", "MEDELLIN", "PEREIRA"]*/
    var traslados = ["SI", "NO"]
    static var solicitudesAtencionJson : NSArray?
    
    let service =  "/solicitudes";
    
    let convenioPickerView = UIPickerView()
    let eestadoPickerView = UIPickerView()
    let ciudadInicialPickerView = UIPickerView()
    let ciudadFinalPickerView = UIPickerView()
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblBusquedaAvanzada.text = NSLocalizedString("busqueda_avanzada", comment: "Busqueda Avanzada")
        txtIdentificacion.placeholder = NSLocalizedString("identificacion", comment: "Identificacion")
        txtSolicitudAtencion.placeholder = NSLocalizedString("solicitud_atencion", comment: "Solicitud Atencion")
        txtNombre.placeholder = NSLocalizedString("nombre", comment: "Nombre")
        
        pickeConvenio.placeholder = NSLocalizedString("seleccionar_convenio", comment: "seleccionar_convenio")
        pickerEstado.placeholder = NSLocalizedString("seleccionar_estado", comment: "seleccionar_estado")
        pickerCiudadInicial.placeholder = NSLocalizedString("seleccionar_ciudad_inicial", comment: "seleccionar_ciudad_inicial")
        pickerCiudadFinal.placeholder = NSLocalizedString("seleccionar_ciudad_actual", comment: "seleccionar_ciudad_actual")
        pickerTraslados.placeholder = NSLocalizedString("seleccionar_traslado", comment: "seleccionar_traslado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtIdentificacion.delegate = self
        self.txtSolicitudAtencion.delegate = self
        self.txtNombre.delegate = self
        
        //Se crea el picker para convenios
        
        convenioPickerView.delegate = self
        convenioPickerView.tag = 1
        pickeConvenio.inputView = convenioPickerView
        //Se crea el picker para estado
        
        eestadoPickerView.delegate = self
        eestadoPickerView.tag = 2
        pickerEstado.inputView = eestadoPickerView
        //Se crea el picker para ciudades iniciales
        
        ciudadInicialPickerView.delegate = self
        ciudadInicialPickerView.tag = 3
        pickerCiudadInicial.inputView = ciudadInicialPickerView
        //Se crea el picker para ciudades finales
        
        ciudadFinalPickerView.delegate = self
        ciudadFinalPickerView.tag = 4
        pickerCiudadFinal.inputView = ciudadFinalPickerView
        //Se crea el picker para traslados
        let trasladoPickerView = UIPickerView()
        trasladoPickerView.delegate = self
        trasladoPickerView.tag = 5
        pickerTraslados.inputView = trasladoPickerView
        
        
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
        
        pickeConvenio.inputAccessoryView = toolBar
        pickerEstado.inputAccessoryView = toolBar
        pickerCiudadInicial.inputAccessoryView = toolBar
        pickerCiudadFinal.inputAccessoryView = toolBar
        pickerTraslados.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePressed(_ sender: UIBarButtonItem) {
        
        pickeConvenio.resignFirstResponder()
        pickerEstado.resignFirstResponder()
        pickerCiudadInicial.resignFirstResponder()
        pickerCiudadFinal.resignFirstResponder()
        pickerTraslados.resignFirstResponder()
        
    }
    
    func tappedToolBarBtn(_ sender: UIBarButtonItem) {
        
        pickeConvenio.text = ""
        pickerEstado.text = ""
        pickerCiudadInicial.text = ""
        pickerCiudadFinal.text = ""
        pickerTraslados.text = ""
        
        pickerEstado.resignFirstResponder()
        pickeConvenio.resignFirstResponder()
        pickerCiudadInicial.resignFirstResponder()
        pickerCiudadFinal.resignFirstResponder()
        pickerTraslados.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return CargarPickers.conveniosJson!.count
        }
        
        if pickerView.tag == 2 {
            return CargarPickers.estadosJson!.count
        }
        
        if pickerView.tag == 3 {
            return CargarPickers.ciudadJson!.count
        }
        
        if pickerView.tag == 4 {
            return CargarPickers.ciudadJson!.count
        }
        
        if pickerView.tag ==  5{
            return traslados.count
        }
        
        return 0
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            var convenioSeleccionado = "";
            if let data = CargarPickers.conveniosJson![row] as? Dictionary<String, Any>{
                convenioSeleccionado = (data["nombre"] as! String?)!;
            }
            return convenioSeleccionado
        }
        
        if pickerView.tag == 2 {
            var estadoSeleccionado = "";
            if let data = CargarPickers.estadosJson![row] as? Dictionary<String, Any>{
                estadoSeleccionado = (data["descripcion"] as! String?)!;
            }
            return estadoSeleccionado
        }
        
        if pickerView.tag == 3 {
            var ciudadIniSeleccionado = "";
            if let data = CargarPickers.ciudadJson![row] as? Dictionary<String, Any>{
                ciudadIniSeleccionado = (data["ciudad"] as! String?)!;
            }
            return ciudadIniSeleccionado
        }
        
        if pickerView.tag == 4 {
            var ciudadFinSeleccionado = "";
            if let data = CargarPickers.ciudadJson![row] as? Dictionary<String, Any>{
                ciudadFinSeleccionado = (data["ciudad"] as! String?)!;
            }
            return ciudadFinSeleccionado
        }
        
        if pickerView.tag == 5 {
            return traslados[row]
        }
        
        return nil
    }
    
    @IBAction func consumirServicio(_ sender: AnyObject) {
        
        var convenio = "0";
        var estado = "0";
        var ciudadInicial = "0";
        var ciudadActual = "0";
        var traslado = "NA";
        var identificacion = "0";
        var solAtencion = "0";
        var nombre = "0";
        
        if((pickeConvenio.text) != nil && (pickeConvenio.text) != ""){
            if let data = CargarPickers.conveniosJson![convenioPickerView.selectedRow(inComponent: 0)] as? Dictionary<String, Any>{
               convenio = (data["codigo"] as! String?)!
            }
        }
        
        if((pickerEstado.text) != nil && (pickerEstado.text) != ""){
            if let data = CargarPickers.estadosJson![eestadoPickerView.selectedRow(inComponent: 0)] as? Dictionary<String, Any>{
                estado = (data["codigo"] as! String?)!;
            }
        }
        
        if((pickerCiudadInicial.text) != nil && (pickerCiudadInicial.text) != ""){
            if let data = CargarPickers.ciudadJson![ciudadInicialPickerView.selectedRow(inComponent: 0)] as? Dictionary<String, Any>{
                ciudadInicial = (data["codigo"] as! String?)!;
            }
        }
        
        if((pickerCiudadFinal.text) != nil && (pickerCiudadFinal.text) != ""){
            if let data = CargarPickers.ciudadJson![ciudadFinalPickerView.selectedRow(inComponent: 0)] as? Dictionary<String, Any>{
                ciudadActual = (data["codigo"] as! String?)!;
            }
        }
        
        if((txtIdentificacion.text) != nil && (txtIdentificacion.text) != ""){
            identificacion = txtIdentificacion.text!
        }
        
        if((txtSolicitudAtencion.text) != nil && (txtSolicitudAtencion.text) != ""){
            solAtencion = txtSolicitudAtencion.text!
        }
        
        if((txtNombre.text) != nil && (txtNombre.text) != ""){
            nombre = txtNombre.text!
        }
        
        if((pickerTraslados.text) != nil && (pickerTraslados.text) != ""){
            if (pickerTraslados.text == "SI") {
                traslado = "1";
            }else{
                traslado = "0";
            }
        }

        var listParams: String = "/SAC/ABCD1234/0";
        listParams+="/"+solAtencion;
        listParams+="/"+nombre;
        listParams+="/"+convenio;
        listParams+="/"+estado;
        listParams+="/"+ciudadInicial;
        listParams+="/"+ciudadActual;
        listParams+="/"+traslado;
        
        let url = URL(string: PropertiesProject.URL+service+listParams)
        print(PropertiesProject.URL+service+listParams)
        
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
                        FiltrosSolicitudAtencionController.solicitudesAtencionJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                        DispatchQueue.main.async {
                            if ((FiltrosSolicitudAtencionController.solicitudesAtencionJson) != nil && (FiltrosSolicitudAtencionController.solicitudesAtencionJson?.count)!>0){
                                let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "consultaSolicitudAtencionView")
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
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            if let data = CargarPickers.conveniosJson![row] as? Dictionary<String, Any>{
                pickeConvenio.text = data["nombre"] as! String?;
            }
            
        }
        
        if pickerView.tag == 2 {
            if let data = CargarPickers.estadosJson![row] as? Dictionary<String, Any>{
                pickerEstado.text = data["descripcion"] as! String?;
            }
        }
        
        if pickerView.tag == 3 {
            if let data = CargarPickers.ciudadJson![row] as? Dictionary<String, Any>{
                pickerCiudadInicial.text = data["ciudad"] as! String?;
            }
        }
        
        if pickerView.tag == 4 {
            if let data = CargarPickers.ciudadJson![row] as? Dictionary<String, Any>{
                pickerCiudadFinal.text = data["ciudad"] as! String?;
            }
        }
        
        if pickerView.tag == 5 {
            pickerTraslados.text = traslados[row]
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
