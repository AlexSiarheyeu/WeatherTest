//
//  ForecatsCollectionViewControllerTest.swift
//  WeatherTestcaseTests
//
//  Created by Alexey Sergeev on 9/23/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import XCTest
@testable import WeatherTestcase

class ForecatsCollectionViewControllerTest: XCTestCase {

    var sut: ForecastWeatherCollectionViewController!
    var mockCollectionView: MockCollectionView!
    override func setUp() {
        sut = ForecastWeatherCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        sut.loadViewIfNeeded()
        
        mockCollectionView = MockCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockCollectionView = nil
    }
    
    func testForecastControllerNotNilWhenViewIsLoaded() {
        XCTAssertNotNil(sut)
    }
    
    func testWhenViewIsLoadedCollectionViewDelegateIsSet() {
        XCTAssertTrue(sut.collectionView.delegate is ForecastWeatherCollectionViewController)
    }
    
    func testWhenViewIsLoadedCollectionViewDataSourceIsSet() {
        XCTAssertTrue(sut.collectionView.dataSource is ForecastWeatherCollectionViewController)
    }

    
    func testWhenViewIsLoadedCollectionViewFlowLayoutIsSet() {
        XCTAssertTrue(sut.collectionView.collectionViewLayout is UICollectionViewFlowLayout)
    }
    
    func testWhenViewIsLoadedCollectionViewDelegateEqualsDataSource() {
        XCTAssertEqual(sut.collectionView.delegate as? ForecastWeatherCollectionViewController,
                       sut.collectionView.dataSource as? ForecastWeatherCollectionViewController)
    }
    
    func testCellForRowAtIndexPathDequeuesCellFromCollectionView() {
        
        mockCollectionView = MockCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
        mockCollectionView.dataSource = sut
        mockCollectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ForecastCollectionViewCell.self))
        _ = mockCollectionView.cellForItem(at: IndexPath(row: 0, section: 0))
        
        XCTAssertFalse(mockCollectionView.isCellDequeued)
    }
}

class MockCollectionView: UICollectionView {
    
    var isCellDequeued = false
    
    init(collectionViewLayout: UICollectionViewFlowLayout) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0),
                   collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        isCellDequeued = true
        return super.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
}

class MockForecastCell: ForecastCollectionViewCell {
    
    var weather: ResultWeather?
    
    func configure(withWeather weather: ResultWeather) {
        self.weather = weather
    }
}
