//
//  MMMapViewController.m
//  mapboxText
//
//  Created by Maciej Lobodzinski on 24/02/14.
//  Copyright (c) 2014 lobodzinski. All rights reserved.
//

#import "MMMapViewController.h"

@interface MMMapViewController ()

@property (nonatomic, strong) RMMapView *mapView;

- (void)_setupMapView;
- (void)_setupAndAddMapOnlineSource;
- (void)_setupAndAddMapOfflineSources;

@end

@implementation MMMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _setupMapView];
}

- (void)_setupMapView
{
    self.mapView = [[RMMapView alloc] initWithFrame:CGRectMake(0,0,
                                                                self.view.frame.size.width,
                                                                self.view.frame.size.height)];
    self.mapView.delegate = self;
    self.mapView.maxZoom = 18;
    self.mapView.minZoom = 0;
    
    [self _setupAndAddMapOnlineSource];
    [self _setupAndAddMapOfflineSources];
    
    [self.view addSubview:self.mapView];
}

- (void)_setupAndAddMapOnlineSource
{
    RMMapboxSource *onlineTileSource = [[RMMapboxSource alloc] initWithMapID:@"folley.gf5jndhd"];
    [self.mapView addTileSource:onlineTileSource];
}

- (void)_setupAndAddMapOfflineSources
{
    // add first source
    RMMBTilesSource *washingtonSource = [[RMMBTilesSource alloc] initWithTileSetResource:@"wTest1"
                                                                                  ofType:@"mbtiles"];
    washingtonSource.maxZoom = 18.0;
    washingtonSource.minZoom = 16.0;
    [self.mapView addTileSource:washingtonSource];
    
    // add second source
    RMMBTilesSource *englandSource = [[RMMBTilesSource alloc] initWithTileSetResource:@"wTest2"
                                                                               ofType:@"mbtiles"];
    englandSource.maxZoom = 18.0;
    englandSource.minZoom = 16.0;
    [self.mapView addTileSource:englandSource];
}

@end
