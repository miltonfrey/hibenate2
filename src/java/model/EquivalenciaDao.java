package model;

import java.util.List;
import pojos.Contrato;
import pojos.Equivalencia;

import pojos.Movilidad;


public interface EquivalenciaDao {
    
    public void creaContrato(Contrato c);
    public void modificaContrato(Contrato c);
    public List<Contrato> listaContratos(Movilidad m);
    public void eliminaContrato(Contrato c);
    
    public void insertarEquivalencia(Equivalencia e);
   public void eliminarEquivalencia(Equivalencia e);
    public void actualizarEquivalencia(Equivalencia e);
    public List<Equivalencia> listarEquivalencias();
    //public List<Equivalencia> listarEquivalenciasPorContrato(Integer id);
    public Equivalencia find(Integer id);
    
   // public void insertarMiembroGrupoAsignatura(MiembroGrupoAsignatura m);
    public Contrato findContrato(Integer id);
   public List<Equivalencia> equivalenciasPublicas(String universidad);
   public List<Object[]> listaObject();
}
