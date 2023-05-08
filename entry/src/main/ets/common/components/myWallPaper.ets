import { initializeOnStartup } from '../datamodel/WallPaperItem';
import router from '@ohos.router';
import { WallPaperItem } from '../datamodel/WallPaperItem';
//自定义滑动浏览图片组件
@Component
export struct MyWallPaper {
  scrooller: Scroller = new Scroller()
  //创建数组存放数据
  private imageArray: Array<WallPaperItem> = []

  aboutToAppear() {
    this.imageArray = initializeOnStartup() //导入数据
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scrooller) {
        Column() {
          ForEach(this.imageArray, item => {
            Text(item.name)
              .fontSize(20)
              .margin({ top: 10 })
            Image(item.image)
              .objectFit(ImageFit.Fill)
              .height(150) // 固定高度
              .borderRadius(10) // 圆角大小
              .margin({ top: 10 }) //外边距
              .borderStyle(BorderStyle.Solid)
              .borderColor(0xC0C0C0)
              .borderRadius(10)
              .borderWidth(10)
              .onClick(() => {
                router.push({
                  url: 'pages/WallDetails',
                  params: { src: item.image }
                })
              })
          }, item => item.id.toString())
        }
        .width(330)
      }
      .width('100%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(30)

      Button({ type: ButtonType.Circle }) {
        Image($r('app.media.backtotop')).width(30).height(30)
      }
      .width(55)
      .height(55)
      .backgroundColor(0x317aff)
      .margin({ top: 60, left: 20 })
      .opacity(0.6)
      .position({ x: '70%', y: '75%' })
      .onClick(() => { //点击返回顶部
        this.scrooller.scrollEdge(Edge.Top)
      })
    }
    .width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}