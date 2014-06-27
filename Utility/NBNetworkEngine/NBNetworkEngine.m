//
//  NBNetworkEngine.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBNetworkEngine.h"



@implementation NBNetworkEngine

+ (void)loadDataWithURL:(NSString *)url params:(NSDictionary *)params completeHander:(CompleteHander)callBack
{
    if (![AppUtility isNetworkAvaliableShowAlert:NO])
    {
        callBack(nil,NO);
        return ;
    }
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (params == nil||params.count <= 0)
    {
        
       // [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObjects:@"text/html", nil]];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
             callBack(responseObject,YES);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           
            callBack(nil,NO);
            
        }];
        return;
    }
  
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
   // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        callBack(responseObject,YES);
            
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // DLog(@"error = %@",[error description]);
        callBack(nil,NO);
    }];
}



+ (void)loadDataWithURL:(NSString *)url completeHander:(CompleteHander)callBack
{
    [NBNetworkEngine loadDataWithURL:url params:nil completeHander:callBack];
}

+ (void)uploadDataWithURL:(NSString *)url params:(NSDictionary *)params file:(NSString *)fileURL  completeHander:(CompleteHander)callBack progressHander:(ProgressHander)handler
{
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    AFHTTPRequestOperation *operation = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
    {
        NSError *err = nil;
        NSURL *URL = [NSURL fileURLWithPath:fileURL];
        [formData appendPartWithFileURL:URL name:@"file" fileName:URL.lastPathComponent mimeType:@"image/png" error:&err];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        callBack(responseObject,YES);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"error = %@",error.description);
        callBack(nil,NO);
    }];

   [operation setUploadProgressBlock:^(NSUInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
       
      // DLog(@"bytesWritten = %lu",(unsigned long)bytesWritten);
      // DLog(@"totalBytesWritten = %lu",(unsigned long)totalBytesWritten);
      /// DLog(@"totalBytesExpectedToWrite = %lu",(unsigned long)totalBytesExpectedToWrite);
       handler(totalBytesWritten*1.0/totalBytesExpectedToWrite);
       
   }];
    [operation start];
     
}

@end
