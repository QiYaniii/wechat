//图片列表的数据模型
export class WallPaperItem{
  id:string;
  name:string;
  image:Resource;
  constructor(id:string,name:string,imgae:Resource){
    this.id=id;
    this.name=name;
    this.image=imgae;
  }
}


//图片列表的数据
const wallPaperData:any[]=[
  {'id':'1','name':'迷雾之岛','image':$r('app.media.wallpaper1')},
  {'id':'2','name':'林深见鹿','image':$r('app.media.wallpaper2')},
  {'id':'3','name':'极梦星海','image':$r('app.media.wallpaper3')},
  {'id':'4','name':'迷迭幻境','image':$r('app.media.wallpaper4')},
  {'id':'5','name':'告乐沙语','image':$r('app.media.wallpaper5')},
  {'id':'6','name':'极梦星海','image':$r('app.media.wallpaper3')},
  {'id':'7','name':'迷迭幻境','image':$r('app.media.wallpaper4')},
  {'id':'8','name':'告乐沙语','image':$r('app.media.wallpaper5')}
]

//填充数据
export function initializeOnStartup():Array<WallPaperItem>{
  //创建一个空的中间数组
  let wallPaperDataArray:Array<WallPaperItem>=[]

  //遍历数据数组
  wallPaperData.forEach((item,index)=>{
    wallPaperDataArray.push(new WallPaperItem(item.id,item.name,item.image))
  })

  return wallPaperDataArray;
}