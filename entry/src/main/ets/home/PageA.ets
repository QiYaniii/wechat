import { MyVideo } from '../common/components/myVideo';
import { MyBanner } from '../common/components/myBanner';
import { MySearch } from '../common/components/mySearch';
import { MyHead } from '../common/components/myHead';
import { MyChat } from '../common/components/myChat';
//即PageTab展示的首页面
@Component
export struct PageA{
  build(){
    Column(){
      //引入自定义头部组件
MyHead()
MyChat()
     // //引入自定义搜索组件
     //  MySearch()
     //  //引入自定义轮播图组件
     //  MyBanner()
     //  //自定义视频列表组件
     //  MyVideo()
    }
  }
}