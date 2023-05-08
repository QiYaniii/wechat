import router from '@ohos.router';
@Entry
@Component
struct loading {
  build() {
    Column() {
      //文本提示
      Text('LoadingProgress')
        .fontSize(20)
        .fontColor(0x808080)
        .width('90%')
        .fontWeight(700)
        .textAlign(TextAlign.Center)
      //进度条
      LoadingProgress()
        .color(0xDCDCDC)
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .margin({top:5})
  }

  //页面跳转函数
  LoadingTime(){
    setTimeout(()=>{
      router.push({url:'pages/PageTab'})
    },5000)
  }
  //页面显示时就触发
  onPageShow(){
    this.LoadingTime()
  }
}