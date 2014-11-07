//
//  CustomTableViewCell.swift
//  PureLayoutSample
//
//  Created by 川村真史 on 2014/11/07.
//  Copyright (c) 2014年 Masafumi Kawamura. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    var title = UILabel(forAutoLayout: ())
    var body = UILabel(forAutoLayout: ())
    var picture = UIImageView(forAutoLayout: ())
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK - Method
    
    func configure() {
        contentView.addSubview(title)
        contentView.addSubview(body)
        contentView.addSubview(picture)
        
        title.numberOfLines = 1
        body.numberOfLines = 0
        
        // FIXME: This border is able to delete
        title.layer.borderColor = UIColor.redColor().CGColor
        title.layer.borderWidth = 1.0
        body.layer.borderColor = UIColor.blueColor().CGColor
        body.layer.borderWidth = 1.0
        picture.layer.borderColor = UIColor.greenColor().CGColor
        picture.layer.borderWidth = 1.0
    }

    // MARK - Override
    
    override func updateConstraints() {
        // Picture's width x height = 30 x 30
        // margin-top: 10
        // margin-left: 10
        picture.autoSetDimensionsToSize(CGSizeMake(30, 30))
        picture.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: 10)
        picture.autoPinEdgeToSuperviewEdge(ALEdge.Left, withInset: 10)
        
        // height: 20
        // margin-top: 10
        // margin-left: picture's right to 10
        // margin-right(Trailing): 10
        title.autoSetDimension(ALDimension.Height, toSize: 20)
        title.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: 10)
        title.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: picture, withOffset: 10)
        title.autoPinEdgeToSuperviewEdge(ALEdge.Trailing, withInset: 10)

        // margin-top: from title's bottom to 5
        // margin-left: = title's margin-left
        // margin-right: = title's margin-right
        // margin-bottom: 10
        body.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: title, withOffset: 5)
        body.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Left, ofView: title)
        body.autoPinEdgeToSuperviewEdge(ALEdge.Trailing, withInset: 10)
        body.autoPinEdgeToSuperviewEdge(ALEdge.Bottom, withInset: 10)

        // require set autoPinEdgeToSuperviewEdge method "Top" and "Bottom"
        // This exmaple case: picture set Top, body set Bottom
        
        super.updateConstraints()
    }
}
