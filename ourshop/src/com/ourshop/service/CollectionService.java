package com.ourshop.service;

import java.util.List;

import com.ourshop.bean.Collection;

public interface CollectionService extends BaseService<Collection>{
	List<Collection> queryByUid(int uid);
}
