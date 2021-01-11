package model.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.UUID;

import dao.IUserDAO;
import dao.impl.UserDAO;
import model.User;
import model.service.IUserService;
import utils.PasswordUtil;
import utils.SystemConst;

public class UserService implements IUserService {
	
	IUserDAO userDao;
	
	public UserService() {
		userDao = new UserDAO();
	}
	
	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public User checkLogin(User user) {
		User clientUser = user;
		if (user.getEmail() != null && !user.getEmail().isEmpty()) {
			User dbUser = findOneByEmail(user);
			if (dbUser != null) {
				String salt = dbUser.getSalt();
				String userPassword = clientUser.getPassword();
				String dbHasedPassword = dbUser.getPassword();
				String userHasedPassword = PasswordUtil.getPassword(userPassword.toCharArray(), salt.getBytes());
				if (dbHasedPassword.equals(userHasedPassword)) {
					return dbUser;
				}
			}
		}
		return null;
	}

	@Override
	public boolean add(User user) {
		String salt = PasswordUtil.getSalt();
		String hasedPassword = PasswordUtil.getPassword(user.getPassword().toCharArray(), salt.getBytes());

		user.setId(UUID.randomUUID().toString());
		user.setSalt(salt);
		user.setPassword(hasedPassword);
		if(user.getIsAdmin() != true) {
			user.setAdmin(false);
		}
		user.setStatus(SystemConst.ACTIVE_STATUS);
		user.setCreatedDate(new Date(System.currentTimeMillis()));
		user.setLastModified(new Date(System.currentTimeMillis()));

		if (user.getId() != null && user.getEmail() != null && user.getPassword() != null) {
			if (findOneByEmail(user) == null) {
				return (userDao.save(user) == 1) ? true : false;
			}
		}
		return false;
	}

	@Override
	public User findOneByEmail(User user) {
		user = userDao.findByEmail(user.getEmail());
		return (user != null) ? user : null;
	}

	@Override
	public User findOneById(User user) {
		user = userDao.findOneById(user.getId());
		return (user != null) ? user : null;
	}

	@Override
	public boolean delete(User user) {
		user = findOneById(user);
		return (user != null) ? userDao.delete(user) : false;
	}

	@Override
	public boolean update(User user) {
		user.setLastModified(new Date(System.currentTimeMillis()));
		return (user != null) ? userDao.update(user) : false;
	}
}
