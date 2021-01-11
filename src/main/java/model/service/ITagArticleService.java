package model.service;

import java.util.List;

import model.Article;
import model.Tag;
import model.TagArticle;

public interface ITagArticleService {
	public boolean save(TagArticle tagArticle);
	public List<Tag> saveListTag(Article article, String[] tagIds);
	public List<TagArticle> findTagArticleByArticle(Article article);
	public int removeOldTagArticle(Article article);
	public List<Tag> updateListTag(Article article, String[] tagIds);
	public List<Tag> getListTag(Article article);
	public List<TagArticle> findTagArticleByTag(Tag tag);
}
