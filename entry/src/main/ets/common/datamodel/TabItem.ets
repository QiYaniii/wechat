//底部导航栏数据模型
export class TabItem {
  id: string
  name: string
  imagePressed: Resource //手指按下状态的图片（蓝色）
  imageNormal: Resource //默认状态下的图片（灰色）

  constructor(id: string, name: string, imagePressed: Resource, imageNormal: Resource) {
    this.id = id
    this.name = name
    this.imagePressed = imagePressed
    this.imageNormal = imageNormal
  }
}

//底部导航栏数据
const tabData:any[]=[
  {'id':'1','name':'Home','imagePressed':$r('app.media.a2'),'imageNormal':$r('app.media.a1')},
  {'id':'2','name':'Video','imagePressed':$r('app.media.b2'),'imageNormal':$r('app.media.b1')},
  {'id':'3','name':'WallPaper','imagePressed':$r('app.media.c2'),'imageNormal':$r('app.media.c1')},
  {'id':'4','name':'Person','imagePressed':$r('app.media.d2'),'imageNormal':$r('app.media.d1')}
]

//填充数据
export function initializeOnStartup():Array<TabItem>{
  //创建一个空的中间数组
  let tabDataArray:Array<TabItem>=[]

  //遍历数据数组
  tabData.forEach((item,index)=>{
    tabDataArray.push(new TabItem(item.id,item.name,item.imagePressed,item.imageNormal))
  })

  return tabDataArray;
}