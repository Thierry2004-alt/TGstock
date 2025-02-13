/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.tgstock;
import Authentication.loginpage;
/**
 *
 * @author onana
 */
public class TGstock {
    String name;
    public void getUser(String user){
        this.name=user;
    }
    public String display(){
        return name;
    }

    public static void main(String[] args) {
        System.out.println("Hello World!");
        loginpage lp=new loginpage();
        lp.setVisible(true);
    }
}
