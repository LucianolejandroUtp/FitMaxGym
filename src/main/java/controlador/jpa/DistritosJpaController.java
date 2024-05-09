/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador.jpa;

import controlador.jpa.exceptions.NonexistentEntityException;
import dto.Distritos;
import java.io.Serializable;
import jakarta.persistence.Query;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import dto.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucy
 */
public class DistritosJpaController implements Serializable {

    public DistritosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Distritos distritos) {
        if (distritos.getUsersList() == null) {
            distritos.setUsersList(new ArrayList<Users>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Users> attachedUsersList = new ArrayList<Users>();
            for (Users usersListUsersToAttach : distritos.getUsersList()) {
                usersListUsersToAttach = em.getReference(usersListUsersToAttach.getClass(), usersListUsersToAttach.getId());
                attachedUsersList.add(usersListUsersToAttach);
            }
            distritos.setUsersList(attachedUsersList);
            em.persist(distritos);
            for (Users usersListUsers : distritos.getUsersList()) {
                Distritos oldDistritosIdOfUsersListUsers = usersListUsers.getDistritosId();
                usersListUsers.setDistritosId(distritos);
                usersListUsers = em.merge(usersListUsers);
                if (oldDistritosIdOfUsersListUsers != null) {
                    oldDistritosIdOfUsersListUsers.getUsersList().remove(usersListUsers);
                    oldDistritosIdOfUsersListUsers = em.merge(oldDistritosIdOfUsersListUsers);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Distritos distritos) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Distritos persistentDistritos = em.find(Distritos.class, distritos.getId());
            List<Users> usersListOld = persistentDistritos.getUsersList();
            List<Users> usersListNew = distritos.getUsersList();
            List<Users> attachedUsersListNew = new ArrayList<Users>();
            for (Users usersListNewUsersToAttach : usersListNew) {
                usersListNewUsersToAttach = em.getReference(usersListNewUsersToAttach.getClass(), usersListNewUsersToAttach.getId());
                attachedUsersListNew.add(usersListNewUsersToAttach);
            }
            usersListNew = attachedUsersListNew;
            distritos.setUsersList(usersListNew);
            distritos = em.merge(distritos);
            for (Users usersListOldUsers : usersListOld) {
                if (!usersListNew.contains(usersListOldUsers)) {
                    usersListOldUsers.setDistritosId(null);
                    usersListOldUsers = em.merge(usersListOldUsers);
                }
            }
            for (Users usersListNewUsers : usersListNew) {
                if (!usersListOld.contains(usersListNewUsers)) {
                    Distritos oldDistritosIdOfUsersListNewUsers = usersListNewUsers.getDistritosId();
                    usersListNewUsers.setDistritosId(distritos);
                    usersListNewUsers = em.merge(usersListNewUsers);
                    if (oldDistritosIdOfUsersListNewUsers != null && !oldDistritosIdOfUsersListNewUsers.equals(distritos)) {
                        oldDistritosIdOfUsersListNewUsers.getUsersList().remove(usersListNewUsers);
                        oldDistritosIdOfUsersListNewUsers = em.merge(oldDistritosIdOfUsersListNewUsers);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = distritos.getId();
                if (findDistritos(id) == null) {
                    throw new NonexistentEntityException("The distritos with id " + id + " no longer exists.");
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
            Distritos distritos;
            try {
                distritos = em.getReference(Distritos.class, id);
                distritos.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The distritos with id " + id + " no longer exists.", enfe);
            }
            List<Users> usersList = distritos.getUsersList();
            for (Users usersListUsers : usersList) {
                usersListUsers.setDistritosId(null);
                usersListUsers = em.merge(usersListUsers);
            }
            em.remove(distritos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Distritos> findDistritosEntities() {
        return findDistritosEntities(true, -1, -1);
    }

    public List<Distritos> findDistritosEntities(int maxResults, int firstResult) {
        return findDistritosEntities(false, maxResults, firstResult);
    }

    private List<Distritos> findDistritosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Distritos.class));
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

    public Distritos findDistritos(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Distritos.class, id);
        } finally {
            em.close();
        }
    }

    public int getDistritosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Distritos> rt = cq.from(Distritos.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
