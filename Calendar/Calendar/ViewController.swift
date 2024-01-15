//
//  ViewController.swift
//  Calendar
//
//  Created by 아우신얀 on 1/15/24.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDelegateAppearance, FSCalendarDataSource {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var planLabel: UILabel!
    
    
    var data = ""
    var selectDate = ""
    var didFormatter = DateFormatter()
    var plan = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.locale = Locale(identifier: "ko_KR")
        
        calendar.delegate = self
        calendar.dataSource = self
        calendar.appearance.titleWeekendColor = .red
        
        didFormatter.dateFormat = "yyyy-MM-dd"
    
    }
    
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) { //날짜 선택시 콜백 메서드
       
        let selectecDate = didFormatter.string(from: date)
        selectDate = selectecDate
        print(selectDate)
        
        showAlert(for: date)

    }
    
    func showAlert(for date: Date) {
        let alert = UIAlertController(title: "새로운 이벤트", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "입력하세요"
        }
        let confirmBtn = UIAlertAction(title: "확인", style: .default, handler: { [self] _ in
            //확인을 클릭했을때 처리할 내용
            if let textField = alert.textFields?[0]{
                if textField.text?.isEmpty != true {
                    print("입력값 \(textField.text!)")
                    self.planLabel.text = textField.text
                    data = textField.text!
                    self.calendar.reloadData()
                } else {
                    print("입력된 값이 없습니다.")
                }
            }
            
        })
        
        let cancelBtn = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(confirmBtn)
        alert.addAction(cancelBtn)
        
        present(alert, animated: true, completion: nil)
    }

    //날짜 밑에 UILabel을 표시
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
    
        switch didFormatter.string(from: date) {
        case selectDate:
            return data
            
        default:
            return nil
        }
    }
}

