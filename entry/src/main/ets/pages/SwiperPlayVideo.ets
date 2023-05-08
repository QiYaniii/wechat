import { MySwiperVideo } from '../common/components/mySwiperVideo';
import { initializeOnStartup } from '../common/datamodel/SwiperVideoItem';
import { SwiperVideoItem } from '../common/datamodel/SwiperVideoItem';
@Entry
@Component
struct swiperPlayVideo{
  //获取数据
  @State videoArray:Array<SwiperVideoItem>=initializeOnStartup()
  //索引
  @State index:number=0
  //当前页面是否可见，
  @State pageShow:boolean=false
  build(){
    Column(){
      Swiper(){
        ForEach(this.videoArray.map((item,index)=>{
          return {i:index,data:item}
        }),item=>{
          MySwiperVideo({index:$index,pageShow:$pageShow,item:item.data,position:item.i})
        },item=>item.data.id.toString())
      }
      .indicator(false)
      .loop(false)
      .vertical(true)
      .onChange((index:number)=>{
        this.index=index
      })
    }
  }

  //当此页面可见时触发
  onPageShow(){
    this.pageShow=true
  }
  //当此页面不可见的时候触发
  onPageHide(){
    this.pageShow=false
  }
}