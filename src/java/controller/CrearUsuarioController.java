
package controller;

import java.io.Serializable;
import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;

import model.UsuarioService;
import org.apache.commons.mail.EmailException;
import pojos.Usuario;

import utils.BeanUtilidades;


@Named(value = "crearUsuarioController")
@ViewScoped
public class CrearUsuarioController implements Serializable{

    
    @EJB
    private UsuarioService usuarioService;
    
    @Inject
    private BeanUtilidades beanUtilidades;
    
    public CrearUsuarioController() {
    }
    
    private String login;
    private String password;
    private String passwordAux;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private Usuario user;
    private String titulacion;
    private ArrayList<String> listaTitulaciones;
    
   
    
    @PostConstruct
    public void init(){
        
        ArrayList<String>aux=new ArrayList<String>();
        aux.add("GEI");
        aux.add("MUEI");
        setListaTitulaciones(aux);
    }
    
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordAux() {
        return passwordAux;
    }

    public void setPasswordAux(String passwordAux) {
        this.passwordAux = passwordAux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public String getTitulacion() {
        return titulacion;
    }

    public void setTitulacion(String titulacion) {
        this.titulacion = titulacion;
    }

    public ArrayList<String> getListaTitulaciones() {
        return listaTitulaciones;
    }

    public void setListaTitulaciones(ArrayList<String> listaTitulaciones) {
        this.listaTitulaciones = listaTitulaciones;
    }
    
    
    
    
    public String creaUsuario(){
        
        Usuario u=new Usuario();
        u.setLogin(login);
        password=usuarioService.generarPassword();
        password=password.substring(0, 8);
        u.setPassword(usuarioService.md5Password(password));
        short s=1;
        u.setTipoUsuario(s);
        u.setNombre(nombre);
        u.setApellido1(apellido1);
        u.setApellido2(apellido2);
        u.setTitulacion(titulacion);
        
        
         
        
        
        try{
        usuarioService.insertarUsuario(u);
        }catch(RuntimeException ex){
            beanUtilidades.creaMensaje("ya existe ese login", FacesMessage.SEVERITY_ERROR);
            return null;
            
                }
       try{
            
            usuarioService.enviarEmail(login,password);
            
        }catch(EmailException ex){
            ex.printStackTrace();
            beanUtilidades.creaMensaje("se ha producido un error", FacesMessage.SEVERITY_ERROR);
            return null;
        }
        
        
        beanUtilidades.creaMensaje("usuario creado y se ha enviado un correo a la cuenta "+login+"@udc.es con la contraseña", FacesMessage.SEVERITY_INFO);
        
        login="";
        nombre="";
        apellido1="";
        apellido2="";
        titulacion="";
        password="";
            return null;
        
    }
    
    
    
    
    
    
    
}
