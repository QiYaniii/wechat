import { VideoData } from '../datamodel/VideoData';
//自定义视频列表组件

@Component
export struct MyVideo {
  build() {
    Column() {
      //跑马灯组件
      Marquee({
        start: true,
        step: 50,
        loop: -1,
        fromStart: true,
        src: "MengJiViews: 只需要￥199 即可成为尊贵的年费VIP"
      }).width(400)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(0X1fa5ef)
        .margin(5)
        .fontSize(30)
        .allowScale(false)

      //视频列表组件
      Grid(){
        ForEach(VideoData,item=>{
          GridItem(){
            Vertical_Item({imageSrc:item.image,source:item.source})
          }
        },item=>item.id.toString())
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(15)
      .rowsGap(15)
      .height('40%')
      .width('90%')
      .margin({top:'5%'})
    }
    .margin({top:'4%'})
  }
}

//单一自定定义视频组件
@Component
struct Vertical_Item{
  private imageSrc:string
  private source:string
  build(){
    Navigator({target:'pages/PlayVideo',type:NavigationType.Push}){
      Image(this.imageSrc)
        .objectFit(ImageFit.Cover)
        .borderRadius(10)
    }
    .params({source:this.source})
  }
}