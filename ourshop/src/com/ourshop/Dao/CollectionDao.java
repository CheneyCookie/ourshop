package com.ourshop.Dao;

import java.util.List;

import com.ourshop.bean.Collection;

public interface CollectionDao extends BaseDao<Collection> {
	List<Collection> queryByUid(int uid);
}
