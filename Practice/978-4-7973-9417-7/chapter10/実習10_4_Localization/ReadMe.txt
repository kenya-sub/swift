==========================================================================
■10_4_Localizationプロジェクトについて

このプロジェクトはアプリの多言語化に必要なファイルを準備するためのプロジェクトです。
==========================================================================
■ファイルの説明

AppDelegate.swift
アプリの起動やバックグラウンド状態に移行する際などの状態遷移をコントロールする。

ViewController.swift
ビューコントローラーファイル。ボタンがタップされたらラベルの文字列を変更する処理を記述する。

Main.storyboard(Base)
ストーリーボードファイル。グラフィカルに画面にUI部品を配置することができる。ラベルとボタンを配置する。

Main.storyboard(Japanese)
ストーリーボード用の文字列ファイル。ストーリーボード上の文字列を日本語に翻訳して記述する。

Assets.xcassets
画像が格納されたフォルダ。アプリアイコンの画像などを設定する。

LaunchScreen.storyboard(Base)
起動画面を設定するファイル。

LaunchScreen.strings(Japanese)
起動画面用の文字列ファイル。起動画面上の文字列を日本語に翻訳して記述する。基本的には起動画面には文字列を表示しないので、このファイルを使用することはない。

InfoPlist.strings(Localization用)
アプリの設定用の文字列ファイル。Info.plistの内容を翻訳して記述する。

Info.plist
アプリの設定ファイル。通常は直接このファイルを編集せずに、プロジェクトファイルから間接的に編集する。

Localization.app
アプリ本体

ja.xliff
ローカライズ交換ファイル。XML形式で日本語訳を記述する。

===========================================================================
■動作環境

・Xcode 9.0 もしくはそれ以降
・macOS 10.12.6 もしくはそれ以降
・iOS 10.0 もしくはそれ以降
・iPhone X, iPhone 8, iPhone 8 Plus, iPhone 7, iPhone 7 Plus, iPhone 6s, iPhone 6s Plus, iPhone 6, iPhone 6 Plus, iPhone SE, iPhone 5s, iPod Touch(第6世代), 12.9インチiPad Pro(第2世代), 12.9インチiPad Pro(第1世代), 10.5インチiPad Pro, 9.7インチiPad Pro, iPad Air 2, iPad Air, iPad(第5世代), iPad mini 4, iPad mini 3, iPad mini 2
===========================================================================
Copyright (C) 2017 TEKTEK Inc. All rights reserved.