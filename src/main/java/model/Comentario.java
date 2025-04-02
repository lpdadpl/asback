package model;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Comentarios")
public class Comentario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idComentario;
    private String comentario;
    private Date fechaComentario;

    @ManyToOne
    @JoinColumn(name = "idArchivo")
    private Archivo archivo;

    @ManyToOne
    @JoinColumn(name = "idUsuario")
    private Usuario usuario;

    public Integer getIdComentario() { return idComentario; }
    public void setIdComentario(Integer idComentario) { this.idComentario = idComentario; }
    public String getComentario() { return comentario; }
    public void setComentario(String comentario) { this.comentario = comentario; }
    public Date getFechaComentario() { return fechaComentario; }
    public void setFechaComentario(Date fechaComentario) { this.fechaComentario = fechaComentario; }
}