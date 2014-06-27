//
//  interfaceFromAndy.h
//  iCareer
//
//  Created by andy on 14-3-24.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#ifndef iCareer_interfaceFromAndy_h
#define iCareer_interfaceFromAndy_h

//主接口
//#define INTERFACE_01 @"http://192.168.0.145:8080/MobileChance/"
#define INTERFACE_01 @"http://112.124.15.6:8021/MobileChance/"
#define INTERFACE_02 @"http://192.168.0.182:8080/MobileChance/"

#define INTERFACE_IMAGE(image_url) [NSURL URLWithString:[NSString stringWithFormat:@"%@Media/%@", INTERFACE_02, image_url]]

//注册接口
#define INTERFACE_REGISTER [NSString stringWithFormat:@"%@account_register", INTERFACE_02]

#pragma mark - 简历接口 -

//个人名片创建
#define INTERFACE_SAVE_PERSONCARD [NSString stringWithFormat:@"%@resume_update", INTERFACE_01]

//创建简历
#define INTERFACE_ADD_RESUME [NSString stringWithFormat:@"%@resume_add", INTERFACE_01]

#pragma mark - 圈子接口 -

//新鲜事
#define INTERFACE_NEW_SOMETHING [NSString stringWithFormat:@"%@circle_getNewSomething", INTERFACE_02]

//联系人首页
#define INTERFACE_MY_GROUP [NSString stringWithFormat:@"%@linkman_getLinkman", INTERFACE_02]

//查询我的分组
#define INTERFACE_SELECT_GROUP [NSString stringWithFormat:@"%@linkman_queryMyContactgroup", INTERFACE_02]

//上传我的分组
#define INTERFACE_UP_GROUP [NSString stringWithFormat:@"%@linkman_updateMyContactgroup", INTERFACE_02]

//联系人添加分组
#define INTERFACE_ADD_GROUP [NSString stringWithFormat:@"%@linkman_addContactgroup", INTERFACE_02]

//移动联系人到分组
#define INTERFACE_MOVE_LINKMAN [NSString stringWithFormat:@"%@linkman_moveLinkMan", INTERFACE_02]

//添加联系人
#define INTERFACE_ADD_LINKMAN [NSString stringWithFormat:@"%@linkman_applyLinkManPropose", INTERFACE_02]

//刪除联系人
#define INTERFACE_DELETE_LINKMAN [NSString stringWithFormat:@"%@linkman_deleteLinkMan", INTERFACE_02]

//查询我的圈子
#define INTERFACE_MY_CIRCLE [NSString stringWithFormat:@"%@circle_getmycircle", INTERFACE_02]

//与我相关
#define INTERFACE_ME_CORRELATION [NSString stringWithFormat:@"%@circle_getMeCorrelation", INTERFACE_02]

//获取未处理的好友申请
#define INTERFACE_GET_APPLY_FOR_FRIEND [NSString stringWithFormat:@"%@linkman_undisposedLinkManPropose", INTERFACE_02]

//处理好友申请
#define INTERFACE_MANAGE_APPLY_FOR_FRIEND [NSString stringWithFormat:@"%@linkman_disposeLinkManPropose", INTERFACE_02]

//查询我的关注
#define INTERFACE_MY_ATTENTION [NSString stringWithFormat:@"%@linkman_queryAttention", INTERFACE_02]

//关注
#define INTERFACE_ADD_ATTENTION [NSString stringWithFormat:@"%@linkman_addAttention", INTERFACE_02]

//取消关注
#define INTERFACE_CANCEL_ATTENTION [NSString stringWithFormat:@"%@linkman_cancelAttention", INTERFACE_02]

//查询我的收藏
#define INTERFACE_MY_COLLECTION [NSString stringWithFormat:@"%@linkman_queryTopiccollection", INTERFACE_02]

////添加收藏
//#define INTERFACE_ADD_COLLECTION [NSString stringWithFormat:@"%@linkman_addTopicCollection", INTERFACE_02]
//
////取消收藏
//#define INTERFACE_CANCEL_COLLECTION [NSString stringWithFormat:@"%@linkman_cancelTopiccollection", INTERFACE_02]

//查询我的分享
#define INTERFACE_MY_SHARE [NSString stringWithFormat:@"%@linkman_queryPositionShare", INTERFACE_02]

