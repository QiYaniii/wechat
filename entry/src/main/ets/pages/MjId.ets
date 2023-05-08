import router from '@ohos.router';
@Entry
@Component
struct mjId{
  build(){
    Column({space:5}){

      Flex({alignContent:FlexAlign.Center}) {
        Image($r('app.media.turn_out'))
          .height(30)
          .width(30)
          .margin({left:35})
          .onClick(()=>{
            router.back()
          })
      }

      Image($r('app.media.mjlogo'))
        .width(200)
        .height(200)
        .margin({top:70,left:85})

      Text('蒙鸡号:   zxc9527')
        .fontSize(20)
        .width('90%')
        .fontWeight(700)
        .fontColor(0x696969)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)

      Text('蒙鸡号是账号唯一凭证，请妥善保管')
        .fontSize(16)
        .width('90%')
        .fontWeight(700)
        .fontColor(0xDCDCDC)
        .textAlign(TextAlign.Center)
    }.width('100%')
    .margin({ top: 15})
  }
}