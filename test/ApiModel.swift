//
//  ApiModel.swift
//  test
//
//  Created by Parker Chung on 2021/4/12.
//

import Foundation
import Moya
import RxSwift

enum ApiModel {
    case login(String, String)
    case register(String, String, String, String)
    case user(String)
    case history(String)
    case leaderboard(String)
}

extension ApiModel: TargetType {
    var baseURL: URL {
        return URL(string: "http://120.110.114.73:23080/api")!
    }
    
    var path: String {
        switch self {
        case .login(_, _):
            return "/login"
        case .register(_, _, _, _):
            return "/register"
        case .user(_):
            return "/user"
        case .history(_):
            return "/histories"
        case .leaderboard(_):
            return "/leaderboard"
        default:
            break;
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login(_, _):
            return .post
        case .register(_, _, _, _):
            return .post
        case .user(_):
            return .get
        case .history(_):
            return .get
        case .leaderboard(_):
            return .get
        default:
            break
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .login(let account, let password):
            var params: [String:String] = [:]
            params["account"] = account
            params["password"] = password
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .register(let name, let email, let account, let password):
            var params: [String:String] = [:]
            params["name"] = name
            params["email"] = email
            params["account"] = account
            params["password"] = password
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .user(let token):
            var params: [String:String] = [:]
            params["token"] = token
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .history(let token):
            var params: [String:String] = [:]
            params["token"] = token
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .leaderboard(let token):
            var params: [String:String] = [:]
            params["token"] = token
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            break
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .login(_, _):
            return ["Content-type":"application/x-www-form-urlencoded"]
        case .register(_, _, _, _):
            return ["Content-type":"application/x-www-form-urlencoded"]
        case .user(let token):
            return ["Content-type":"application/x-www-form-urlencoded",
                    "Authorization":"Bearer \(token)"]
        case .history(let token):
            return
                ["Content-type":"application/x-www-form-urlencoded",
                 "Authorization":"Bearer \(token)"]
        case .leaderboard(let token):
            return ["Content-type":"application/x-www-form-urlencoded",
                    "Authorization":"Bearer \(token)"]
        default:
            break
        }
    }
    
    
}

class ApiManager {
    let bag = DisposeBag()
    let provider = MoyaProvider<ApiModel>()
    
    func login(account: String, password:String, finish: @escaping(LoginModel)->(), error: @escaping()->Void) -> Void {
        provider.rx.request(.login(account, password))
            .filterSuccessfulStatusCodes()
            .map(LoginModel.self)
            .subscribe(onSuccess: { loginModel in
                print(loginModel)
                finish(loginModel)
                UserDefaults.standard.set(loginModel.data.token, forKey: "token")
            }, onError: { error in
                print(error)
            }).disposed(by: bag)
    }
    
    func register(name:String, email:String, account:String, password:String, finish: @escaping(RegisterModel)->(), error: @escaping()->Void) -> Void{
        provider.rx.request(.register(name, email, account, password))
            .filterSuccessfulStatusCodes()
            .map(RegisterModel.self)
            .subscribe(onSuccess: { registerModel in
                print(registerModel)
                finish(registerModel)
            }, onError: { error in
                print(error)
            }).disposed(by: bag)
    }
    
   
    func user(token: String, finish: @escaping(UserModel)->(), error: @escaping()->Void) -> Void {
        provider.rx.request(.user(token))
            .filterSuccessfulStatusCodes()
            .map(UserModel.self)
            .subscribe(	onSuccess: { userModel in
                print(userModel)
                finish(userModel)
            }, onError: { error in
                print(error)
            }).disposed(by: bag)
    }
    
    func history(token: String, finish: @escaping(HistoryModel)->(), error: @escaping()->Void) -> Void {
        provider.rx.request(.history(token))
            .filterSuccessfulStatusCodes()
            .map(HistoryModel.self)
            .subscribe( onSuccess: { historyModel in
                print(historyModel)
                finish(historyModel)
            }, onError: { error in
                print(error)
            }).disposed(by: bag)
    }
    
    func leaderboard(token: String, finish: @escaping(LeaderboardModel)->(), error: @escaping()->Void) -> Void {
        provider.rx.request(.leaderboard(token))
            .filterSuccessfulStatusCodes()
            .map(LeaderboardModel.self)
            .subscribe( onSuccess: { leaderboardModel in
                print(leaderboardModel)
                finish(leaderboardModel)
            }, onError: { error in
                print(error)
            }).disposed(by: bag)
    }
}
