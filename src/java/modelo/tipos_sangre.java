/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Javier_Prado
 */
public class tipos_sangre {
    
    private String id_tipos_sangre, sangre;
    Conexion cn;

    public tipos_sangre() {
    }

    public tipos_sangre(String id_tipos_sangre, String sangre) {
        this.id_tipos_sangre = id_tipos_sangre;
        this.sangre = sangre;
    }

    public String getId_tipos_sangre() {
        return id_tipos_sangre;
    }

    public void setId_tipos_sangre(String id_tipos_sangre) {
        this.id_tipos_sangre = id_tipos_sangre;
    }

    public String getSangre() {
        return sangre;
    }

    public void setSangre(String sangre) {
        this.sangre = sangre;
    }
    
    
         public HashMap drop_sangre(){
    HashMap<String,String> drop = new HashMap();
    try{
        String query ="SELECT  id_tipo_sangre as id,sangre FROM tipos_sangre;";
         cn = new Conexion();
         cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
            drop.put(consulta.getString("id"),consulta.getString("sangre") );
            }
         cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    return drop;
    }
    
    
}
