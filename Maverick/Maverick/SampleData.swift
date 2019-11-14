//
//  SampleData.swift
//  Maverick
//
//  Created by Don Mag on 11/14/19.
//

import UIKit

struct MyData {
	var title: String = ""
	var values: [String] = [String]()
	var descript: String = ""
	var expandedState: Bool = false
}

class SampleData: NSObject {

	var theData: [MyData] = [MyData]()
	
	override init() {
		super.init()
		
		var aDataItem: MyData = MyData()
		
		aDataItem = MyData(
			title: "04Base 3.70 Base Rear Axle Ratio (non positraction)",
			values: ["-", "0", "0"],
			descript: "The issue is that when the cell expands, 2 of the labels are overlapped as the other items expand. If you look at the gif below, the top label \"370 Base Axle Ratio\" becomes overlapped by the middle elements.",
			expandedState: false)
		
		theData.append(aDataItem)
		
		aDataItem = MyData(
			title: "898 Genuine Leather Seats",
			values: ["80.70", "-", "0"],
			descript: "Those middle elements slide down as a group, which is also undesirable, and if you look closely, the \"0\" under the words in the middle \"Original Production\" is also overlapped and it expands or is revealed incorrectly.",
			expandedState: false)
		
		theData.append(aDataItem)
		
		aDataItem = MyData(
			title: "941 Sebring Silver Exterior Paint",
			values: ["16.15", "-", "0"],
			descript: "The top bold label \"370 Base Axle\", is set to be 0 lines of text so it can expand to fit multiple lines. The center group of labels is anchored to the bottom of that label. The bottom long text label is anchored to the bottom of the middle \"0\" label.",
			expandedState: false)
		
		theData.append(aDataItem)
		
		aDataItem = MyData(
			title: "A01 Soft Ray Tinted Glass, All Windows",
			values: ["20.20", "-", "0"],
			descript: "If I anchor the middle group of items to the top of the view at a fixed amount, then the expansion works without the overlap effect, but of course this breaks the dynamic nature of having multiple lines of text in that top label.",
			expandedState: false)
		
		theData.append(aDataItem)
		
		aDataItem = MyData(
			title: "A02 Soft Ray Tinted Glass, Windshield",
			values: ["45.25", "-", "0"],
			descript: "This layout is built with auto-layout, but is not using stack views (and is not my preferred solution at this time).",
			expandedState: false)
		
		theData.append(aDataItem)
		
	}
	
}
