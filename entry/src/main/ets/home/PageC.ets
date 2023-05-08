import router from '@ohos.router';

@Component
export struct PageC {
  build() {
    Column() {
      Text('MengJi wallPaper')
        .fontSize(35)
        .fontWeight(700)
        .fontColor(0xFF6699)
        .fontStyle(FontStyle.Italic)
      Image($r('app.media.enterwallpaper'))
        .width(55).height(55)
        .onClick(() => {
          router.push({
            url: 'pages/PlayWallPaper'
          })
        })
    }.width('100%')
    .justifyContent(FlexAlign.Center)
    .linearGradient({
      angle: 90,
      colors: [[0x66FFFF, 0.0], [0x66CCCC, 0.3], [0xFCD1D1, 1.0]]
    })
  }
}
