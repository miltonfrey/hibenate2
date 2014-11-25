/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import pojos.Cursoacademico;
import pojos.Pais;
import pojos.Universidad;

/**
 *
 * @author cba
 */
@Named(value = "universidadDaoImpl")
@RequestScoped
public class UniversidadDaoImpl implements UniversidadDao{

     @PersistenceContext(unitName = "pruebaHibernate2PU")
    private EntityManager entityManager;
    
      public UniversidadDaoImpl() {
    }
    
    
   
    
    @Override
    public List<Pais> listaPaises(){
        
        return entityManager.createQuery("select p from Pais p order by p.nombre asc").getResultList();
        
        
    }
    @Override
    public List<Universidad> listaUniversidades(){
        
        return entityManager.createQuery("select u from Universidad u order by u.nombre asc").getResultList();
    }
    
    
    @Override
    public Pais findPais(String pais){
        
        return (Pais) entityManager.createQuery("select p from Pais p where p.nombre=:pais order by p.nombre asc").setParameter("pais", pais).getSingleResult();
       
    }
    
    
   @Override
    public void insertarPais(Pais p){
        
        entityManager.persist(p);
        
    }
        
    @Override
    public void deletePais(Pais p){
        entityManager.remove(entityManager.merge(p));
    }
    
    
    @Override
    public void delete(Universidad u){
         u=entityManager.getReference(Universidad.class, u.getNombre());
        entityManager.remove(entityManager.merge(u));
    }
    @Override
    public List<Universidad> listarUniversidades(){
        
        return(entityManager.createQuery("select u from Universidad u").getResultList());
        
    }
    
    @Override
    public void insertarCarrera(Universidad u){
        
       entityManager.persist(u);
        
    }
    
    @Override
    public void actualizar(Universidad u){
        
        entityManager.merge(u);
    }
    
    
    @Override
    public List<Universidad> listarPorUniversidad(String universidad){
    
    Query q=entityManager.createQuery("select u from Universidad u where u.nombre=:universidad");
    q.setParameter("universidad",universidad);
    return(q.getResultList());
}
    
   /* @Override
    public List<String> listarPorUniversidadStr(String universidad){
        
        Query q=entityManager.createQuery("select distinct c.id.nombre from Universidad c where c.id.universidad=:universidad");
    q.setParameter("universidad",universidad);
    return(q.getResultList());
    }
    */
    @Override
     public List<Universidad> listarPorPais(String pais){
    
    Query q=entityManager.createQuery("select u from Universidad u where u.pais.nombre=:pais");
    q.setParameter("pais",pais);
    return(q.getResultList());
}
    
    
     @Override
     public void crearCursoAcademico(Cursoacademico c){
         
         entityManager.merge(c);
         
     }
     
     @Override
     public void eliminarCursoAcademico(Cursoacademico c){
         
         entityManager.remove(entityManager.merge(c));
         
     }
     @Override
    public List<Cursoacademico> listaCursosAcademicos(){
        
        return entityManager.createQuery("select c from Cursoacademico c order by c.cursoAcademico").getResultList();
        
    }
    
    @Override
    public Universidad findUniversidad(String universidad){
        
        Query q=entityManager.createQuery("select u from Universidad u where u.nombre=:universidad");
        q.setParameter("universidad", universidad);
        return (Universidad)q.getSingleResult();
        
    }
}
    
    
    

