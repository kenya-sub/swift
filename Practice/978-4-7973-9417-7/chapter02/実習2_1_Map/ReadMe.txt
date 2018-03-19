==========================================================================
■2_1_Mapプロジェクトについて

このプロジェクトは画面に地図を表示し、iOSシミュレータをタッチすることで、地図の移動、拡大、縮小を行うアプリを作成するためのプロジェクトです。
==========================================================================
■ファイルの説明

AppDelegate.swift
アプリの起動やバックグラウンド状態に移行する際などの状態遷移をコントロールする。

ViewController.swift
ビューコントローラーファイル。今回のアプリではこのファイルに何もコードを書かない。

Main.storyboard
ストーリーボードファイル。グラフィカルに画面にUI部品を配置することができる。地図画面を配置する。

Assets.xcassets
画像が格納されたフォルダ。アプリアイコンの画像などを設定する。

LaunchScreen.storyboard
起動画面を設定するファイル。

Info.plist
アプリの設定ファイル。通常は直接このファイルを編集せずに、プロジェクトファイルから間接的に編集する。

Map.app
アプリ本体

MapKit.framework
地図を表示するためのフレームワーク。MKMapViewを使用するためにimportする。

===========================================================================
■動作環境

・Xcode 9.0 もしくはそれ以降
・macOS 10.12.6 もしくはそれ以降
・iOS 10.0 もしくはそれ以降
・iPhone X, iPhone 8, iPhone 8 Plus, iPhone 7, iPhone 7 Plus, iPhone 6s, iPhone 6s Plus, iPhone 6, iPhone 6 Plus, iPhone SE, iPhone 5s, iPod Touch(第6世代), 12.9インチiPad Pro(第2世代), 12.9インチiPad Pro(第1世代), 10.5インチiPad Pro, 9.7インチiPad Pro, iPad Air 2, iPad Air, iPad(第5世代), iPad mini 4, iPad mini 3, iPad mini 2
===========================================================================
Copyright (C) 2017 TEKTEK Inc. All rights reserved.