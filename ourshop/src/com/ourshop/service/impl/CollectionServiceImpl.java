package com.ourshop.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ourshop.bean.Collection;
import com.ourshop.service.CollectionService;

@Service("collectionService")
public class CollectionServiceImpl extends BaseServiceImpl<Collection> implements CollectionService {

	@Override
	public List<Collection> queryByUid(int uid) {
		return collectionDao.queryByUid(uid);
	}

}
