package br.com.promocaosocial.model;
// Generated 29/06/2017 16:08:32 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Grupofamiliar generated by hbm2java
 */
public class Grupofamiliar  implements java.io.Serializable {
    
     private long id;
     private long nis;
     private String nomeresponsavel;
     private String bairro;
     private String telefone;
     private Date data;
     private String paif;
     private String sexo;
     private String status;

    public Grupofamiliar() {
    }

    public Grupofamiliar(long id, long nis, String nomeresponsavel, String bairro, String telefone, Date data, String paif, String sexo, String status) {
       this.id = id;
       this.nis = nis;
       this.nomeresponsavel = nomeresponsavel;
       this.bairro = bairro;
       this.telefone = telefone;
       this.data = data;
       this.paif = paif;
       this.sexo = sexo;
       this.status = status;
    }
   
    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    public long getNis() {
        return this.nis;
    }
    
    public void setNis(long nis) {
        this.nis = nis;
    }
    public String getNomeresponsavel() {
        return this.nomeresponsavel;
    }
    
    public void setNomeresponsavel(String nomeresponsavel) {
        this.nomeresponsavel = nomeresponsavel;
    }
    public String getBairro() {
        return this.bairro;
    }
    
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }
    public String getTelefone() {
        return this.telefone;
    }
    
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    public Date getData() {
        return this.data;
    }
    
    public void setData(Date data) {
        this.data = data;
    }
    public String getPaif() {
        return this.paif;
    }
    
    public void setPaif(String paif) {
        this.paif = paif;
    }
    public String getSexo() {
        return this.sexo;
    }
    
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


