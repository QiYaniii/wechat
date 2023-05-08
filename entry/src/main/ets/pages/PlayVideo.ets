import router from '@ohos.router';
@Entry
@Component
struct PlayVideo{
  //获取页面跳转时携带的参数(视频路径)
  private source:string=router.getParams()['source']
  build(){
    Column(){
      Video({
        src:this.source
      })
    }
  }
}