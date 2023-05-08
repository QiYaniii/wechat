import router from '@ohos.router';
//图片详情页
@Entry
@Component
struct wallDetails{
  private imageSrc:string=router.getParams()['src']
  build(){
    Column(){
      Image(this.imageSrc)
        .objectFit(ImageFit.Fill) // 图片铺满
        .height(400) // 固定高度
        .width(400)
        .borderRadius(10) // 圆角大小
        .margin({top:'5%',left:'8%'})
      Image($r('app.media.mjlogo'))
        .width(150)
        .height(130)
        .margin({left:'25%'})
    }.justifyContent(FlexAlign.Center)
  }
}