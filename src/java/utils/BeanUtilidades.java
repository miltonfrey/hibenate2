
package utils;


import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import pojos.Cursoacademico;
import pojos.Estado;
import pojos.EstadoMovilidad;


@Named(value = "beanUtilidades")
@RequestScoped
public class BeanUtilidades implements Serializable{

    
    public BeanUtilidades() {
    }
   
    @EJB
    private UtilidadService utilidadService;
    
    private List<Estado> listaEstados;
    private String estado;
    
    private List<EstadoMovilidad> listaEstadosMovilidad;
    private String estadoMovilidad;
    
    private String cursoAcademico;
    private List<Cursoacademico> listaCursoAcademico;
    
    
    
    
    
    @PostConstruct
    public void init(){
        HttpServletRequest request=(HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
        
       
            
            setListaEstados(utilidadService.listaEstados());
       
            setListaEstadosMovilidad(utilidadService.listaEstadosMovilidad());
            setListaCursoAcademico(utilidadService.listaCursoAcademico());
        
    }

   

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    

    public String getEstadoMovilidad() {
        return estadoMovilidad;
    }

    public void setEstadoMovilidad(String estadoMovilidad) {
        this.estadoMovilidad = estadoMovilidad;
    }

    public String getCursoAcademico() {
        return cursoAcademico;
    }

    public void setCursoAcademico(String cursoAcademico) {
        this.cursoAcademico = cursoAcademico;
    }

    public List<Estado> getListaEstados() {
        return listaEstados;
    }

    public void setListaEstados(List<Estado> listaEstados) {
        this.listaEstados = listaEstados;
    }

    public List<EstadoMovilidad> getListaEstadosMovilidad() {
        return listaEstadosMovilidad;
    }

    public void setListaEstadosMovilidad(List<EstadoMovilidad> listaEstadosMovilidad) {
        this.listaEstadosMovilidad = listaEstadosMovilidad;
    }

    public List<Cursoacademico> getListaCursoAcademico() {
        return listaCursoAcademico;
    }

    public void setListaCursoAcademico(List<Cursoacademico> listaCursoAcademico) {
        this.listaCursoAcademico = listaCursoAcademico;
    }

    
    
    
    
    
    
    public String creaEstado(){
        
        Estado e=new Estado(estado);
        try{
        utilidadService.crearEstado(e);
        }catch(Exception ex){
            creaMensaje("El estado ya existe", FacesMessage.SEVERITY_ERROR);
            estado="";
            return null;
        }
        creaMensaje("estado creado o modificado", FacesMessage.SEVERITY_INFO);
        setListaEstados(utilidadService.listaEstados());
        estado="";
        return null;
        
        
    }
    
    
    public String eliminaEstado(){
        
        Estado e=new Estado(estado);
        
        try{
        utilidadService.eliminaEstado(e);
        }catch(Exception ex){
            creaMensaje("se ha producido un error", FacesMessage.SEVERITY_ERROR);
            return null;
        }
        
        creaMensaje("estado eliminado", FacesMessage.SEVERITY_INFO);
        estado="";
        setListaEstados(utilidadService.listaEstados());
        return null;
    }
    
    
    public String creaEstadoMovilidad(){
        EstadoMovilidad e=new EstadoMovilidad(estadoMovilidad);
        try{
        utilidadService.crearEstadoMovilidad(e);
        }catch(Exception ex){
            creaMensaje("El estado de la movilidad ya existe", FacesMessage.SEVERITY_ERROR);
            estadoMovilidad="";
            return null;
        }
        creaMensaje("estado guardado", FacesMessage.SEVERITY_INFO);
        listaEstadosMovilidad=(utilidadService.listaEstadosMovilidad());
        estadoMovilidad="";
        return null;
    }
    
    public String eliminaEstadoMovilidad(){
        EstadoMovilidad e=new EstadoMovilidad(estadoMovilidad);
        try{
            utilidadService.eliminaEstadoMovilidad(e);
            
        }catch(Exception ex){
            
            creaMensaje("se ha producido un error", FacesMessage.SEVERITY_ERROR);
            return null;
        }
        
        creaMensaje("estado eliminado", FacesMessage.SEVERITY_INFO);
        listaEstadosMovilidad=(utilidadService.listaEstadosMovilidad());
        estadoMovilidad="";
        return null;
    }
    
   
    
    public String creaCursoAcademico(){
      
      if(cursoAcademico.substring(0, 4).compareTo(cursoAcademico.substring(5, 9))!=-1){
          
          creaMensaje("el curso académico no puede empezar más tarde de lo que acaba",FacesMessage.SEVERITY_ERROR);
          return null;
      }
      
      try{
          Cursoacademico c=new Cursoacademico(cursoAcademico);
          cursoAcademico="";
          utilidadService.crearCursoAcademico(c);
          
      }catch(Exception ex){
          
          creaMensaje("El año "+cursoAcademico+" ya existe", FacesMessage.SEVERITY_ERROR);
          return null;
      }
        creaMensaje("curso creado correctamente", FacesMessage.SEVERITY_INFO);
        cursoAcademico="";
        setListaCursoAcademico(utilidadService.listaCursoAcademico());
      return null;
    }
      
    
    
    public String eliminaCursoAcademico(){
        
        Cursoacademico c=new Cursoacademico(cursoAcademico);
         try{
        utilidadService.eliminaCursoAcademico(c);
    }catch(Exception ex){
            creaMensaje("se ha producido un error", FacesMessage.SEVERITY_ERROR);
            return null;
            
    }
         cursoAcademico="";
         setListaCursoAcademico(utilidadService.listaCursoAcademico());
        creaMensaje("curso académico eliminado correctamente", FacesMessage.SEVERITY_INFO);
        return null;
    }
        
    
        
    
    
    
    
     public void creaMensaje(String texto,FacesMessage.Severity s){
            
            FacesContext context=FacesContext.getCurrentInstance();
            FacesMessage message=new FacesMessage(texto);
            message.setSeverity(s);
            context.addMessage(null, message);
        }
    
     
     public void request(){
         
         HttpServletRequest request=(HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
         creaMensaje(request.getRequestURI(), FacesMessage.SEVERITY_INFO);
     }
     
     
    public String salir(){
            
            
            
            HttpSession session=(HttpSession)FacesContext.getCurrentInstance().getExternalContext().getSession(false);
            session.invalidate();
            return("/principal.xhtml?faces-redirect=true");
            
            
        }
    
}

    


