//
//  jsonbridge.swift
//  Mamen
//
//  Created by 榆麟 on 2023/5/11.
//

import Alamofire
import Foundation
import SwiftyJSON

class JSONBRIDGE {
    let url="http://192.168.10.195:4545"
    func CheckUserNameRepeat(username: String, closure: @escaping (responseBody) -> Void) {
        let body=checkUserNameRepeat(username: username)
        AF.request(url, method: .post, parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200 {
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].string)
            closure(result)
        }
    }
    func UserResign(username:String,password:String,name:String,closure: @escaping (responseBody) -> Void){
        let body=userResign(username: username, password: password, name: name)
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].string)
            closure(result)
        }
    }
    func UserLogin(username:String,password:String,closure: @escaping (responseBody) -> Void){
        let body=userLogin(username: username, password: password)
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].string)
            closure(result)
        }
    }
    func GetCourseFiles(closure: @escaping (responseBody) -> Void){
        let body=getCourseFiles()
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].string)
            closure(result)
        }
    }
    func GetAllCourses(closure: @escaping (responseBody) -> Void){
        let body=getAllCourses()
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].array)
            closure(result)
        }
    }
    func GetAllTimeTables(closure: @escaping (responseBody) -> Void){
        let body=getAllTimeTables()
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].array)
            closure(result)
        }
    }
    func GetInformation(closure: @escaping (responseBody) -> Void){
        let body=getInformation()
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].array)
            closure(result)
        }
    }
    func GetMarks(closure: @escaping (responseBody) -> Void){
        let body=getMarks()
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].array)
            closure(result)
        }
    }
    func GetDeadline(closure: @escaping (responseBody) -> Void){
        let body=getDeadline()
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].array)
            
            closure(result)
        }
    }
    func UpdateNickName(username:String,nickname:String,closure:@escaping(responseBody)->Void){
        let body=updateNickName(username: username, nickname: nickname)
        AF.request(url,method: .post,parameters: body).responseString { response in
            let code=response.response?.statusCode
            if code != 200{
                debugPrint("http error")
               closure (responseBody(result: 0, message: "网络出现问题", data: nil))
            }
            let responseJson=JSON(response.data ?? Data())
            let result=responseBody(result: responseJson["result"].intValue, message: responseJson["message"].stringValue, data: responseJson["data"].string)
            closure(result)
        }
    }
}

struct checkUserNameRepeat: Encodable {
    let type="getUsername"
    let username: String
}

struct userResign: Encodable {
    let type: String="resign"
    let username: String
    let password: String
    let name: String
}

struct userLogin: Encodable {
    let type="login"
    let username: String
    let password: String
}

//struct getUserNickName: Encodable {
//    let type: String="getUsername"
//    let username: String
//    let password: String
//}

struct getCourseFiles: Encodable {
    let type="api"
    let item="courseFiles"
}

struct getAllCourses: Encodable {
    let type="api"
    let item="course"
}

struct getAllTimeTables:Encodable {
    let type="api"
    let item="timetable"
}
struct getInformation:Encodable {
    let type="api"
    let item="information"
}
struct getMarks:Encodable {
    let type="api"
    let item="marks"
}
struct getDeadline:Encodable {
    let type="api"
    let item="deadline"
}
struct updateNickName: Encodable {
    let type="updateNickname"
    let username: String
    let nickname: String
}

struct responseBody {
    let result: Int
    let message: String
    let data: Any?
}

func whatsdaytoday()->Int{
    let calendar=Calendar.current
    let today=Date()
    let weekday=calendar.component(.weekday, from: today)
    return weekday
}
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data=rawValue.data(using: .utf8),
              let result=try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self=result
    }

    public var rawValue: String {
        guard let data=try? JSONEncoder().encode(self),
              let result=String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
