package dao.impl;

import java.util.List;

import dao.ITagArticleDAO;
import model.Article;
import model.Tag;
import model.TagArticle;
import model.mapper.impl.TagArticleMapper;

public class TagArticleIDAO extends BaseDAO<TagArticle> implements ITagArticleDAO {

	@Override
	public int save(TagArticle tagArticle) {
		StringBuilder sql = new StringBuilder("INSERT INTO tbl_tag_article (id, tbl_article_id, tbl_tag_id)");
		sql.append(" VALUES (?, ?, ?)");
		return insert(sql.toString(), tagArticle.getId(), tagArticle.getArticle().getId(), tagArticle.getTag().getId());
	}

	@Override
	public List<TagArticle> findTagArticleByArticle(Article article) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_tag_article WHERE tbl_article_id = ?");
		return find(sql.toString(), new TagArticleMapper(), article.getId());
	}

	@Override
	public int removeOldTagArticle(Article article) {
		//DELETE FROM `ptinewsdb_dev`.`tbl_tag_article` WHERE (`id` = '3af6009c-a26c-4c82-bb5f-1f5fe68c63ac');
		StringBuilder sql = new StringBuilder("DELETE FROM tbl_tag_article WHERE tbl_article_id = ?");
		return insert(sql.toString(), article.getId());
	}

	@Override
	public List<TagArticle> findTagArticleByTag(Tag tag) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_tag_article WHERE tbl_tag_id = ?");
		return find(sql.toString(), new TagArticleMapper(), tag.getId());
	}


}