////删除我的分享
//#define INTERFACE_CANCEL_SHARE [NSString stringWithFormat:@"%@linkman_uqdatePositionShare", INTERFACE_02]

//查询我的评论
#define INTERFACE_MY_COMMENT [NSString stringWithFormat:@"%@linkman_queryMyTopicComment", INTERFACE_02]

//添加话题评论
#define INTERFACE_ADD_COMMENT [NSString stringWithFormat:@"%@linkman_addTopicComment", INTERFACE_02]

//删除评论
//#define INTERFACE_CANCEL_COMMENT [NSString stringWithFormat:@"%@linkman_deleteTopicComment", INTERFACE_02]

#pragma mark - 机会接口 -

//快速检索工作
#define INTERFACE_QUICK_SEARCH_WORK [NSString stringWithFormat:@"%@chance_getQuickIndex", INTERFACE_02]

//检索工作and筛选条件
#define INTERFACE_SEARCH_WORK [NSString stringWithFormat:@"%@chance_getSearchWork", INTERFACE_02]

//附近工作
#define INTERFACE_WORK_NEAR [NSString stringWithFormat:@"%@chance_getWorkNear", INTERFACE_02]

//工作筛选条件
#define INTERFACE_FILTRATE [NSString stringWithFormat:@"%@chance_getFiltrate", INTERFACE_02]

//申请记录
#define INTERFACE_APPLY_RECORD [NSString stringWithFormat:@"%@chance_getApplyRecord", INTERFACE_02]

//职位申请
#define INTERFACE_POSITION_APPLY [NSString stringWithFormat:@"%@chance_addPositionApply", INTERFACE_02]

//批量职位申请
#define INTERFACE_ALL_POSITION_APPLY [NSString stringWithFormat:@"%@chance_addAllPositionApply", INTERFACE_02]

//职位详情
#define INTERFACE_POSINTON_DETAILS [NSString stringWithFormat:@"%@chance_getJobDetail", INTERFACE_02]

//公司关注--取消和关注
#define INTERFACE_ADD_COMPANY_ATTENTION [NSString stringWithFormat:@"%@chance_addCompanyAttention", INTERFACE_02]

//收藏删除与添加
#define INTERFACE_POSINTON_COLLECTION [NSString stringWithFormat:@"%@chance_addPositionCollection", INTERFACE_02]

//查询联系方式
#define INTERFACE_CONTACT [NSString stringWithFormat:@"%@chance_getContact", INTERFACE_02]

//公司所有职位
#define INTERFACE_COMPANY_POSINTON [NSString stringWithFormat:@"%@chance_getCompanyPosition", INTERFACE_02]

#pragma mark - 推荐接口 -

//添加机会推荐
#define INTERFACE_ADD_RECOMMEND_CHANCE [NSString stringWithFormat:@"%@recommend_addRecommendChance", INTERFACE_02]

//给企业推荐人才
#define INTERFACE_ADD_RESUME_RECOMMEND [NSString stringWithFormat:@"%@recommend_addResumerecommend", INTERFACE_02]

//评价推荐者-公司-求职者
#define INTERFACE_COMMENT_RECOMMENDER [NSString stringWithFormat:@"%@recommend_addRecommenderCommentItem", INTERFACE_02]

//给我推荐的机会未评价的数量
#define INTERFACE_NO_COMMENT_COUNT [NSString stringWithFormat:@"%@recommend_getNoEvaluationNum", INTERFACE_02]

//获取发布的悬赏信息
#define INTERFACE_GET_REWARD [NSString stringWithFormat:@"%@recommend_getReward", INTERFACE_02]

//获取我的悬赏信息
#define INTERFACE_GET_MY_REWARD [NSString stringWithFormat:@"%@recommend_getMyReceiveReward", INTERFACE_02]

//悬赏详情查看
#define INTERFACE_GET_REWARD_DETAILS [NSString stringWithFormat:@"%@recommend_getRewardDetails", INTERFACE_02]

//查询推荐者
#define INTERFACE_PRESENTER [NSString stringWithFormat:@"%@recommend_getPresenter", INTERFACE_02]

#pragma mark - 侧边栏接口 -

//个人设置
#define INTERFACE_PERSONAL_SETTING [NSString stringWithFormat:@"%@account_updateSet", INTERFACE_01]

#endif
