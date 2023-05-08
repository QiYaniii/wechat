import { MyTab } from '../common/components/myTab';
import { PageD } from '../home/PageD';
import { PageC } from '../home/PageC';
import { PageB } from '../home/PageB';
import { PageA } from '../home/PageA';
@Entry
@Component
struct pageTab {
  @State index:number=0// 当前滑动的索引位置
  build() {
    Flex({ direction: FlexDirection.Column }) {
      Swiper(){
        PageA()
        PageB()
        PageC()
        PageD()
      }
      .index(this.index)//变化的索引,底部切换页面跟随变化
      .indicator(false)//关闭指示点
      .loop(false)//关闭自动切换
      .duration(50)//切换动画时长
      .onChange((index:number)=>{
        this.index=index
      }).flexGrow(1)//占据全部比重

      MyTab({index:$index})
    }
  }
}