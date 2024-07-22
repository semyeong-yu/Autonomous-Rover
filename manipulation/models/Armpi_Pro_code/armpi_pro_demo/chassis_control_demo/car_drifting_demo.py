#!/usr/bin/python3
# coding=utf8
import sys
import rospy
from chassis_control.msg import *

if sys.version_info.major == 2:
    print('Please run this program with python3!')
    sys.exit(0)
    
print('''
**********************************************************
********************功能:小车漂移例程********************
**********************************************************
----------------------------------------------------------
Official website:https://www.hiwonder.com
Online mall:https://hiwonder.tmall.com
----------------------------------------------------------
Tips:
 * 按下Ctrl+C可关闭此次程序运行，若失败请多次尝试！
----------------------------------------------------------
''')


start = True
#关闭前处理
def stop():
    global start

    start = False
    print('关闭中...')
    set_velocity.publish(0,0,0)  # 发布底盘控制消息,停止移动
    

if __name__ == '__main__':
    # 初始化节点
    rospy.init_node('car_drifting_demo', log_level=rospy.DEBUG)
    rospy.on_shutdown(stop)
    # 麦轮底盘控制
    set_velocity = rospy.Publisher('/chassis_control/set_velocity', SetVelocity, queue_size=1)
    
    while start:
        set_velocity.publish(60,180,-0.3) # 发布底盘控制消息,线速度60，方向角90，偏航角速度-0.3(小于0，为顺时针方向)
        rospy.sleep(3) # 延时3秒
        set_velocity.publish(60,0,0.3)
        rospy.sleep(3) # 延时3秒
    set_velocity.publish(0,0,0)  # 发布底盘控制消息,停止移动
    print('已关闭')

        
