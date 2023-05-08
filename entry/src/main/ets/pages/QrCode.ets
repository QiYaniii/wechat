import router from '@ohos.router';
@Entry
@Component
struct QrCode{
  private value: string = 'Meng Ji'
  build(){
    Column(){

      Flex({alignContent:FlexAlign.Start}) {
        Image($r('app.media.turn_out'))
          .height(30)
          .width(30)
          .margin({left:35})
          .onClick(()=>{
            router.back()
          })
      }

      QRCode(this.value)
        .color(0x1fa5ef)
        .width(200)
        .height(200)
        .borderStyle(BorderStyle.Solid)
        .borderWidth(15)
        .borderColor(0xf1f3f4)
        .borderRadius(10)
        .margin({top:70})

      Text('扫码成为蒙鸡好友')
        .fontSize(20)
        .width('90%')
        .fontWeight(700)
        .fontColor("#87CEFA")
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
    }.width('100%')
    .margin({ top: 15})

  }
}