//自定义搜索框组件
@Component
export struct MySearch{
  build(){
    Flex({alignItems:ItemAlign.Center}){
      TextInput({placeholder:'请输入...'})
        .type(InputType.Normal)
        .placeholderColor('#B0C4DE')
        .placeholderFont({size:20,weight:2})
        .enterKeyType(EnterKeyType.Search)
        .caretColor(Color.Green)
        .height(40)
        .borderRadius(20)
        .backgroundColor(Color.White)
        .layoutWeight(8)
      Button({type:ButtonType.Capsule})
      {
        Text('搜索').fontSize(17).fontColor('#1E90FF')
      }
      .backgroundColor('#00000000')
      .layoutWeight(2)
      .onClick(()=>{
        console.info('点击搜索')
      })
    }
    .height(50)
    .padding({left:10})
    .backgroundColor('#FFedf2f5')
  }
}

/**
 * 直接使用Search组件实现搜索框效果
 * @Component
export struct MySearch {
 @State changeValue: string = ' '
 controller: SearchController = new SearchController()
 build() {
 Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
 Search({value: this.changeValue, controller: this.controller})
 .searchButton('搜索')
 .width('90%')
 .height(35)
 .backgroundColor(Color.White)
 .placeholderColor(Color.Grey)
 .onChange((value: string) => {
 this.changeValue = value
 })
 .margin({ top: 10, left:5, right:5 })
 }.width('100%')
 }
 }
 */
