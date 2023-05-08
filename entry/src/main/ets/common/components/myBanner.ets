import { initializeOnStartup } from '../datamodel/BannerItem';
import { BannerItem } from '../datamodel/BannerItem';
//自定义轮播图组件

@Component
export struct MyBanner {
  //获取数据
  private imageArray: Array<BannerItem> = []
  //定时器ID
  private timerId: number = -1
  //swiper控制器
  private swiperController: SwiperController = new SwiperController()
  //索引
  @State index: number = 0

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      //Swiper实现轮播图切换效果
      Swiper(this.swiperController) { //传入控制器
        ForEach(this.imageArray, item => { //ForEach循环渲染，item就是imageArray中的单一元素
          Image(item.image)
            .objectFit(ImageFit.Fill)
            .height(200)
            .borderRadius(10)
            .margin({ left: 30, right: 30 })
        }, item => item.id.toString())
      }
      .index(this.index)
      .indicator(false)
      .duration(200)
      .height(200)
      .onChange((index: number) => {
        this.index = index
      })
      //手指触摸时不自动滑到下一页
      .onTouch((event: TouchEvent) => {
        switch (event.type) {
          case TouchType.Down:
            this.stopPlay()
            break;
          case TouchType.Up:
            this.startPlay()
            break;
        }
      })
      //使用flex为底部圆点的容器,使用Circle组件实现圆点效果
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

        //使用FoForEach,第一个参数必须使用map方法返回指定{i:index,data:item}格式，
        //在第二个参数中才能获取到位置i
        ForEach(this.imageArray.map((item, index) => {
          return { i: index, data: item };
        }),
          item => {
            Circle({ width: 6, height: 6 })
              .margin({ right: 6 })
              .fill(item.i == this.index ? '#ffffff' : '#f54040')
          },
          item => item.data.id.toString())
      }
      .align(Alignment.Bottom)
      .margin({bottom:5})
    }
    .margin({top:5})
  }

  //生命周期回调函数
  aboutToAppear() {
    //拿到数据
    this.imageArray = initializeOnStartup()
    this.startPlay()
  }

  aboutToDisappear() {
    this.stopPlay()
  }

  //开启轮播图
  startPlay() {
    if (this.timerId = -1) {
      this.timerId = setInterval(() => {
        //启动轮播图
        this.swiperController.showNext() //切换到下一页
      }, 3000)
    }
  }

  //结束轮播图
  stopPlay() {
    if (this.timerId > 0) {
      clearInterval(this.timerId)
      this.timerId = -1
    }
  }
}