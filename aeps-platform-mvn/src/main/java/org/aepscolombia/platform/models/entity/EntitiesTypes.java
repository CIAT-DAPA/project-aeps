package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * EntitiesTypes generated by hbm2java
 */
@Entity
@Table(name="entities_types")
public class EntitiesTypes  implements java.io.Serializable {


     private Integer idEntTyp;
     private String nameEntTyp;
     private Boolean statusEntTyp;

    public EntitiesTypes() {
    }

    public EntitiesTypes(Integer idEntTyp) {
        this.idEntTyp = idEntTyp;
    }
	
    public EntitiesTypes(String nameEntTyp, Boolean statusEntTyp) {
        this.nameEntTyp   = nameEntTyp;
        this.statusEntTyp = statusEntTyp;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_ent_typ", unique=true, nullable=false)
    public Integer getIdEntTyp() {
        return this.idEntTyp;
    }
    
    public void setIdEntTyp(Integer idEntTyp) {
        this.idEntTyp = idEntTyp;
    }
    
    @Column(name="name_ent_typ", nullable=false, length=45)
    public String getNameEntTyp() {
        return this.nameEntTyp;
    }
    
    public void setNameEntTyp(String nameEntTyp) {
        this.nameEntTyp = nameEntTyp;
    }
    
    @Column(name="status_ent_typ")
    public Boolean getStatusEntTyp() {
        return this.statusEntTyp;
    }
    
    public void setStatusEntTyp(Boolean statusEntTyp) {
        this.statusEntTyp = statusEntTyp;
    }

}


