package com.mkproducts.project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "crop_advisory")
public class CropAdvisory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String season;                 // Kharif, Rabi, Summer, etc.
    private String cropName;               // Rice, Wheat, Millets
    private String waterRequirement;       // High, Medium, Low
    private String fertilizer;             // Text description
    @Column(length = 1000)
    private String recommendedConditions;  // Longer text

    public CropAdvisory() {
    }

    public CropAdvisory(String season, String cropName, String waterRequirement,
                        String fertilizer, String recommendedConditions) {
        this.season = season;
        this.cropName = cropName;
        this.waterRequirement = waterRequirement;
        this.fertilizer = fertilizer;
        this.recommendedConditions = recommendedConditions;
    }

    public Long getId() {
        return id;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getCropName() {
        return cropName;
    }

    public void setCropName(String cropName) {
        this.cropName = cropName;
    }

    public String getWaterRequirement() {
        return waterRequirement;
    }

    public void setWaterRequirement(String waterRequirement) {
        this.waterRequirement = waterRequirement;
    }

    public String getFertilizer() {
        return fertilizer;
    }

    public void setFertilizer(String fertilizer) {
        this.fertilizer = fertilizer;
    }

    public String getRecommendedConditions() {
        return recommendedConditions;
    }

    public void setRecommendedConditions(String recommendedConditions) {
        this.recommendedConditions = recommendedConditions;
    }
}
