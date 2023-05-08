//创建轮播图的数据模型
export class BannerItem {
  id: string;
  name: string;
  image: Resource;

  constructor(id: string, name: string, imgae: Resource) {
    this.id = id;
    this.name = name;
    this.image = imgae;
  }
}

//轮播图的数据
const imageData:any[]=[
  {'id':'1','name':'第一张图',image:$r('app.media.image1')},
  {'id':'2','name':'第二张图',image:$r('app.media.image2')},
  {'id':'3','name':'第三张图',image:$r('app.media.image3')}
]

//填充数据
export function initializeOnStartup():Array<BannerItem>{
  //创建一个空的中间数组
  let imgaeDataArray:Array<BannerItem>=[]
  //遍历数据数组
  imageData.forEach((item,index)=>{
    imgaeDataArray.push(new BannerItem(item.id,item.name,item.image))
  })
  return imgaeDataArray;
}
