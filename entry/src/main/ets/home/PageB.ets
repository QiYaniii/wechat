import router from '@ohos.router';
@Component
export struct PageB{
  build(){
    Column(){
      Text('MengJi playing')
        .fontSize(35)
        .fontWeight(700)
        .fontColor(0x87CEFA)
        .fontStyle(FontStyle.Italic)
      Image($r('app.media.play2')).width(60).height(60)
        .onClick(()=>{
          router.push({url:'pages/SwiperPlayVideo'})
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .linearGradient({
      angle:90,
      colors:[[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
    })
  }
}