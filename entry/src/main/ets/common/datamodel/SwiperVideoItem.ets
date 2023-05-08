//滑动视频数据模型[在组件页面中补充@ObjectLink]
@Observed export class SwiperVideoItem {
  id: string; //ID
  src: Resource; //视频路径
  title: string; //标题
  isLikes: boolean //是否点赞
  commentCount: number //评论数
  likesCount: number //点赞数
  collect: number //收藏数
  constructor(id: string, src: Resource, title: string, isLikes: boolean, commentCount: number, likesCount: number, collect: number) {
    this.id = id
    this.src = src
    this.title = title
    this.isLikes = isLikes
    this.commentCount = commentCount
    this.likesCount = likesCount
    this.collect = collect
  }
}

//滑动播放视频的数据
const swiperVideoItemData: any[] = [
  {
    'id': '1',
    src: $rawfile('video1.mp4'),
    'title': '创新 #HMS 奋发向上',
    'isLikes': false,
    'commentCount': 0,
    'likesCount': 100,
    'collect': 10
  },
  {
    'id': '2',
    src: $rawfile('video2.mp4'),
    'title': '创新 #HMS 奋发向上',
    'isLikes': false,
    'commentCount': 0,
    'likesCount': 100,
    'collect': 20
  },
  {
    'id': '3',
    src: $rawfile('video1.mp4'),
    'title': '创新 #HMS 奋发向上',
    'isLikes': false,
    'commentCount':10,
    'likesCount': 110,
    'collect': 20
  },
  {
    'id': '4',
    src: $rawfile('video2.mp4'),
    'title': '创新 #HMS 奋发向上',
    'isLikes': false,
    'commentCount': 110,
    'likesCount': 130,
    'collect': 15
  }
]

//填充数据
export function initializeOnStartup():Array<SwiperVideoItem>{
  //创建一个空的中间数组
  let imgaeDataArray:Array<SwiperVideoItem>=[]
  //遍历数据数组
  swiperVideoItemData.forEach((item,index)=>{
    imgaeDataArray.push(new SwiperVideoItem(item.id,item.src,item.title,item.isLikes,item.commentCount,item.likesCount,item.collect))
  })
  return imgaeDataArray;
}