import router from '@ohos.router';
import { MyInput } from '../common/components/myInput';

@Entry
@Component
struct Index {
  @State default_name_info: string = '请输入用户名'
  @State default_pass_info: string = '请输入密码'
  @State select: boolean = false
  @State username: string = ""
  @State password: string = ""
  @State background_imgsrc: Resource = $r('app.media.indexbg')
  //手机号的正则表达式
  private username_reg = /^1[3|4|5|6|7|8|9][0-9]{9}/

  build() {
    Flex({ justifyContent: FlexAlign.End,
      alignItems: ItemAlign.Start,
      direction: FlexDirection.Column }) {
      // Text('微信')
      //   .fontSize(32)
      //   .fontColor('#F0F8FF')
      //   .fontStyle(FontStyle.Italic)
      //   .fontWeight(700)
      // // 使用条件渲染，实现文本的提示与隐藏
      // if (!this.username_reg.test(this.username) && this.username != "") {
      //   Text("请使用11位手机号进行登录")
      //     .fontSize(12)
      //     .fontWeight(700)
      //     .fontColor("#ff0000")
      //     .width("80%")
      // }
      // MyInput({
      //   inputValue: $username,
      //   placeholder: this.default_name_info,
      //   inputType: InputType.Normal
      // })
      // MyInput({
      //   inputValue: $password,
      //   placeholder: this.default_pass_info,
      //   inputType: InputType.Password
      // })

      Button('Login', { type: ButtonType.Capsule })
        .width('30%')
        .height(40)
        .backgroundColor('#1fa5ef')
        .fontSize(20)
        .fontStyle(FontStyle.Italic)
        .borderRadius(1)
        .margin(20)
        .onClick(() => {
          router.push({ url: 'pages/Loading' })
        })
        // .onClick(() => {
        //   if (this.select == false) {
        //     AlertDialog.show({
        //       title: '温馨提示',
        //       message: '请先勾选隐私协议',
        //       //取消按钮
        //       primaryButton: {
        //         value: '取消',
        //         action: () => {
        //           console.info('点击了取消按钮')
        //         }
        //       },
        //       //确认按钮
        //       secondaryButton: {
        //         value: '确认',
        //         action: () => {
        //           console.info('点击了确认按钮')
        //         }
        //       }
        //     ,
        //       //点击遮障层关闭时触发
        //       cancel: () => {
        //         console.info('击遮障层关闭弹窗时触发')
        //       }
        //     })
        //   } else {
        //     router.push({ url: 'pages/Loading' })
        //   }
        // })
      // Flex({
      //   justifyContent: FlexAlign.Start
      // }) {
      //   Checkbox()
      //     .width(20)
      //     .height(20)
      //     .select(this.select) //选中状态
      //     .selectedColor(0x1fa5ef)
      //     .position({ x: '42', y: '15%' })
      //     .onChange(() => {
      //       this.select = true
      //     })
      //
      //   Text('登录前请勾选隐私协议').fontSize(16).fontColor('#F0F8FF').fontWeight(700).position({ x: '35%', y: '52%' })
      // }.height(40)
      // .margin({ top: 10, left: 90 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundImage(this.background_imgsrc, ImageRepeat.NoRepeat)
    .backgroundImageSize(ImageSize.Cover)
  }
}