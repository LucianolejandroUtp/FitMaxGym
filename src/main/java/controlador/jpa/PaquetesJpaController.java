/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador.jpa;

import controlador.jpa.exceptions.NonexistentEntityException;
import java.io.Serializable;
import jakarta.persistence.Query;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import dto.Membresias;
import dto.Paquetes;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucy
 */
public class PaquetesJpaController implements Serializable {

    public PaquetesJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Paquetes paquetes) {
        if (paquetes.getMembresiasList() == null) {
            paquetes.setMembresiasList(new ArrayList<Membresias>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Membresias> attachedMembresiasList = new ArrayList<Membresias>();
            for (Membresias membresiasListMembresiasToAttach : paquetes.getMembresiasList()) {
                membresiasListMembresiasToAttach = em.getReference(membresiasListMembresiasToAttach.getClass(), membresiasListMembresiasToAttach.getId());
                attachedMembresiasList.add(membresiasListMembresiasToAttach);
            }
            paquetes.setMembresiasList(attachedMembresiasList);
            em.persist(paquetes);
            for (Membresias membresiasListMembresias : paquetes.getMembresiasList()) {
                Paquetes oldPaquetesIdOfMembresiasListMembresias = membresiasListMembresias.getPaquetesId();
                membresiasListMembresias.setPaquetesId(paquetes);
                membresiasListMembresias = em.merge(membresiasListMembresias);
                if (oldPaquetesIdOfMembresiasListMembresias != null) {
                    oldPaquetesIdOfMembresiasListMembresias.getMembresiasList().remove(membresiasListMembresias);
                    oldPaquetesIdOfMembresiasListMembresias = em.merge(oldPaquetesIdOfMembresiasListMembresias);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Paquetes paquetes) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paquetes persistentPaquetes = em.find(Paquetes.class, paquetes.getId());
            List<Membresias> membresiasListOld = persistentPaquetes.getMembresiasList();
            List<Membresias> membresiasListNew = paquetes.getMembresiasList();
            List<Membresias> attachedMembresiasListNew = new ArrayList<Membresias>();
            for (Membresias membresiasListNewMembresiasToAttach : membresiasListNew) {
                membresiasListNewMembresiasToAttach = em.getReference(membresiasListNewMembresiasToAttach.getClass(), membresiasListNewMembresiasToAttach.getId());
                attachedMembresiasListNew.add(membresiasListNewMembresiasToAttach);
            }
            membresiasListNew = attachedMembresiasListNew;
            paquetes.setMembresiasList(membresiasListNew);
            paquetes = em.merge(paquetes);
            for (Membresias membresiasListOldMembresias : membresiasListOld) {
                if (!membresiasListNew.contains(membresiasListOldMembresias)) {
                    membresiasListOldMembresias.setPaquetesId(null);
                    membresiasListOldMembresias = em.merge(membresiasListOldMembresias);
                }
            }
            for (Membresias membresiasListNewMembresias : membresiasListNew) {
                if (!membresiasListOld.contains(membresiasListNewMembresias)) {
                    Paquetes oldPaquetesIdOfMembresiasListNewMembresias = membresiasListNewMembresias.getPaquetesId();
                    membresiasListNewMembresias.setPaquetesId(paquetes);
                    membresiasListNewMembresias = em.merge(membresiasListNewMembresias);
                    if (oldPaquetesIdOfMembresiasListNewMembresias != null && !oldPaquetesIdOfMembresiasListNewMembresias.equals(paquetes)) {
                        oldPaquetesIdOfMembresiasListNewMembresias.getMembresiasList().remove(membresiasListNewMembresias);
                        oldPaquetesIdOfMembresiasListNewMembresias = em.merge(oldPaquetesIdOfMembresiasListNewMembresias);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = paquetes.getId();
                if (findPaquetes(id) == null) {
                    throw new NonexistentEntityException("The paquetes with id " + id + " no longer exists.");
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
            Paquetes paquetes;
            try {
                paquetes = em.getReference(Paquetes.class, id);
                paquetes.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paquetes with id " + id + " no longer exists.", enfe);
            }
            List<Membresias> membresiasList = paquetes.getMembresiasList();
            for (Membresias membresiasListMembresias : membresiasList) {
                membresiasListMembresias.setPaquetesId(null);
                membresiasListMembresias = em.merge(membresiasListMembresias);
            }
            em.remove(paquetes);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Paquetes> findPaquetesEntities() {
        return findPaquetesEntities(true, -1, -1);
    }

    public List<Paquetes> findPaquetesEntities(int maxResults, int firstResult) {
        return findPaquetesEntities(false, maxResults, firstResult);
    }

    private List<Paquetes> findPaquetesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Paquetes.class));
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

    public Paquetes findPaquetes(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Paquetes.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaquetesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Paquetes> rt = cq.from(Paquetes.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
