//
//  URLInterface.h
//  iCareer
//
//  Created by YANGRui on 14-4-3.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#ifndef iCareer_URLInterface_h
#define iCareer_URLInterface_h

//184
//#define BASE_URL  @"http://192.168.0.145:8080/MobileChance"
#define BASE_URL  @"http://112.124.15.6:8021/MobileChance"
#define BASE_URL1 @"http://192.168.0.182:8080/MobileChance"

#define kImage_Path_URL(image) [NSURL URLWithString:[NSString stringWithFormat:@"%@/Media/%@",BASE_URL1,image]]

//登录接口
#pragma mark - 登录接口
#define kLogin_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"account_login"]

//修改密码接口
#pragma mark - 修改密码接口
#define kModify_Password_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"account_updatePwd"]

//修改邮箱接口
#pragma mark - 修改邮箱接口
#define kModify_Email_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"account_updateEmail"]

//获取所有地区
#pragma mark - 获取所有地区
#define kGet_All_Area_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"area_getMainPage"]
//获取子地区
#pragma mark - 获取子地区
#define kGet_Area(areaId) [NSString stringWithFormat:@"%@/%@?parentId=%@",BASE_URL,@"area_get",areaId]
//通过城市名获取地区ID
#pragma mark - 通过城市名获取地区ID
#define kGet_AreaId [NSString stringWithFormat:@"%@/%@",BASE_URL,@"area_getIdByName"]

//获取所有行业
#pragma mark - 获取所有行业
#define GET_ALL_INDUSTRY [NSString stringWithFormat:@"%@/%@",BASE_URL,@"getIndustry"]

//获取子行业
#pragma mark - 获取子行业
#define GET_CHILD_INDUSTRY(industryID) [NSString stringWithFormat:@"%@/%@?parentId=%@",BASE_URL,@"getIndustry",industryID]

//获取所有职业
#pragma mark - 获取所有职业
#define GET_ALL_CAREER [NSString stringWithFormat:@"%@/%@",BASE_URL,@"getCareer"]
//获取所有子职业
#pragma mark - 获取所有子职业
#define GET_CHILD_CAREER(carrerID) [NSString stringWithFormat:@"%@/%@?parentId=%@",BASE_URL,@"getCareer",carrerID]


#pragma mark - 简历模块接口****************************************

//获取简历预览数据接口
#pragma mark - 获取简历预览数据接口
#define kGet_All_Resume_Data_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"resume_get"]

//添加教育经历接口
#pragma mark - 添加教育经历接口
#define kAdd_Education_URL   [NSString stringWithFormat:@"%@/%@",BASE_URL,@"education_add"]

//修改教育经历接口
#pragma mark - 修改教育经历接口
#define kModify_Education_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"education_update"]
//删除教育经历接口
#pragma mark - 删除教育经历接口
#define kDelete_Education_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"education_delete"]

//获取基本福利接口
#pragma mark - 获取基本福利接口
#define kGet_BaseWelfare_URL [NSString stringWithFormat:@"%@/%@?category=1",BASE_URL,@"welfare_getByCategory"]

//添加项目经历
#pragma mark - 添加项目经历
#define kAdd_Project_URL    [NSString stringWithFormat:@"%@/%@",BASE_URL,@"project_add"]
//修改项目经历
#pragma mark - 修改项目经历
#define kModify_Project_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"project_update"]
//删除项目经历
#pragma mark - 删除项目经历
#define kDelete_Project_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"project_delete"]

//添加工作经验
#pragma mark - 添加工作经验
#define kAdd_Work_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"workExperience_add"]

//修改工作经历
#pragma mark - 修改工作经历
#define kModify_Work_URL   [NSString stringWithFormat:@"%@/%@",BASE_URL,@"workExperience_update"]

//删除工作经历
#pragma mark - 删除工作经历
#define kDelete_Work_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"workExperience_delete"]

//获取亮点接口
#pragma mark - 获取所有亮点接口
#define kGet_Highlight_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"getHighlight"]

//创建亮点接口
#pragma mark - 创建亮点接口
#define kCreate_Highlight_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"myHighlight_add"]

//保存简历接口
#pragma mark - 保存简历接口
#define kSave_Resume_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"resume_save"]

//简历列表接口
#pragma mark - 简历列表接口
#define kResume_List_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"resume_getByAccountId"]

//刷新简历接口
#pragma mark - 刷新简历接口
#define kRefresh_Resume_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"resume_updateRefreshDate"]

//设置建立公开程度
#pragma mark - 设置建立公开程度
#define kSet_Resume_Open_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"resume_updateOpenLevel"]

//删除简历
#pragma mark - 删除简历接口
#define kDelete_Resume_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"resume_delete"]

//添加行业圈
#pragma mark - 添加行业圈
#define kAdd_Industry_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"myIndustry_add"]

//我的亮点详情
#pragma mark - 我的亮点详情
#define kMy_High_Light_Detail_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"authenticity_getByMyhighlightId"]

//获取教育评价接口
#pragma mark - 获取教育评价接口
#define kGet_Education_Evaluation_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"evaluation_getEducation"]

//获取工作评价接口
#pragma mark - 获取工作评价接口
#define kGet_Work_Evaluation_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"evaluation_getWork"]

//获取项目评价接口
#pragma mark - 获取项目评价接口
#define kGet_Project_Evaluation_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"evaluation_getProject"]

//评价教育经历接口
#pragma mark - 评价教育经历接口
#define kEvaluate_Education_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"evaluation_addEducation"]

//评价工作经历接口
#pragma mark - 评价工作经历接口
#define kEvaluate_Work_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"evaluation_addWork"]

//评价项目经历接口
#pragma mark - 评价项目经历接口
#define kEvaluate_Project_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"evaluation_addProject"]

