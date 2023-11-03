//
//  NoticeTableViewController.swift
//  ITSC
//
//  Created by nju on 2021/11/3.
//

import UIKit
import WebKit

//通知公告界面控制器
class NoticeTableViewController: UITableViewController {

    //数组类型，存储所有条目
    var Dictcell:[BaseCell] =
    [
        
    ]
    var AllPage = 0
    var CurrentPage = 1
    var Finish:Bool = false
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadURL()
    }

    // MARK: - Table view data source

    //只设置一个section
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //每个section中的所有条目数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Dictcell.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //注意不同的identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! DisplayTableViewCell //向下转换成自定义类
        let tempCell = Dictcell[indexPath.row]
        
        cell.title.text! = tempCell.title
        cell.date.text! = tempCell.date        // Configure the cell...

        return cell
    }
    
    func loadURL() {
        let url = self.CurrentPage == 1 ? URL(string: "https://itsc.nju.edu.cn/tzgg/list.htm")! : URL(string: "https://itsc.nju.edu.cn/tzgg/list\(self.CurrentPage).htm")!
        
        //利用URL session上传数据
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                print("server error")
                return
            }
            
            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                        let data = data,
                        let string = String(data: data, encoding: .utf8) {
                            DispatchQueue.main.async {
                                
                                //解析html
                                var str = string.replacingOccurrences(of: "</div>", with: "")
                                //print(str)
                                str = str.replacingOccurrences(of: "</ul>", with: "")
                                str = str.replacingOccurrences(of: "</li>", with: "")
                                var lines = str.replacingOccurrences(of: "\t", with: "").split(separator: "\r\n")
                                for i in lines{
                                    var symbol = i.split(separator: ">")
                                    //print(symbol[0])
                                    if symbol[0] == "<span class=\"news_title\""{
                                        self.Dictcell.append(BaseCell(title: symbol[2].replacingOccurrences(of: "</a", with: ""), date: "unknown", URL:"https://itsc.nju.edu.cn" + String(symbol[1].split(separator: "'")[1])))
                                    }
                                    else if symbol[0] == "<span class=\"news_meta\""{
                                        self.Dictcell[self.Dictcell.count-1].ModifyDate(date: symbol[1].replacingOccurrences(of: "</span", with: ""))
                                    }
                                    else if symbol[0] == "         <span class=\"pages\""{
                                        self.AllPage = Int(symbol[4].replacingOccurrences(of: "</em", with: ""))!
                                        
                                    }
                                        
                                }
                                //print(lines)
                                self.CurrentPage = self.CurrentPage + 1
                                self.loadURL()
                                self.tableView.reloadData()
                        }
            }
            
        })
        
        task.resume()
    }
    /*// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let NoticeViewController = segue.destination as! PageViewController
        let cell = sender as! DisplayTableViewCell
        NoticeViewController.Url = Dictcell[tableView.indexPath(for: cell)!.row].URL
    }

}
