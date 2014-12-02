package model;

import exceptions.PasswordIncorrectoException;
import exceptions.UsuarioNotFoundException;
import java.util.List;
import javax.ejb.Local;
import org.apache.commons.mail.EmailException;

import pojos.Usuario;

@Local
public interface UsuarioService {    
    public Usuario find(String nombre)throws UsuarioNotFoundException;
    public void delete(Usuario u) throws UsuarioNotFoundException;
    public List<Usuario> listar();
    
    public void insertarUsuario(Usuario u);
    public void actualizar(Usuario u);
    public String md5Password(String password);
    public void autenticarUsuario(String password,Usuario u) throws PasswordIncorrectoException;
    public void autenticarAdmin(String password,Usuario u) throws PasswordIncorrectoException;
    public void enviarEmail(String login,String password) throws EmailException;
    public String generarPassword();
}
