import { initializeOnStartup } from '../datamodel/TabItem';
import { TabItem } from '../datamodel/TabItem';
//自定义底部导航栏组件

@Component
export struct MyTab {
  //定义索引
  @Link index: number
  //获取数据
  private tabArray: Array<TabItem> = initializeOnStartup()

  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ItemBar({ index: $index, position: 0, item: this.tabArray[0] })
      ItemBar({ index: $index, position: 1, item: this.tabArray[1] })
      ItemBar({ index: $index, position: 2, item: this.tabArray[2] })
      ItemBar({ index: $index, position: 3, item: this.tabArray[3] })
    }
    .width('100%')
    .height(60)
    .backgroundColor(0xFFFFFF)
  }
}

@Component
struct ItemBar {
  //索引
  @Link index: number
  //该组件所在位置
  position: any
  //获取数据模型
  private item: TabItem

  build() {
    Flex({ direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Image(this.index == this.position ? this.item.imagePressed : this.item.imageNormal)
        .width(30)
        .height(30)
        .onClick(() => { //点击导航栏图标,设定我们的索引为当前的位置
          this.index = this.position
        })
      Text(this.item.name)
        .fontSize(12)
        .fontColor(this.index == this.position ? 0x1fa5ef : 0x000000)
        .onClick(() => {
          this.index = this.position
        })
    }.height('100%')
    .width('100%')
    .layoutWeight(1) //Flex布局容器下占据1个比重
  }
}