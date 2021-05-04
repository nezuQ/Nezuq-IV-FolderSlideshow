# Nezuq-IV-FolderSlideshow

"Nezuq-IV-FolderSlideshow"は、画像ビューワー"[IrfanView](https://www.irfanview.com/)"で複数画像フォルダを対象にしたスライドショーを見る為のPowershellスクリプトです。  
複数の画像フォルダ（又は画像フォルダを圧縮したファイル）、又はそれらのパスを列挙したテキストファイルをスクリプトファイルにドラッグ＆ドロップする事で、スライドショーが始まります。  
  // "Nezuq-IV-FolderSlideshow" is a Powershell script for viewing a slideshow of multiple image folders in the image viewer "IrfanView".  
  // A slideshow can be started by dragging and dropping multiple image folders (or compressed image folder files) or a text file listing those paths into a script file.  


# 使用方法 (Usage)

※1 画像フォルダの代わりに、画像フォルダを圧縮したファイル（拡張子:.zip）を指定する事もできます。  
  // *1 Instead of image folders, you can also specify compressed image folder files (extension:.zip).  

## フォルダ指定の場合 (For image folders)

複数の画像フォルダ（※1）を選択し、「Nezuq-IV-FolderSlideshow.cmd」にドラッグ＆ドロップします。  
  // Select multiple image folders(*1) and drag and drop them into "Nezuq-IV-FolderSlideshow.cmd".  

## ファイル指定の場合 (For path file)

画像フォルダ（※1）のパスをテキストファイル（文字コード：UTF8）に、改行で区切って列挙します。  
そのテキストファイルを「Nezuq-IV-FolderSlideshow.cmd」にドラッグ＆ドロップします。  
  // Enumerate the paths to the image folders(*1) in a text file (character code: UTF8), separated by a new line.  
  // Drag and drop the text file to "Nezuq-IV-FolderSlideshow.cmd".  


# インストール方法 (Installation)

1. 画像ビューワー「IrfanView」をインストールします。  
「IrfanView」定番の画像ビューワー - 窓の杜  
https://forest.watch.impress.co.jp/library/software/irfanview/  
※インストール先は「C:\Program Files\IrfanView」である事が想定されています。  
  // 1. Install the image viewer "IrfanView".  
  // https://www.irfanview.com/64bit.htm  
  // The installation location is assumed to be "C:Program Files\IrfanView".  

2. 「IrfanView」のスライドショー設定をします。（メニューバー[ファイル] >> [スライドショー]）  
※"スライドの方法"の欄で、スライドショーの表示速度を調整できます。  
※"実行モード"の欄で、ウィンドウの大きさや位置を調整できます。  
※スライドショー設定画面の右上の×ボタンで閉じても入力中の設定は保存されました。  
  // 2. Set up the slide show settings for "IrfanView" (Menu bar [File] >> [Slideshow]).  
  // "Slide advancement" memu allows you to adjust the display speed of the slideshow.  
  // "Play mode" menu allows you to adjust the size and position of the window.  
  // Even if you close the slide show setting screen by clicking the X button at the top right corner, the settings you are entering will be saved.  

3. 本プロジェクト（ファイル一式）をダウンロードします。  
  // 3. Download this project (complete set of files).  

4. プロジェクト内の「Nezuq-IV-FolderSlideshow.cmd」に先の使用方法で画像フォルダを指定します。  
  // 4. In the project, specify the image folder in "Nezuq-IV-FolderSlideshow.cmd" with the previous usage.  

5. スライドショーが開始します。  
  // 5. The slideshow begins.  


# 動作環境 (Environments)

次の環境で動作確認しています。  
  // It has been tested in the following environments  

* Microsoft Windows 10 Home
* Powershell (PSVersion:5.1, PSEdition:Desktop)
* IrfanView 4.57 - 64bit


# 注意事項 (Note)

* コマンドライン画面が表示されます。終了しないように注意して下さい。スライドショー終了時に自動で終了します。  
  // The command line screen is displayed. Be careful not to exit. It quits automatically at the end of the slide show.

* テキストファイルを指定する場合は、文字コードはUTF8に限定されます。  
  // If you specify a text file, the character set is limited to UTF8.

* スライドショーが開始されると、スクリプトファイルと同じフォルダ内に一時フォルダ「`__temp__`」が作成されます。この一時フォルダは、スライドショーが終了すると削除されます。  
  // After the slideshow starts, a temporary folder "`__temp__`" will be created in the same folder as the script file. The temporary folder will be deleted after the slideshow is over.


# ライセンス (License)

「Nezuq-IV-FolderSlideshow」は、[MIT license](https://en.wikipedia.org/wiki/MIT_License)です。  
※「IrfanView」自体のライセンスは、[本家サイト](https://www.irfanview.com/main_what_is_engl.htm)をご確認下さい。  
  //This software is released under the [MIT License](https://en.wikipedia.org/wiki/MIT_License), see License.txt.  
  //For the license of "IrfanView" itself, please refer to [Home Page](https://www.irfanview.com/main_what_is_engl.htm).  


# 作者 (Author)

* nezuq
* Twitter : https://twitter.com/nezuq


Enjoy! Thank you!
