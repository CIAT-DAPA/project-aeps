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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * OrganicControls generated by hbm2java
 */
@Entity
@Table(name="organic_controls")
public class OrganicControls  implements java.io.Serializable {


     private Integer idOrgCon;
     private TargetsTypes targetsTypes;
     private String nameOrgCon;
     private IdiomCountry countryOrgCon;

    public OrganicControls() {
    }

    public OrganicControls(Integer idOrgCon, String nameOrgCon) {
        this.idOrgCon   = idOrgCon;
        this.nameOrgCon = nameOrgCon;
    }
	
    public OrganicControls(TargetsTypes targetsTypes, String nameOrgCon) {
        this.targetsTypes = targetsTypes;
        this.nameOrgCon = nameOrgCon;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_org_con", unique=true, nullable=false)
    public Integer getIdOrgCon() {
        return this.idOrgCon;
    }
    
    public void setIdOrgCon(Integer idOrgCon) {
        this.idOrgCon = idOrgCon;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="target_type_org_con", nullable=false)
    public TargetsTypes getTargetsTypes() {
        return this.targetsTypes;
    }
    
    public void setTargetsTypes(TargetsTypes targetsTypes) {
        this.targetsTypes = targetsTypes;
    }
    
    @Column(name="name_org_con", nullable=false, length=50)
    public String getNameOrgCon() {
        return this.nameOrgCon;
    }
    
    public void setNameOrgCon(String nameOrgCon) {
        this.nameOrgCon = nameOrgCon;
    }
    
    @ManyToOne
    @JoinColumn(name="country_org_con")
    public IdiomCountry getCountryOrgCon() {
        return this.countryOrgCon;
    }
    
    public void setCountryOrgCon(IdiomCountry countryOrgCon) {
        this.countryOrgCon = countryOrgCon;
    }

}


