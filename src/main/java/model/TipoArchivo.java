package model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "TiposArchivos")
public class TipoArchivo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTipoArchivo;
    private String tipoArchivo;
    private String descripcion;

    public Integer getIdTipoArchivo() { return idTipoArchivo; }
    public void setIdTipoArchivo(Integer idTipoArchivo) { this.idTipoArchivo = idTipoArchivo; }
    public String getTipoArchivo() { return tipoArchivo; }
    public void setTipoArchivo(String tipoArchivo) { this.tipoArchivo = tipoArchivo; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
}
