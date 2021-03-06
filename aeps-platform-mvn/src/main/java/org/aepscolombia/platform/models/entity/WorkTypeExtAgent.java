package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * PersonType generated by hbm2java
 */
@Entity
@Table(name="work_type_ext_agent")
public class WorkTypeExtAgent  implements java.io.Serializable {


     private Integer idWorTyp;
     private String desWorTyp;
     private IdiomCountry countryWorTyp;

    public WorkTypeExtAgent() {
    }

    public WorkTypeExtAgent(Integer idWorTyp) {
        this.idWorTyp = idWorTyp;
    }
	
    public WorkTypeExtAgent(String desWorTyp) {
        this.desWorTyp = desWorTyp;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_wor_typ", unique=true, nullable=false)
    public Integer getIdWorTyp() {
        return this.idWorTyp;
    }
    
    public void setIdWorTyp(Integer idWorTyp) {
        this.idWorTyp = idWorTyp;
    }
    
    @Column(name="des_wor_typ", nullable=false, length=50)
    public String getDesWorTyp() {
        return this.desWorTyp;
    }
    
    public void setDesWorTyp(String desWorTyp) {
        this.desWorTyp = desWorTyp;
    }
    
    @ManyToOne
    @JoinColumn(name="country_wor_typ")
    public IdiomCountry getCountryWorTyp() {
        return this.countryWorTyp;
    }
    
    public void setCountryWorTyp(IdiomCountry countryWorTyp) {
        this.countryWorTyp = countryWorTyp;
    }

}


