//自定义昵称修改组件
@CustomDialog
export struct MyNickAndDialog{
  @Link textValue:string
  @Link inputValue:string
  controller:CustomDialogController
  //自定义弹窗的回调
  cancel:()=>void
  confirm:()=>void

  build(){
    Column(){
      Text('修改昵称').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({placeholder:'',text:this.textValue}).height(60).width('90%')
        .onChange((value:string)=>{
          this.textValue=value
        })
      Text('好昵称=好印象').fontSize(16).margin({ bottom: 10 })
      Flex({justifyContent:FlexAlign.SpaceAround}){
        Button('取消').backgroundColor(0xffffff).fontColor(Color.Black)
          .onClick(()=>{
                this.controller.close()
                this.cancel()
          })

        Button('确认').backgroundColor(0xffffff).fontColor(Color.Black)
          .onClick(()=>{
            //将修改值传递给父组件
            this.inputValue=this.textValue
            this.controller.close()
            this.confirm()
          })
      }.margin({bottom:10})
    }
  }
}