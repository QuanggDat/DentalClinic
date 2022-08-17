/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.services;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class ServiceDTO {

    private int serviceID;
    private String serviceName;
    private String demo;
    private String title1;
    private String title2;
    private String title3;
    private String description1;
    private String description2;
    private String description3;
    private String title1_img;
    private String title2_img;
    private String title3_img;
    private String service_img;

    public ServiceDTO() {
    }

    public ServiceDTO(int serviceID, String serviceName, String demo, String title1, String title2, String title3, String description1, String description2, String description3, String title1_img, String title2_img, String title3_img, String service_img) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.demo = demo;
        this.title1 = title1;
        this.title2 = title2;
        this.title3 = title3;
        this.description1 = description1;
        this.description2 = description2;
        this.description3 = description3;
        this.title1_img = title1_img;
        this.title2_img = title2_img;
        this.title3_img = title3_img;
        this.service_img = service_img;
    }
    
    public ServiceDTO(int serviceID) {
        this.serviceID = serviceID;
    }
    
    public ServiceDTO(String serviceName, String demo, String title1, String title2, String title3, String description1, String description2, String description3, String title1_img, String title2_img, String title3_img, String service_img) {
        this.serviceName = serviceName;
        this.demo = demo;
        this.title1 = title1;
        this.title2 = title2;
        this.title3 = title3;
        this.description1 = description1;
        this.description2 = description2;
        this.description3 = description3;
        this.title1_img = title1_img;
        this.title2_img = title2_img;
        this.title3_img = title3_img;
        this.service_img = service_img;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo;
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1;
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2;
    }

    public String getTitle3() {
        return title3;
    }

    public void setTitle3(String title3) {
        this.title3 = title3;
    }

    public String getDescription1() {
        return description1;
    }

    public void setDescription1(String description1) {
        this.description1 = description1;
    }

    public String getDescription2() {
        return description2;
    }

    public void setDescription2(String description2) {
        this.description2 = description2;
    }

    public String getDescription3() {
        return description3;
    }

    public void setDescription3(String description3) {
        this.description3 = description3;
    }

    public String getTitle1_img() {
        return title1_img;
    }

    public void setTitle1_img(String title1_img) {
        this.title1_img = title1_img;
    }

    public String getTitle2_img() {
        return title2_img;
    }

    public void setTitle2_img(String title2_img) {
        this.title2_img = title2_img;
    }

    public String getTitle3_img() {
        return title3_img;
    }

    public void setTitle3_img(String title3_img) {
        this.title3_img = title3_img;
    }

    public String getService_img() {
        return service_img;
    }

    public void setService_img(String service_img) {
        this.service_img = service_img;
    }
    
    

}
