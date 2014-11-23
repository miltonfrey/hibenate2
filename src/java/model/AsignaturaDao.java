package model;

import java.util.List;
import pojos.Asignatura;


public interface AsignaturaDao{
    
    public void crearAsignatura(Asignatura a);
    public List<Asignatura> listarAsignaturas();
    public List<Asignatura> listarAsignaturasPorUniversidad(String codUniversidad);
    public void eliminaAsignatura(Asignatura a);
    public void actualizarAsignatura(Asignatura a);
    public List<Asignatura> listarPorCriterio();
}
