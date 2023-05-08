//图片列表的数据模型
export class ChatItem{
  id:string;
  name:string;
  image:Resource;
  text:string;
  time:string;
  constructor(id:string,name:string,image:Resource,text:string,time:string){
    this.id=id;
    this.name=name;
    this.image=image;
    this.text=text;
    this.time=time;
  }
}


//图片列表的数据
const chatData:any[]=[
  {'id':'1','name':'迷雾之岛','image':$r('app.media.wallpaper1'),'text':'测试','time':'上午10:20'},
  {'id':'2','name':'林深见鹿','image':$r('app.media.wallpaper2'),'text':'测试','time':'上午10:20'},
  {'id':'3','name':'极梦星海','image':$r('app.media.wallpaper3'),'text':'测试','time':'上午10:20'},
  {'id':'4','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'5','name':'告乐沙语','image':$r('app.media.wallpaper5'),'text':'测试','time':'上午10:20'},
  {'id':'6','name':'极梦星海','image':$r('app.media.wallpaper3'),'text':'测试','time':'上午10:20'},
  {'id':'7','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'8','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'9','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'10','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'11','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'12','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'13','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'14','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'15','name':'迷迭幻境','image':$r('app.media.wallpaper4'),'text':'测试','time':'上午10:20'},
  {'id':'16','name':'告乐沙语','image':$r('app.media.wallpaper5'),'text':'测试','time':'上午10:20'},
  {'id':'17','name':'迷雾之岛','image':$r('app.media.wallpaper1'),'text':'测试','time':'上午10:20'},
  {'id':'18','name':'迷雾之岛','image':$r('app.media.wallpaper1'),'text':'测试','time':'上午10:20'},
]

//填充数据
export function initializeOnStartup():Array<ChatItem>{
  //创建一个空的中间数组
  let chatDataArray:Array<ChatItem>=[]

  //遍历数据数组
  chatData.forEach((item,index)=>{
    chatDataArray.push(new ChatItem(item.id,item.name,item.image,item.text,item.time))
  })

  return chatDataArray;
}