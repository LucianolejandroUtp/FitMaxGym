/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gym.fitmax.config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

/**
 *
 * @author Lucy
 */
public class JpaConfig {
    
    private static final String PERSISTENCE_UNIT_NAME = "fitmax_gym_pu";
    private static EntityManagerFactory emf;

    public static EntityManagerFactory getEntityManagerFactory() {
        if (emf == null) {
            synchronized (JpaConfig.class) {
                if (emf == null) {
                    emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
                }
            }
        }
        return emf;
    }

    public static void closeEntityManagerFactory() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
