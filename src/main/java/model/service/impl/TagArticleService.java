package model.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import dao.ITagArticleDAO;
import dao.ITagDAO;
import dao.impl.TagArticleIDAO;
import dao.impl.TagDAO;
import model.Article;
import model.Tag;
import model.TagArticle;
import model.service.ITagArticleService;

public class TagArticleService implements ITagArticleService {
	
	private ITagArticleDAO tagArticleDAO;
	private ITagDAO tagDAO;
	
	public TagArticleService() {
		tagArticleDAO = new TagArticleIDAO();
		tagDAO = new TagDAO();
	}

	@Override
	public boolean save(TagArticle tagArticle) {
		if(tagArticle != null) {
			tagArticle.setId(UUID.randomUUID().toString());
			return (tagArticleDAO.save(tagArticle) == 1) ? true : false;
		}
		return false;
	}

	@Override
	public List<Tag> saveListTag(Article article, String[] tagIds) {
		
		List<Tag> listTags = new ArrayList<>();
		
		//add new tag_article after add an article.
		for(String id: tagIds){
			Tag tag = tagDAO.findTagById(id);
			if(tag!=null){
				TagArticle tagArticle = new TagArticle();
				tagArticle.setArticle(article);
				tagArticle.setId(UUID.randomUUID().toString());
				tagArticle.setTag(tag);
				boolean rs = save(tagArticle);
				if(rs){
					listTags.add(tag);
				}
			}
		}
		
		if(listTags.size()>0) 
			return listTags;
		return null;
	}

	@Override
	public List<TagArticle> findTagArticleByArticle(Article article) {
		return tagArticleDAO.findTagArticleByArticle(article);
	}

	@Override
	public int removeOldTagArticle(Article article) {
		return tagArticleDAO.removeOldTagArticle(article);
	}

	@Override
	public List<Tag> updateListTag(Article article, String[] tagIds) {
		removeOldTagArticle(article);
		List<Tag> listTags = saveListTag(article, tagIds);
		
		if(listTags!=null && listTags.size()>0) return listTags;
		return null;
	}
	
	@Override
	public List<Tag> getListTag(Article article){
		List<TagArticle> tagArticles = findTagArticleByArticle(article);
		List<Tag> tags = new ArrayList<>();
		
		for(TagArticle item: tagArticles){
			tags.add(item.getTag());
		}
		return tags;
		
	}

	@Override
	public List<TagArticle> findTagArticleByTag(Tag tag) {
		return tagArticleDAO.findTagArticleByTag(tag);
	}
	
}
