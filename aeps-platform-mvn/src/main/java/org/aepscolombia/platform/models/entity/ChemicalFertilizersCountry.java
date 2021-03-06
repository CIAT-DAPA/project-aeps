package org.aepscolombia.platform.models.entity;
// Generated Oct 28, 2015 2:25:44 PM by Hibernate Tools 3.6.0


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ChemicalFertilizersCountry generated by hbm2java
 */
@Entity
@Table(name="chemical_fertilizers_country")
public class ChemicalFertilizersCountry  implements java.io.Serializable {


     private Integer idCheFerCo;
     private IdiomCountry idiomCountry;
     private ChemicalFertilizers chemicalFertilizers;

    public ChemicalFertilizersCountry() {
    }

    public ChemicalFertilizersCountry(IdiomCountry idiomCountry, ChemicalFertilizers chemicalFertilizers) {
       this.idiomCountry = idiomCountry;
       this.chemicalFertilizers = chemicalFertilizers;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id_che_fer_co", unique=true, nullable=false)
    public Integer getIdCheFerCo() {
        return this.idCheFerCo;
    }
    
    public void setIdCheFerCo(Integer idCheFerCo) {
        this.idCheFerCo = idCheFerCo;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="country_che_fer_co")
    public IdiomCountry getIdiomCountry() {
        return this.idiomCountry;
    }
    
    public void setIdiomCountry(IdiomCountry idiomCountry) {
        this.idiomCountry = idiomCountry;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_selfer_che_fer_co")
    public ChemicalFertilizers getChemicalFertilizers() {
        return this.chemicalFertilizers;
    }
    
    public void setChemicalFertilizers(ChemicalFertilizers chemicalFertilizers) {
        this.chemicalFertilizers = chemicalFertilizers;
    }




}