#pragma mark - 圈子模块接口****************************************

//圈子设置接口
#pragma mark - 圈子设置接口
#define kCircle_Setting_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_updateCircleSet"]

//发现圈子首页数据
#pragma mark - 发现圈子首页数据
#define kFind_Circle_URL    [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getFindCircle"]

//创建圈子
#pragma mark - 创建圈子
#define kCreate_Circle_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_insertCircle"]

//审核圈子
#pragma mark - 审核圈子
#define kCircle_Review_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_applyCircle"]

//删除圈子
#pragma mark - 删除圈子
#define kDelete_Circle_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_deletecircle"]

//查询我的圈子
#pragma mark -  查询我的圈子
#define kQuery_MyCircle_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getmycircle"]

//快速检索圈子
#pragma mark - 快速检索圈子
#define kSearch_Circle_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getSearchCircle"]

//加入圈子
#pragma mark - 加入圈子
#define kJoin_Circle_URL    [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_addNewMyCircle"]

//需要审核的圈子
#pragma mark - 需要审核的圈子
#define kGet_Review_Circle_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"circle_getneedapplucircle"]


//圈子类型分页查询
#pragma mark - 圈子类型分页查询
#define kCircle_Search_Page_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getPageCircle"]

//圈子详情
#pragma mark - 圈子详情接口
#define kCircle_Detail_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getCircleDetails"]

//圈子话题列表
#pragma mark - 圈子话题列表
#define kCircle_Topic_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getCircleTopicList"]

//圈子话题详情接口
#pragma mark - 圈子话题详情接口
#define kCircle_Topic_Detail_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getTopicDetails"]

//圈子成员列表
#pragma mark - 圈子成员列表
#define kCircle_Member_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getCirclrpersonList"]

//圈子成员详情
#pragma mark - 圈子成员详情
#define kCircle_Member_Detail_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"circle_getLinkmanDetails"]

//申请添加联系人
#pragma mark - 申请添加联系人
#define kCircle_Add_Contact_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"linkman_applyLinkManPropose"]

//关注话题
#pragma mark - 关注话题
#define kCircle_Topic_follow_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"linkman_addAttention"]

//取消关注话题
#pragma mark - 取消关注话题 
#define kCircle_Topic_Unfollow_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"linkman_cancelAttention"]
//话题点赞
#pragma mark - 话题点赞
#define kCircle_Topic_Like_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"linkman_addPraise"]

//取消话题点赞
#pragma mark - 取消话题点赞
#define kCircle_Topic_UnLike_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"linkman_deletePraise"]

//添加话题评论
#pragma mark - 添加话题评论
#define kCircle_Topic_Reply_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"linkman_addTopicComment"]

//发布话题
#pragma mark 发布话题
#define kCircle_Add_Topic [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"linkman_addTopic"]




//机会模块接口
#pragma mark - 机会模块接口 ****************************************

//行业报告接口
#pragma mark - 行业报告接口
#define kIndustry_Report_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"chance_getIndustryReport"]

////职业报告接口
#pragma mark - 职业报告接口
#define kCarrer_Report_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"chance_getCareerReport"]


#pragma mark - 推荐模块
//他人推荐
#pragma mark - 他人推荐
#define kOther_Recommend_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"recommend_getForMeRecommend"]

//他人推荐详情
#pragma mark - 他人推荐详情
#define kOther_Recommend_Detail_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"recommend_getForMeCommendDetails"]

//我的推荐
#pragma mark - 我的推荐
#define kMy_Recommend_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"recommend_getMyCommend"]

//我的推荐详情
#pragma mark - 我的推荐详情
#define kMy_Recommend_Detail_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"recommend_getCommendDetails"]

#pragma mark - 消息模块 **************************

//消息订阅设置创建
#pragma mark 消息订阅设置创建
#define kMessage_Order_Create_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"attentionset_add"]

//消息订阅设置删除
#pragma mark 消息订阅设置删除
#define kMessage_Order_Delete_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"attentionset_delete"]

//消息订阅设置检索
#pragma mark 消息订阅设置检索
#define kMessage_Order_List_URL  [NSString stringWithFormat:@"%@/%@",BASE_URL,@"attentionset_get"]



#pragma mark - 评测模块**************************

//获取评测首页数据 
#pragma mark - 获取评测首页数据
#define kTest_Home_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"category_get"]

//根据分类编码检索试卷
#pragma mark - 根据分类编码检索试卷
#define kTest_Category_URL [NSString stringWithFormat:@"%@/%@",BASE_URL,@"category_getByPage"]

//根据试卷编码检索试题
#pragma mark - 根据试卷编码检索试题
#define KTest_Papper_URL   [NSString stringWithFormat:@"%@/%@",BASE_URL,@"question_get"]


//侧边栏模块
#pragma mark - 侧边栏模块
#define kFeedback_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"hr_addFeedBack"]

//关键字搜索公司
#pragma mark - 关键字搜索公司
#define kSearch_Company_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"hr_getSearchCompany"]

//添加屏蔽公司
#pragma mark - 添加屏蔽公司
#define kAdd_Forbid_Company_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"chance_￼￼addHidedcorp"]

//屏蔽公司列表
#pragma mark - 屏蔽公司列表
#define kForbid_Company_List_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"/hr_getHidedcorp"]

//取消屏蔽
#pragma mark - 取消屏蔽
#define kUnforhid_Company_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"/hr_deleteHidedcorp"]

//谁看了我的简历
#pragma mark - 谁看了我的简历
#define kResume_Checked_URL [NSString stringWithFormat:@"%@/%@",BASE_URL1,@"resume_getSawMyResume"]


#endif


