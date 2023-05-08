import { SwiperVideoItem } from '../datamodel/SwiperVideoItem';
//自定义滑动播放视频组件

@Component
export struct MySwiperVideo {
  //1.获取数据
  @ObjectLink private item: SwiperVideoItem//@Observed与@ObjectLink配合使用实现 class修饰的模型数据改变触发UI更新
  private videoController: VideoController = new VideoController() //视频播放控制器
  @State private playState: number = 0 //0：停止播放，1：开始播放，2：暂停播放
  @Link @Watch("needPageShow") index: number //监听父组件索引变化
  @Link @Watch("needPageShow") pageShow: false //监听页面可见状态件索引变化
  private isShow: boolean = false //组件是否可见
  position: any //当前页面所在位置
  build() {
    //2.视频播放
    Stack({ alignContent: Alignment.Center | Alignment.End }) {
      Video({
        //视频播放地址
        src: this.item.src,
        //视频播放控制器
        controller: this.videoController
      })
        .controls(false)
        .autoPlay(this.playState == 1 ? true : false) //首次可见状态自动播放
        .objectFit(ImageFit.Contain) //自适应窗口大小
        .loop(true) //循环播放
        .onClick(() => { //点击播放,再次点击暂停
          if (this.playState == 1) {
            this.playState = 2
            this.videoController.pause()
          } else if (this.playState == 2) {
            this.playState = 1
            this.videoController.start()
          }
        })
      Column() {
        Image(this.item.isLikes ? $r('app.media.vote1') : $r('app.media.vote0')) //点赞图标
          .width(36).height(36).margin({top:40})
          .onClick(() => {
            if (this.item.isLikes) {
              this.item.likesCount--
            } else {
              this.item.likesCount++
            }
            this.item.isLikes = !this.item.isLikes
          })
        Text(this.item.likesCount == 0 ? '点赞' : ('' + this.item.likesCount)).fontSize(16).fontColor(0xffffff) //点赞文本


        Image($r('app.media.comment')) //评论图标
          .width(36).height(36).margin({ top: 20 })
        Text(this.item.commentCount == 0 ? '评论' : ('' + this.item.commentCount)).fontSize(16).fontColor(0xffffff) //评论文本

        Image($r('app.media.collect')) //收藏图标
          .width(36).height(36).margin({ top: 20 })
        Text(this.item.collect == 0 ? '收藏' : ('' + this.item.collect)).fontSize(16).fontColor(0xffffff) //收藏文本

        Image($r('app.media.share')) //转发图标
          .width(36).height(36).margin({ top: 20 })
      }.offset({ x: '-5%', y: '-10%' }) //位置调整

      Text(this.item.title)
        .fontSize(16)
        .fontColor(0xffffff)
        .margin(10)
        .offset({ x: '-50%', y: '40%' })
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }

  //监听父组件index变化和页面状态，一旦发生变化就会触发该函数
  needPageShow() {
    //页面可见状态变化
    if (this.pageShow) { //页面可见
      if (this.position == this.index) { //判断index与当前位置是否相同
        this.isShow = true
        this.onPageShow()
      } else {
        if (this.isShow) {
          this.isShow = true
          this.onPageSwiperHide()
        }
      }
    }
    else { //页面不可见
      if (this.position == this.index) {
        if (this.isShow) {
          this.isShow = false
          this.onPageHide()
        }
      }
    }
  }
  //页面可见状态时触发
  onPageShow() {
    if (this.playState != 1) {
      this.playState = 1
      this.videoController.start()
    }
  }

  //页面不可见状态会被调用，多次调用,这种不可见是点击页面跳转、或者应用回到桌面时触发的
  onPageHide() {
    if (this.playState != 2) {
      this.playState = 2
      this.videoController.pause()
    }
  }
  // 自定义的方法。页面不可见状态会被调用，多次调用,这种不可见是Swiper滑动时触发的
  onPageSwiperHide() {
    if (this.playState!=0) {
      this.playState = 0
      this.videoController.stop()
    }
  }
}