import { initializeOnStartup } from '../datamodel/ChatItem';
import router from '@ohos.router';
import { ChatItem } from '../datamodel/ChatItem';

//自定义滑动浏览图片组件
@Component
export struct MyChat {
  scrooller: Scroller = new Scroller()
  //创建数组存放数据
  private chatArray: Array<ChatItem> = []

  aboutToAppear() {
    this.chatArray = initializeOnStartup() //导入数据
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scrooller) {
        Column() {
          ForEach(this.chatArray, item => {
            Stack() {
              Row() {
                Column() {
                  Image(item.image)
                    .height(50) // 固定高度
                    .width(50)
                    .borderRadius(10) // 圆角大小
                    .margin({ top: 10 }) //外边距
                    .onClick(() => {
                      router.push({
                        url: 'pages/WallDetails',
                        params: { src: item.image }
                      })
                    })
                }.margin({left:15})

                Column() {
                  Text(item.name)
                    .fontSize(20)
                    .margin({ top: 10 })
                    .fontSize(18)
                  Text(item.text)
                    .fontSize(20)
                    .margin({ top: 10 })
                    .fontColor('#A5A5A5')
                    .fontSize(14)
                }.margin({left:15})
              }.width('100%').justifyContent(FlexAlign.Start)

              Row() {
                Column() {
                  Text(item.time)
                    .fontSize(20)
                    .margin({ top: 10 })
                    .fontColor('#A5A5A5')
                    .fontSize(14)
                  Text(' ')
                    .fontSize(20)
                    .margin({ top: 10 })
                }.margin({right:15})
              }
              .width('100%').justifyContent(FlexAlign.End)
            }.onClick(() => {
              router.push({
                url: 'pages/WallDetails',
                params: { src: item.image }
              })
            })
            Row(){
              Row(){}.width('80%')
              .borderStyle(BorderStyle.Solid)
              .borderColor(0xDADADA)
              .borderWidth({bottom:1,top:0,left:0,right:0})
              .height(1)

            }.width('100%').justifyContent(FlexAlign.End)


          }, item => item.id.toString())
        }
      }
      .height('90%')
      .width('100%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .scrollBarWidth(30)
      // Button({type:ButtonType.Circle}){
      //   Image($r('app.media.backtotop')).width(30).height(30)
      // }
      // .width(55)
      // .height(55)
      // .backgroundColor(0x317aff)
      // .margin({ top: 60, left: 20 })
      // .opacity(0.6)
      // .position({x:'70%',y:'75%'})
      // .onClick(()=>{//点击返回顶部
      //   this.scrooller.scrollEdge(Edge.Top)
      // })
    }
    .width('100%').height('100%').backgroundColor(0xFFFFFF)
  }
}