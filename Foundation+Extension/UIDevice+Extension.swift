//
//  UIDevice+Extension.swift
//  NiuNiuRent
//
//  Created by Q Z on 2023/7/4.
//

import UIKit
import MachO

extension UIDevice{
    static var bundleId = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    static var appName = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
    static var localVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    
    /// 获取电量
   static func getBatteryLevel() -> Float {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return UIDevice.current.batteryLevel
    }
    
    /// 获取电池的状态 0充电中 1放电中 2已充满 3未知状态
    static func getBatteryState() -> Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        switch UIDevice.current.batteryState {
        case .unplugged:
            return 1
        case .charging:
            return 0
        case .full:
            return 2
        case .unknown:
            return 3
        @unknown default:
            return 3
        }
    }
    
    static func canOpenAppList() -> [[String: String]] {
        var params = [["name": "QQ", "urlScheme": "mqq", "state": "0", "appType": "iOS"],
                      ["name": "微信", "urlScheme": "weixin", "state": "0", "appType": "iOS"],
                      ["name": "支付宝", "urlScheme": "alipay", "state": "0", "appType": "iOS"],
                      ["name": "淘宝", "urlScheme": "taobao", "state": "0", "appType": "iOS"],
                      ["name": "京东", "urlScheme": "openapp.jdmobile", "state": "0", "appType": "iOS"],
                      ["name": "天猫", "urlScheme": "tmall", "state": "0", "appType": "iOS"],
                      ["name": "唯品会", "urlScheme": "vipshop", "state": "0", "appType": "iOS"],
                      ["name": "抖音", "urlScheme": "snssdk1128", "state": "0", "appType": "iOS"],
                      ["name": "百度地图", "urlScheme": "baidumap", "state": "0", "appType": "iOS"],
                      ["name": "高德地图", "urlScheme": "iosamap", "state": "0", "appType": "iOS"],
                      ["name": "腾讯地图", "urlScheme": "qqmap", "state": "0", "appType": "iOS"],
                      ["name": "QQ音乐", "urlScheme": "qqmusic", "state": "0", "appType": "iOS"],
                      ["name": "网易音乐", "urlScheme": "orpheus", "state": "0", "appType": "iOS"],
                      ["name": "百度音乐", "urlScheme": "baidumusic", "state": "0", "appType": "iOS"],
                      ["name": "酷狗音乐", "urlScheme": "kugouURL", "state": "0", "appType": "iOS"],
                      
                      ["name": "美团", "urlScheme": "imeituan", "state": "0", "appType": "iOS"],
                      ["name": "美团外卖", "urlScheme": "meituanwaimai", "state": "0", "appType": "iOS"],
                      ["name": "大众点评", "urlScheme": "dianping", "state": "0", "appType": "iOS"],
                      ["name": "企业微信", "urlScheme": "wxwork", "state": "0", "appType": "iOS"],
                      ["name": "12306", "urlScheme": "cn.12306", "state": "0", "appType": "iOS"],
                      ["name": "钉钉", "urlScheme": "dingtalk", "state": "0", "appType": "iOS"],
                      ["name": "同花顺", "urlScheme": "amihexin", "state": "0", "appType": "iOS"],
                      ["name": "拼多多", "urlScheme": "pinduoduo", "state": "0", "appType": "iOS"],
                      ["name": "小红书", "urlScheme": "xhsdiscover", "state": "0", "appType": "iOS"],
                      ["name": "快手", "urlScheme": "kwai", "state": "0", "appType": "iOS"],
                      ["name": "新浪微博", "weibo": "sinaweibo", "state": "0", "appType": "iOS"],
                      ["name": "腾讯微博", "weibo": "TencentWeibo", "state": "0", "appType": "iOS"],
                      ["name": "豆瓣", "weibo": "douban", "state": "0", "appType": "iOS"],
                      ["name": "墨迹天气", "urlScheme": "rm434209233MojiWeather", "state": "0", "appType": "iOS"],
                      ["name": "知乎", "urlScheme": "zhihu", "state": "0", "appType": "iOS"],
                      ["name": "网易新闻", "urlScheme": "newsapp", "state": "0", "appType": "iOS"],
                      ["name": "腾讯新闻", "urlScheme": "qqnews", "state": "0", "appType": "iOS"],
                      ["name": "优酷", "urlScheme": "youku", "state": "0", "appType": "iOS"],
                      ["name": "爱奇艺视频", "urlScheme": "qiyi-iphone", "state": "0", "appType": "iOS"],
                      ["name": "哔哩哔哩", "urlScheme": "bilibili", "state": "0", "appType": "iOS"],
                      ["name": "腾讯视频", "urlScheme": "tenvideo", "state": "0", "appType": "iOS"],
                      ["name": "百度视频", "urlScheme": "baiduvideoiphone", "state": "0", "appType": "iOS"],
                      ["name": "今日头条", "urlScheme": "snssdk141", "state": "0", "appType": "iOS"],
                      
                      ["name": "Chrome", "urlScheme": "googlechrome", "state": "0", "appType": "iOS"],
                      ["name": "手机百度", "urlScheme": "BaiduSSO", "state": "0", "appType": "iOS"],
                      ["name": "QQ浏览器", "urlScheme": "mqqbrowser", "state": "0", "appType": "iOS"],
                      ["name": "uc浏览器", "urlScheme": "ucbrowser", "state": "0", "appType": "iOS"],
                      
                      ["name": "网易邮箱", "urlScheme": "neteasemail", "state": "0", "appType": "iOS"],
                      ["name": "腾讯企业邮箱", "urlScheme": "qqbizmailDistribute2", "state": "0", "appType": "iOS"],
                      
                      ["name": "百度贴吧", "urlScheme": "com.baidu.tieba", "state": "0", "appType": "iOS"],
                      ["name": "陌陌", "urlScheme": "momochat", "state": "0", "appType": "iOS"],
                      
                      ["name": "滴滴出行", "urlScheme": "diditaxi", "state": "0", "appType": "iOS"],
                      ["name": "哈啰出行", "urlScheme": "hellobike", "state": "0", "appType": "iOS"],
                      ["name": "摩拜单车", "urlScheme": "mobike", "state": "0", "appType": "iOS"],
                      ["name": "订票助手", "urlScheme": "trainassist", "state": "0", "appType": "iOS"],
                      ["name": "艺龙旅行", "urlScheme": "elongIPhone", "state": "0", "appType": "iOS"],
                      ["name": "携程无线", "urlScheme": "CtripWireless", "state": "0", "appType": "iOS"],
                      ["name": "淘宝旅行", "urlScheme": "taobaotravel", "state": "0", "appType": "iOS"],
                      
                      ["name": "中国招商银行", "urlScheme": "cmbmobilebank", "state": "0", "appType": "iOS"],
                      ["name": "中国建设银行", "urlScheme": "wx2654d9155d70a468", "state": "0", "appType": "iOS"],
                      ["name": "中国工商银行", "urlScheme": "com.icbc.iphoneclient", "state": "0", "appType": "iOS"],
                      ["name": "中国农业银行", "urlScheme": "bankabc", "state": "0", "appType": "iOS"],
                      ["name": "中国银行", "urlScheme": "bocmbciphone", "state": "0", "appType": "iOS"],
                      ["name": "中国邮政储蓄银行", "urlScheme": "psbcMobileBank", "state": "0", "appType": "iOS"],
                      ["name": "中国交通银行", "urlScheme": "bocom", "state": "0", "appType": "iOS"],
                      ["name": "云闪付", "urlScheme": "upwallet", "state": "0", "appType": "iOS"],
                      
                      ["name": "天天爱消除", "urlScheme": "tencent100689805", "state": "0", "appType": "iOS"],
                      ["name": "天天酷跑", "urlScheme": "tencent100692648", "state": "0", "appType": "iOS"],
                      ["name": "和平精英", "urlScheme": "wxc4c0253df149f02d", "state": "0", "appType": "iOS"],
                      ["name": "王者荣耀", "urlScheme": "wx95a3a4d7c627e07d", "state": "0", "appType": "iOS"],
                      ["name": "阴阳师", "urlScheme": "wb2982475902", "state": "0", "appType": "iOS"],
                      ["name": "天天飞车", "urlScheme": "tencent100695850", "state": "0", "appType": "iOS"],
                      ["name": "欢乐斗地主", "urlScheme": "wx76fc280041c16519", "state": "0", "appType": "iOS"],
                      ["name": "原神", "urlScheme": "yuanshengame", "state": "0", "appType": "iOS"],    
        ]
        for (idx, data) in params.enumerated() {
            var data = data
            let urlScheme = "\(data["urlScheme"] ?? "")://"
            if let url = URL(string: urlScheme) {
                if UIApplication.shared.canOpenURL(url){
                    data["state"] = "1"
                    params[idx] = data
                }
            }
        }
        return params
    }
}

