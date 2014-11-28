
package model;

import java.util.List;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import pojos.Asignatura;
import pojos.AsignaturaPK;


@Named(value = "asignaturaDaoImpl")
@RequestScoped
public class AsignaturaDaoImpl implements AsignaturaDao{
    @PersistenceContext(unitName = "pruebaHibernate2PU")
    private EntityManager entityManager;
   
    public AsignaturaDaoImpl() {
    }
    
    @Override
    public void crearAsignatura(Asignatura a){
        
        
        
       entityManager.persist(a);
        
        
    }
    @Override
    public void actualizarAsignatura(Asignatura a){
    Asignatura aux=entityManager.getReference(Asignatura.class, a.getAsignaturaPK());
        entityManager.merge(a);
        
    }
    
    @Override
    public List<Asignatura> listarAsignaturas(){
        
        return entityManager.createQuery("select a from Asignatura a").getResultList();
    }
    
    
    @Override
    public List<Asignatura> listarAsignaturasPorUniversidad(String nombre){
        
        Query q=entityManager.createQuery("select a from Asignatura a where a.universidad.nombre=:nombre order by a.universidad.nombre desc" );
        q.setParameter("nombre", nombre);
        return q.getResultList();
        
    }
    
    @Override
    public void eliminaAsignatura(Asignatura a){
       
        entityManager.remove(entityManager.merge(a));
        
    }
    
    @Override
    public List<Asignatura> listarPorCriterio(){
        
        return(entityManager.createQuery("select a from Asignatura a where a."+"periodo=:nombre").setParameter("nombre", "anual").getResultList());
    }
    
    public Asignatura find(AsignaturaPK id){
        
        return(Asignatura)entityManager.createQuery("select a from Asignatura a where a.asignaturaPK=:id").setParameter("id", id).getSingleResult();
    }
    
}

    

