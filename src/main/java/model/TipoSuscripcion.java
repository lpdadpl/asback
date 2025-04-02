package model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "TipoSuscripcion")
public class TipoSuscripcion {
    @Id
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTipoSuscripcion;
    private String suscripcion;
    private String descripcion;
    private Double precio;

    public Integer getIdTipoSuscripcion() { return idTipoSuscripcion; }
    public void setIdTipoSuscripcion(Integer idTipoSuscripcion) { this.idTipoSuscripcion = idTipoSuscripcion; }
    public String getSuscripcion() { return suscripcion; }
    public void setSuscripcion(String suscripcion) { this.suscripcion = suscripcion; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public Double getPrecio() { return precio; }
    public void setPrecio(Double precio) { this.precio = precio; }
}