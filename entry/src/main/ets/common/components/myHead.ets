@Component
export struct MyHead {
  build() {
    Column() {
      Stack() {
        Row() {
          Text("微信").align(Alignment.Center)
        }.width("100%").justifyContent(FlexAlign.Center)

        Row() {
          Image($r('app.media.magnifier')).height('30')
          Image($r('app.media.plus')).height('30')
        }.width("100%").justifyContent(FlexAlign.End)

        Column() {
        }
        .width('100%')
        .borderStyle(BorderStyle.Solid)
        .borderColor(0xDADADA)
        .borderWidth({ bottom: 1 })
        .height(1)
        .margin({ top: 30 })
      }.margin({ top: 30 })
    }.backgroundColor('#EDEDED')

  }
}