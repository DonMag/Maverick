//
//  UsingTextTableViewController.swift
//  Maverick
//
//  Created by Don Mag on 11/14/19.
//

import UIKit

class TextMethodCell: UITableViewCell {
	
	@IBOutlet var titleLable: UILabel!
	@IBOutlet var costLabel: UILabel!
	@IBOutlet var productionLabel: UILabel!
	@IBOutlet var valueLabel: UILabel!
	@IBOutlet var descriptionLabel: UILabel!
	
	@IBOutlet var toggleButton: UIButton!
	
	var descriptionText: String = ""
	
	var isExpanded: Bool = false {
		didSet {
			updateLayout()
		}
	}
	
	var btnTapped: (() -> ())?
	
	func updateLayout() -> Void {
		toggleButton.setTitle(isExpanded ? "-" : "+", for: .normal)
		if isExpanded {
			descriptionLabel.text = descriptionText
		} else {
			descriptionLabel.text = ""
		}
	}
	
	@IBAction func didTap(_ sender: Any) {
		btnTapped?()
	}
	
	func clearDevColors() -> Void {
		contentView.subviews.forEach { v in
			if v is UILabel {
				v.backgroundColor = .clear
			}
		}
	}

}

class UsingTextTableViewController: UITableViewController {

	var testData: [MyData] = SampleData().theData
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return testData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextMethodCell", for: indexPath) as! TextMethodCell

		let d = testData[indexPath.row]
		
		cell.titleLable.text = d.title
		cell.costLabel.text = "Original\nCost\n" + d.values[0]
		cell.productionLabel.text = "Original\nProduction\n" + d.values[1]
		cell.valueLabel.text = "Present\nValue\n" + d.values[2]

		// don't set the description label's text
		// set the descriptionText var
		cell.descriptionText = d.descript

		cell.isExpanded = d.expandedState
		
		cell.btnTapped = {
			cell.isExpanded = !cell.isExpanded
			self.testData[indexPath.row].expandedState = cell.isExpanded
			tableView.beginUpdates()
			tableView.endUpdates()
		}
		
		// un-comment to clear the label background colors
		//cell.clearDevColors()
		
        return cell
    }

}
