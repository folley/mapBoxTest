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
    self.mapView.zoom = 1;
    self.mapView.maxZoom = 2;
    self.mapView.minZoom = 3;
    
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
    RMMBTilesSource *washingtonSource = [[RMMBTilesSource alloc] initWithTileSetResource:@"washington"
                                                                             ofType:@"mbtiles"];
    washingtonSource.maxZoom = 8.0;
    washingtonSource.minZoom = 0.0;
    [self.mapView addTileSource:washingtonSource];
    
    // add second source
    RMMBTilesSource *englandSource = [[RMMBTilesSource alloc] initWithTileSetResource:@"england"
                                                                              ofType:@"mbtiles"];
    englandSource.maxZoom = 8.0;
    englandSource.minZoom = 7.0;
    [self.mapView addTileSource:englandSource];
}

@end
