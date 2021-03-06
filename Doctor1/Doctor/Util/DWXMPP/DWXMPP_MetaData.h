//
//  DWXMPP_MetaData.h
//  DrizzleChat
//
//  Created by Private on 14/7/24.
//  Copyright (c) 2014年 DrizzleWang. All rights reserved.
//

#pragma mark - ServerData
#define DrizzleChat_XMPP_IP @"127.0.0.1"
#define DrizzleChat_XMPP_port 5222

#pragma mark - NotificationData
#pragma mark ConnectServer(连接服务器)
/** DWXMPP将要连接服务器的Notification */
#define DWXMPP_NOTIFICATION_WILL_CONNECT @"DWXMPP_Will_Connect_Server"
/** DWXMPP已经连接到服务器的Notification */
#define DWXMPP_NOTIFICATION_CONNECT_SUCCEED @"DWXMPP_Connect_Server_Succeed"
/** DWXMPP连接服务器失败的Notification */
#define DWXMPP_NOTIFICATION_CONNECT_FAULT @"DWXMPP_Connect_Server_Fault"

#pragma mark - Authenticate(密码验证)
/** DWXMPP将要验证密码的Notification */
#define DWXMPP_NOTIFICATION_WILL_AUTNENTICATE @"DWXMPP_Will_Authenticate"
/** DWXMPP验证密码成功的Notification */
#define DWXMPP_NOTIFICATION_AUTNENTICATE_SUCCEED @"DWXMPP_Authenticate_Succeed"
/** DWXMPP验证密码失败的Notification */
#define DWXMPP_NOTIFICATION_AUTNENTICATE_FAULT @"DWXMPP_Authenticate_Fault"

#pragma mark - Register(注册)
/** DWXMPP将要注册的Notification */
#define DWXMPP_NOTIFICATION_WILL_REGISTER @"DWXMPP_Will_Register"
/** DWXMPP注册成功的Notification */
#define DWXMPP_NOTIFICATION_REGISTER_SUCCEED @"DWXMPP_Register_Succeed"
/** DWXMPP注册失败的Notification */
#define DWXMPP_NOTIFICATION_REGISTER_FAULT @"DWXMPP_Register_Fault"
//#endif