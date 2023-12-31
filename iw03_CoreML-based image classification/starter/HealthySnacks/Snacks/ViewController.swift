/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import Vision

class ViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var cameraButton: UIButton!
  @IBOutlet var photoLibraryButton: UIButton!
  @IBOutlet var resultsView: UIView!
<<<<<<< HEAD
  @IBOutlet var resultsLabel: UILabel!
    @IBOutlet var resultsLabel2: UILabel! //是否健康标签
=======
    
    @IBOutlet var resultsLabel: UILabel!
   
>>>>>>> 1b8a02328f3b621d00b38a5c3f9be9feb9aa546d
    @IBOutlet var resultsConstraint: NSLayoutConstraint!

  var firstTime = true

  //TODO: define a VNCoreMLRequest
    
    lazy var classificationRequest: VNCoreMLRequest = {
            do{
                //创建模型
                let snacks=Snacks()//添加进的Snack文件红默认含有snack()对象
                let model = try VNCoreMLModel(for: snacks.model)//创建snack对象中的model属性
                
                //创建request
                //一共两个参数，compeletionHandler是指完成之后需要的一些定制化操作，此函数中初始化为processObservation,即打印结果
                let request = VNCoreMLRequest(model: model, completionHandler: {
                    [weak self] request,error in
                    self?.processObservations(for: request, error: error)
                })
                request.imageCropAndScaleOption = .centerCrop
                return request
                
                
            } catch {
                fatalError("Failed to create request")
            }
        }()
    
    
    lazy var classificationRequest2: VNCoreMLRequest = {
            do{
                //创建模型
                let snacks=healthSnacks()//添加进的healthSnacks文件红默认含有snack()对象
                let model = try VNCoreMLModel(for: snacks.model)//创建snack对象中的model属性
                
                //创建request
                //一共两个参数，compeletionHandler是指完成之后需要的一些定制化操作，此函数中初始化为processObservation,即打印结果
                let request = VNCoreMLRequest(model: model, completionHandler: {
                    [weak self] request,error in
                    self?.processObservations2(for: request, error: error)
                })
                request.imageCropAndScaleOption = .centerCrop
                return request
                
                
            } catch {
                fatalError("Failed to create request")
            }
        }()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    resultsView.alpha = 0
    //resultsView2.alpha = 0
    resultsLabel.text = "choose or take a photo"
<<<<<<< HEAD
      resultsLabel2.text = ""
=======
    //resultsLabel2.text = ""
