import router from '@ohos.router';

@Entry
@Component
struct headPic {
  build() {
    Column({ space: 5 }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {

        Image($r('app.media.turn_out'))
          .height(25)
          .width(30)
          .onClick(() => {
            router.back()
          })
        Text('头像')
          .fontSize(20)
          .fontWeight(400)
          .width('20%')
          .fontStyle(FontStyle.Normal)
        Button({ type: ButtonType.Circle }) {
          Image($r('app.media.more')).width(20).height(20)
        }
        .backgroundColor('#f1f3f4')
        .width(25)
        .height(30)
        .onClick(() => {
          ActionSheet.show({
            title: '头像处理',
            message: '',
            confirm: {
              value: '确认',
              action: () => {
                console.info('点击了确认')
              }
            },
            sheets: [
              {
                title: '从手机相册选择',
                action: () => {
                  console.error('apple')
                }
              },
              {
                title:'查看上一张头像',
                action: () => {
                  console.error('banana')
                }
              },
              {
                title:'保持到本地',
                action: () => {
                  console.error('banana')
                }
              }
            ]
          }
          )
        })
      }
      .backgroundColor('#f1f3f4')
      .padding(10)
      Image($r('app.media.headPic'))
        .width(250)
        .height(250)
        .margin({ top: 70 })
        .borderStyle(BorderStyle.Solid)
        .borderColor(0xC0C0C0)
        .borderRadius(125)
        .borderWidth(10)
    }
    .width('100%')
    .margin({ top: 15 })
  }
}