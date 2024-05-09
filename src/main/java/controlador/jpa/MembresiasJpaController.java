/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador.jpa;

import controlador.jpa.exceptions.NonexistentEntityException;
import dto.Membresias;
import java.io.Serializable;
import jakarta.persistence.Query;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import dto.Paquetes;
import dto.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;

/**
 *
 * @author Lucy
 */
public class MembresiasJpaController implements Serializable {

    public MembresiasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Membresias membresias) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paquetes paquetesId = membresias.getPaquetesId();
            if (paquetesId != null) {
                paquetesId = em.getReference(paquetesId.getClass(), paquetesId.getId());
                membresias.setPaquetesId(paquetesId);
            }
            Users usersId = membresias.getUsersId();
            if (usersId != null) {
                usersId = em.getReference(usersId.getClass(), usersId.getId());
                membresias.setUsersId(usersId);
            }
            em.persist(membresias);
            if (paquetesId != null) {
                paquetesId.getMembresiasList().add(membresias);
                paquetesId = em.merge(paquetesId);
            }
            if (usersId != null) {
                usersId.getMembresiasList().add(membresias);
                usersId = em.merge(usersId);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Membresias membresias) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Membresias persistentMembresias = em.find(Membresias.class, membresias.getId());
            Paquetes paquetesIdOld = persistentMembresias.getPaquetesId();
            Paquetes paquetesIdNew = membresias.getPaquetesId();
            Users usersIdOld = persistentMembresias.getUsersId();
            Users usersIdNew = membresias.getUsersId();
            if (paquetesIdNew != null) {
                paquetesIdNew = em.getReference(paquetesIdNew.getClass(), paquetesIdNew.getId());
                membresias.setPaquetesId(paquetesIdNew);
            }
            if (usersIdNew != null) {
                usersIdNew = em.getReference(usersIdNew.getClass(), usersIdNew.getId());
                membresias.setUsersId(usersIdNew);
            }
            membresias = em.merge(membresias);
            if (paquetesIdOld != null && !paquetesIdOld.equals(paquetesIdNew)) {
                paquetesIdOld.getMembresiasList().remove(membresias);
                paquetesIdOld = em.merge(paquetesIdOld);
            }
            if (paquetesIdNew != null && !paquetesIdNew.equals(paquetesIdOld)) {
                paquetesIdNew.getMembresiasList().add(membresias);
                paquetesIdNew = em.merge(paquetesIdNew);
            }
            if (usersIdOld != null && !usersIdOld.equals(usersIdNew)) {
                usersIdOld.getMembresiasList().remove(membresias);
                usersIdOld = em.merge(usersIdOld);
            }
            if (usersIdNew != null && !usersIdNew.equals(usersIdOld)) {
                usersIdNew.getMembresiasList().add(membresias);
                usersIdNew = em.merge(usersIdNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = membresias.getId();
                if (findMembresias(id) == null) {
                    throw new NonexistentEntityException("The membresias with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Membresias membresias;
            try {
                membresias = em.getReference(Membresias.class, id);
                membresias.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The membresias with id " + id + " no longer exists.", enfe);
            }
            Paquetes paquetesId = membresias.getPaquetesId();
            if (paquetesId != null) {
                paquetesId.getMembresiasList().remove(membresias);
                paquetesId = em.merge(paquetesId);
            }
            Users usersId = membresias.getUsersId();
            if (usersId != null) {
                usersId.getMembresiasList().remove(membresias);
                usersId = em.merge(usersId);
            }
            em.remove(membresias);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Membresias> findMembresiasEntities() {
        return findMembresiasEntities(true, -1, -1);
    }

    public List<Membresias> findMembresiasEntities(int maxResults, int firstResult) {
        return findMembresiasEntities(false, maxResults, firstResult);
    }

    private List<Membresias> findMembresiasEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Membresias.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Membresias findMembresias(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Membresias.class, id);
        } finally {
            em.close();
        }
    }

    public int getMembresiasCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Membresias> rt = cq.from(Membresias.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
