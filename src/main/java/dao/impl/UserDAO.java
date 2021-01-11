package dao.impl;

import java.util.List;

import dao.IUserDAO;
import model.User;
import model.mapper.impl.UserMapper;

public class UserDAO extends BaseDAO<User> implements IUserDAO {
	
	@Override
	public List<User> findAll() {
		StringBuilder sql = new StringBuilder("SELECT id, username, password, salt, email,");
		sql.append(" isAdmin, status, created_date, last_modified");
		sql.append(" FROM tbl_user");
		return find(sql.toString(), new UserMapper());
	}

	@Override
	public int save(User user) {
		StringBuilder sql = new StringBuilder("INSERT INTO tbl_user");
		sql.append(" (id, username, password, salt, email,");
		sql.append(" isAdmin, status, created_date, last_modified)");
		sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), user.getId(), user.getUsername(), user.getPassword(), user.getSalt(),
				user.getEmail(), user.getIsAdmin(), user.getStatus(), user.getCreatedDate(), user.getLastModified());
	}

	@Override
	public User findByEmail(String email) {
		StringBuilder sql = new StringBuilder("SELECT id, username, password, salt, email,");
		sql.append(" isAdmin, status, created_date, last_modified");
		sql.append(" FROM tbl_user WHERE email = ?");
		List<User> users = find(sql.toString(), new UserMapper(), email);
		return (users.size() > 0) ? users.get(0) : null;
	}

	@Override
	public User findOneById(String id) {
		StringBuilder sql = new StringBuilder("SELECT id, username, password, salt, email,");
		sql.append(" isAdmin, status, created_date, last_modified");
		sql.append(" FROM tbl_user WHERE id = ?");
		List<User> users = find(sql.toString(), new UserMapper(), id);
		return (users.size() > 0) ? users.get(0) : null;
	}

	@Override
	public boolean delete(User user) {
		StringBuilder sql = new StringBuilder("DELETE FROM tbl_user WHERE id = ?");
		return update(sql.toString(), user.getId());
	}

	@Override
	public boolean update(User user) {
		StringBuilder sql = new StringBuilder("UPDATE tbl_user");
		sql.append(" SET isAdmin=?, status=?, last_modified=?");
		sql.append(" WHERE id=?");
		return update(sql.toString(), user.getIsAdmin(), user.getStatus(),
				user.getLastModified(), user.getId());
	}
}
