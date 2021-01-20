import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    let soundsArry = ["note1","note2"]
    let questionsArry = [
        Question(text: "珠穆朗玛峰是世界第一高峰", correctAnswer:true ),
        Question(text: "王怡佳不打刘泉", correctAnswer: false),
        Question(text: "火锅用手吃", correctAnswer: false),
        Question(text: "苹果对身体好", correctAnswer: true),
        Question(text: "奶茶发胖", correctAnswer: true),
        Question(text: "睡觉可以补充体力", correctAnswer:true ),
        Question(text: "一日三餐很重要", correctAnswer: true),
        Question(text: "我女朋友120斤", correctAnswer: false),
        Question(text: "老虎爱吃青菜", correctAnswer: false),
        Question(text: "灰太狼抓到羊", correctAnswer: false),
    ]
    var questionNum = 0
    var score = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionsArry[0].questionText
    }


    @IBAction func answerPressed(_ sender: UIButton) {
       
        checkAnswer(tag: sender.tag )
        questionNum += 1
        nextQuestion()
        updateUI()
        play(tag: sender.tag)
  
    }
    
    
    func play(tag: Int ){
        let url = Bundle.main.url(forResource:  soundsArry[tag-1], withExtension: "wav")
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch  {
            print(error)
        }
    }
    
    func updateUI() {
        progressLabel.text = "\(questionNum + 1)/10"
        progressBar.frame.size.width = (view.frame.width / 10) * (CGFloat(questionNum)+1)
    }
    

    func nextQuestion() {
        
        if questionNum <= 9 {
            questionLabel.text = questionsArry[questionNum].questionText
            
        }else{
            questionNum = 0
            let alert = UIAlertController(title: "真棒！共得分\(score)", message: "还要再来一次吗？", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "再来一次！", style: .default, handler: { (_) in
                self.questionLabel.text = self.questionsArry[0].questionText
                self.score = 0
                self.scoreLabel.text = "总得分：\(self.score)"
                
                self.updateUI()
                //self.progressLabel.text = "1/10"
                //self.progressBar.frame.size.width = self.view.frame.size.width / 10
            }))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer(tag: Int) {
        if tag == 1 {
            if questionsArry[questionNum].answer == true //正确
            {
                score = score + 10
                scoreLabel.text = "总得分：\(score)"
                ProgressHUD.showSuccess("答对了")
            }
            else{
                ProgressHUD.showError("答错了")

            }
        }
        else{
            if questionsArry[questionNum].answer == true {
                ProgressHUD.showError("答错了")
            }
            else{
                score = score + 10
                scoreLabel.text = "总得分：\(score)"
                ProgressHUD.showSuccess("答对了")

            }
            
        }
       
        
    }
    
    
    func startOver() {
       
    }
    

    
}
