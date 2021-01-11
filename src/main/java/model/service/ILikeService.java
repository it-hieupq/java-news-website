package model.service;

import model.Article;

public interface ILikeService {
	int getAllLikeOfArticle(Article article);
	boolean insertLike();
}
