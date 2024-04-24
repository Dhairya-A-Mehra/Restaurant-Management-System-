/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author mpdha
 */
public class DatabaseCredentials {
    private static String uname = "root";
    private static String pass = "Dhwani1611@"; //enter your mysql password here
    private static String url = "jdbc:mysql://127.0.0.1:3306/rms";

    public static String getUname() {
        return uname;
    }
    public static String getPass() {
        return pass;
    }
    public static String getUrl() {
        return url;
    }
}