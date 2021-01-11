package dao;

import java.util.List;

import model.Article;
import model.Tag;
import model.TagArticle;

public interface ITagArticleDAO {
	public int save(TagArticle tagArticle);
	
	List<TagArticle> findTagArticleByArticle(Article article);

	public int removeOldTagArticle(Article article);
	
	List<TagArticle> findTagArticleByTag(Tag tag);
	
}
