/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.com.lab6;

import java.io.Serializable;

/**
 *
 * @author adm1n
 */
public class Modelbook implements Serializable{
    private int id;
    private String title;
    private float price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Modelbook() {
    }

    public Modelbook(int id, String title, float price) {
        this.id = id;
        this.title = title;
        this.price = price;
    }

   
    
    
    
}
