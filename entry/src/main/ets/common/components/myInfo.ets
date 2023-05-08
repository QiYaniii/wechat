import { MyNickAndDialog } from './myNickAndDialog';
import router from '@ohos.router';
//自定义个人信息组件

@Component
export struct MyInfo {
  //昵称
  @State textValue: string = ''
  @State inputValue: string = '蒙小鸡'
  //生日
  @State date:string='Thu Jan 26 1999'
  selectedDate:Date=new Date("2001-1-1")

  //自定义弹窗控制器
  dialogController: CustomDialogController = new CustomDialogController({
    builder: MyNickAndDialog({
      cancel: this.onCancel,
      confirm:this.onAccept,
      textValue:$textValue,
      inputValue:$inputValue
    })
    ,
    cancel:this.existApp,
    autoCancel:true
  })
  build() {
    Column() {
      //第一栏:头像
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
        Text('头像').fontSize(16).width('100%')
        Image($r('app.media.headPic')).height(25).width(35).borderRadius(6)
        Image($r("app.media.turn_next")).height(25).width(25).margin({ left: 25 })
          .onClick(() => {
            router.push({ url: 'pages/HeadPic' })
          })
      }
      .width('100%')
      .height(60)
      .padding({ left: 35, right: 35, top: 35 })
      Divider()
        .vertical(false)
        .strokeWidth(5)
        .color(0xF5F5F5)
        .lineCap(LineCapStyle.Round)
        .margin({ top: 5 })


      //第二栏:昵称
      Flex({
        direction: FlexDirection.Row,
        alignItems: ItemAlign.Start,
        justifyContent: FlexAlign.SpaceBetween }) {
        Text('昵称')
          .fontSize(16)
          .width('100%')
        Text(this.inputValue)
          .fontSize(14)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
        Image($r("app.media.turn_next"))
          .height(25)
          .width(25)
          .onClick(() => {
            this.dialogController.open()
          })

      }
      .width('100%')
      .height(60)
      .padding({ left: 35, right: 35, top: 35 })
      Divider().vertical(false).strokeWidth(5).color(0xF5F5F5).lineCap(LineCapStyle.Round)


      //第三栏:生日
      Flex({direction: FlexDirection.Row,
        alignItems: ItemAlign.Start,
        justifyContent: FlexAlign.SpaceBetween }){
        Text('生日')
          .fontSize(16)
          .width('100%')
        Text(this.date)
          .fontSize(14)
          .width('100%')
        Image($r("app.media.turn_next"))
          .height(25)
          .width(25)
          .onClick(()=>{
            DatePickerDialog.show({
              start:new Date("2000-1-1"),
              end:new Date("2099-12-30"),
              selected:this.selectedDate,
              lunar:false,
              //点击确定按钮时触发
              onAccept:(value:DatePickerResult)=>{
                this.selectedDate.setFullYear(value.year,value.month,value.day)
                this.date=this.selectedDate.toDateString()
              },
              //点击取消按钮时触发
              onCancel: () => {
                console.info("DatePickerDialog:onCancel()")
              },
              //滑动选择器，当前选择项改变时触发
              onChange: (value: DatePickerResult) => {
                console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
              }


            })
          })

      }.width('100%')
      .height(60)
      .padding({ left: 35, right: 35, top: 35 })
      Divider().vertical(false).strokeWidth(5).color(0xF5F5F5).lineCap(LineCapStyle.Round)

      //第四栏: 蒙鸡号
      Flex({
        direction: FlexDirection.Row,
        alignItems: ItemAlign.Start,
        justifyContent: FlexAlign.SpaceBetween }) {

        Text('蒙鸡号')
          .fontSize(16)
          .width('100%')

        Text('zxc9527').fontSize(14).width('100%')

        Image($r("app.media.turn_next"))
          .onClick(()=>{
            router.push({url:"pages/MjId"})
          })
          .height(25)
          .width(25)
      }
      .width('100%')
      .height(60)
      .padding({ left: 35, right: 35, top: 35 })
      Divider().vertical(false).strokeWidth(5).color(0xF5F5F5).lineCap(LineCapStyle.Round)

      //第五栏:二维码
      Flex({
        direction: FlexDirection.Row,
        alignItems: ItemAlign.Start,
        justifyContent: FlexAlign.SpaceBetween }) {

        Text('二维码名片')
          .fontSize(16)
          .width('100%')

        Image($r("app.media.code"))
          .height(25)
          .width(35)
          .borderRadius(5)

        Image($r("app.media.turn_next"))
          .height(25)
          .width(25)
          .margin({ left: 30 })
          .onClick(() => {
            router.push({ url: 'pages/QrCode' })
          })
      }
      .width('100%')
      .height(60)
      .padding({ left: 35, right: 35, top: 35 })
    }
    .height(350)
  }


  //自定义弹窗回调---------------
  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }
}