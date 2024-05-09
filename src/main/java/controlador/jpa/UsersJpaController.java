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
import dto.Distritos;
import dto.Roles;
import dto.Membresias;
import dto.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucy
 */
public class UsersJpaController implements Serializable {

    public UsersJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Users users) {
        if (users.getMembresiasList() == null) {
            users.setMembresiasList(new ArrayList<Membresias>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Distritos distritosId = users.getDistritosId();
            if (distritosId != null) {
                distritosId = em.getReference(distritosId.getClass(), distritosId.getId());
                users.setDistritosId(distritosId);
            }
            Roles rolesId = users.getRolesId();
            if (rolesId != null) {
                rolesId = em.getReference(rolesId.getClass(), rolesId.getId());
                users.setRolesId(rolesId);
            }
            List<Membresias> attachedMembresiasList = new ArrayList<Membresias>();
            for (Membresias membresiasListMembresiasToAttach : users.getMembresiasList()) {
                membresiasListMembresiasToAttach = em.getReference(membresiasListMembresiasToAttach.getClass(), membresiasListMembresiasToAttach.getId());
                attachedMembresiasList.add(membresiasListMembresiasToAttach);
            }
            users.setMembresiasList(attachedMembresiasList);
            em.persist(users);
            if (distritosId != null) {
                distritosId.getUsersList().add(users);
                distritosId = em.merge(distritosId);
            }
            if (rolesId != null) {
                rolesId.getUsersList().add(users);
                rolesId = em.merge(rolesId);
            }
            for (Membresias membresiasListMembresias : users.getMembresiasList()) {
                Users oldUsersIdOfMembresiasListMembresias = membresiasListMembresias.getUsersId();
                membresiasListMembresias.setUsersId(users);
                membresiasListMembresias = em.merge(membresiasListMembresias);
                if (oldUsersIdOfMembresiasListMembresias != null) {
                    oldUsersIdOfMembresiasListMembresias.getMembresiasList().remove(membresiasListMembresias);
                    oldUsersIdOfMembresiasListMembresias = em.merge(oldUsersIdOfMembresiasListMembresias);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Users users) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Users persistentUsers = em.find(Users.class, users.getId());
            Distritos distritosIdOld = persistentUsers.getDistritosId();
            Distritos distritosIdNew = users.getDistritosId();
            Roles rolesIdOld = persistentUsers.getRolesId();
            Roles rolesIdNew = users.getRolesId();
            List<Membresias> membresiasListOld = persistentUsers.getMembresiasList();
            List<Membresias> membresiasListNew = users.getMembresiasList();
            if (distritosIdNew != null) {
                distritosIdNew = em.getReference(distritosIdNew.getClass(), distritosIdNew.getId());
                users.setDistritosId(distritosIdNew);
            }
            if (rolesIdNew != null) {
                rolesIdNew = em.getReference(rolesIdNew.getClass(), rolesIdNew.getId());
                users.setRolesId(rolesIdNew);
            }
            List<Membresias> attachedMembresiasListNew = new ArrayList<Membresias>();
            for (Membresias membresiasListNewMembresiasToAttach : membresiasListNew) {
                membresiasListNewMembresiasToAttach = em.getReference(membresiasListNewMembresiasToAttach.getClass(), membresiasListNewMembresiasToAttach.getId());
                attachedMembresiasListNew.add(membresiasListNewMembresiasToAttach);
            }
            membresiasListNew = attachedMembresiasListNew;
            users.setMembresiasList(membresiasListNew);
            users = em.merge(users);
            if (distritosIdOld != null && !distritosIdOld.equals(distritosIdNew)) {
                distritosIdOld.getUsersList().remove(users);
                distritosIdOld = em.merge(distritosIdOld);
            }
            if (distritosIdNew != null && !distritosIdNew.equals(distritosIdOld)) {
                distritosIdNew.getUsersList().add(users);
                distritosIdNew = em.merge(distritosIdNew);
            }
            if (rolesIdOld != null && !rolesIdOld.equals(rolesIdNew)) {
                rolesIdOld.getUsersList().remove(users);
                rolesIdOld = em.merge(rolesIdOld);
            }
            if (rolesIdNew != null && !rolesIdNew.equals(rolesIdOld)) {
                rolesIdNew.getUsersList().add(users);
                rolesIdNew = em.merge(rolesIdNew);
            }
            for (Membresias membresiasListOldMembresias : membresiasListOld) {
                if (!membresiasListNew.contains(membresiasListOldMembresias)) {
                    membresiasListOldMembresias.setUsersId(null);
                    membresiasListOldMembresias = em.merge(membresiasListOldMembresias);
                }
            }
            for (Membresias membresiasListNewMembresias : membresiasListNew) {
                if (!membresiasListOld.contains(membresiasListNewMembresias)) {
                    Users oldUsersIdOfMembresiasListNewMembresias = membresiasListNewMembresias.getUsersId();
                    membresiasListNewMembresias.setUsersId(users);
                    membresiasListNewMembresias = em.merge(membresiasListNewMembresias);
                    if (oldUsersIdOfMembresiasListNewMembresias != null && !oldUsersIdOfMembresiasListNewMembresias.equals(users)) {
                        oldUsersIdOfMembresiasListNewMembresias.getMembresiasList().remove(membresiasListNewMembresias);
                        oldUsersIdOfMembresiasListNewMembresias = em.merge(oldUsersIdOfMembresiasListNewMembresias);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = users.getId();
                if (findUsers(id) == null) {
                    throw new NonexistentEntityException("The users with id " + id + " no longer exists.");
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
            Users users;
            try {
                users = em.getReference(Users.class, id);
                users.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The users with id " + id + " no longer exists.", enfe);
            }
            Distritos distritosId = users.getDistritosId();
            if (distritosId != null) {
                distritosId.getUsersList().remove(users);
                distritosId = em.merge(distritosId);
            }
            Roles rolesId = users.getRolesId();
            if (rolesId != null) {
                rolesId.getUsersList().remove(users);
                rolesId = em.merge(rolesId);
            }
            List<Membresias> membresiasList = users.getMembresiasList();
            for (Membresias membresiasListMembresias : membresiasList) {
                membresiasListMembresias.setUsersId(null);
                membresiasListMembresias = em.merge(membresiasListMembresias);
            }
            em.remove(users);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Users> findUsersEntities() {
        return findUsersEntities(true, -1, -1);
    }

    public List<Users> findUsersEntities(int maxResults, int firstResult) {
        return findUsersEntities(false, maxResults, firstResult);
    }

    private List<Users> findUsersEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Users.class));
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

    public Users findUsers(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Users.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsersCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Users> rt = cq.from(Users.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