>>>>>>> 1b8a02328f3b621d00b38a5c3f9be9feb9aa546d
      
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    // Show the "choose or take a photo" hint when the app is opened.
    if firstTime {
      showResultsView(delay: 0.5)
      firstTime = false
    }
  }
  
  @IBAction func takePicture() {
    presentPhotoPicker(sourceType: .camera)
  }

  @IBAction func choosePhoto() {
    presentPhotoPicker(sourceType: .photoLibrary)
  }

  func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) { //获取照片
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.sourceType = sourceType
    present(picker, animated: true)
    hideResultsView()//隐藏顶部，相当于出了一个新的界面
  }

  func showResultsView(delay: TimeInterval = 0.1) {
    resultsConstraint.constant = 100
    view.layoutIfNeeded()

    UIView.animate(withDuration: 0.5,
                   delay: delay,
                   usingSpringWithDamping: 0.6,
                   initialSpringVelocity: 0.6,
                   options: .beginFromCurrentState,
                   animations: {
      self.resultsView.alpha = 1
       // self.resultsView2.alpha = 1
      self.resultsConstraint.constant = -10
      self.view.layoutIfNeeded()
    },
    completion: nil)
  }

  func hideResultsView() {
    UIView.animate(withDuration: 0.3) { //动画效果
      self.resultsView.alpha = 0 //隐藏
<<<<<<< HEAD
=======
        //self.resultsView2.alpha = 0 //隐藏
>>>>>>> 1b8a02328f3b621d00b38a5c3f9be9feb9aa546d
    }
  }

  func classify(image: UIImage) {
      //TODO: use VNImageRequestHandler to perform a classification request
      guard let ciImage=CIImage(image:image) else{ //将传进来的image转换成ciimage
          print("Unable to create CIImage")
          return
      }
      
      let orientation = CGImagePropertyOrientation(image.imageOrientation) //对照片做一些旋转的调整
      
      //创建了一个队列
      DispatchQueue.global(qos:.userInitiated).async {
          let handler = VNImageRequestHandler(ciImage: ciImage,orientation:orientation)
                      do {
                          try handler.perform([self.classificationRequest]) //创建识别请求
                          
                          try handler.perform([self.classificationRequest2]) //创建第二个识别请求
                      } catch {
                          print("Failed to perform classification: \(error)")
                      }
                     
                  }
      
  }
    
    //TODO: define a function like func processObservations(for request: VNRequest, error: Error?)  to process the results from the classification model

    func processObservations(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async{
            // print("Result:",request.results)
        if let results = request.results as? [VNClassificationObservation]//强制类型转换
        {
            if results.isEmpty
            {
                self.resultsLabel.text = "Nothing found"
            }
            else if results[0].confidence < 0.1
            {
                self.resultsLabel.text="not sure"
            }
            else
            {
<<<<<<< HEAD
                self.resultsLabel.text = String(format:"This is %@:%.1f%%. ",results[0].identifier, results[0].confidence*100)
=======
                self.resultsLabel.text = String(format:"This is %@: %.1f%%. ",results[0].identifier, results[0].confidence*100)
>>>>>>> 1b8a02328f3b621d00b38a5c3f9be9feb9aa546d
            }
        }
        else if let error = error
        {
            self.resultsLabel.text = "Error: \(error.localizedDescription)"
        }
        else
        {
            self.resultsLabel.text = "???"
        }
        self.showResultsView()
    }
<<<<<<< HEAD
}
    
    
    func processObservations2(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async{
            // print("Result:",request.results)
        if let results = request.results as? [VNClassificationObservation]//强制类型转换
        {
            if results.isEmpty
            {
                self.resultsLabel2.text = "Nothing found"
            }
            else if results[0].confidence < 0.1
            {
                self.resultsLabel2.text="not sure"
            }
            else
            {
                self.resultsLabel.text = String(format:"It is %@: %.1f%%.",results[0].identifier, results[0].confidence*100)
            }
        }
        else if let error = error
        {
            self.resultsLabel.text = "Error: \(error.localizedDescription)"
        }
        else
        {
            self.resultsLabel.text = "???"
        }
        self.showResultsView()
    }
}
}
=======
}
    
    
    func processObservations2(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async{
            // print("Result:",request.results)
        if let results = request.results as? [VNClassificationObservation]//强制类型转换
        {
            if results.isEmpty
            {
                self.resultsLabel.text?.append(" jjj")
            }
            else if results[0].confidence < 0.1
            {
                self.resultsLabel.text?.append("dff")
            }
            else
            {
                self.resultsLabel.text?.append(String(format:"\nIt is %@:  %.1f%%.",results[0].identifier, results[0].confidence*100))
            }
        }
        else if let error = error
        {
            self.resultsLabel.text = "Error: \(error.localizedDescription)"
        }
        else
        {
            self.resultsLabel.text = "???"
        }
        self.showResultsView()
    }
}
}
>>>>>>> 1b8a02328f3b621d00b38a5c3f9be9feb9aa546d
  



//委托，实现当选好图片之后的操作
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true) //关闭选取图片的界面

<<<<<<< HEAD
	let image = info[.originalImage] as! UIImage //获取选择的图片
=======
    let image = info[.originalImage] as! UIImage //获取选择的图片
>>>>>>> 1b8a02328f3b621d00b38a5c3f9be9feb9aa546d
    imageView.image = image

    classify(image: image) //识别图片
  }
}
