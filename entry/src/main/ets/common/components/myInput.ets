//自定义输入框组件
@Component
export struct MyInput{
  @Prop placeholder:string
  @Link inputValue:string
  private inputType:InputType=InputType.Normal
  build(){
    Row({space:5}){
      TextInput({placeholder:this.placeholder,text:this.inputValue})
        .onChange((value:string)=>{
          this.inputValue=value
        })
        .type(this.inputType)
        .width('80%')
        .height(40)
        .margin({top:30})
        .borderRadius(4)
        .backgroundColor('#fffffff')
        .opacity(0.4)
    }
  }
}









