class ListModel {
  const ListModel({
    this.title,
    this.avatar,
});

  final String title;
  final String avatar;
}

final List<ListModel> listModels = [
  ListModel(
    title: '张萌萌',
    avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574334614050&di=cdc429248907e5a4bf7ef4a19f1cd333&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F24%2F20180324081023_8FVre.jpeg',
  ),
  ListModel(
    title: '李若彤',
    avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574334614050&di=99bb0d2145a201b1559bab4d8bd2c2e2&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201809%2F26%2F20180926162125_vjbwi.jpg',
  ),
  ListModel(
    title: '谢娜娜',
    avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574334614050&di=3e91316e498ec31799e51a5150e850d9&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201410%2F04%2F20141004184536_c5JXC.thumb.700_0.jpeg',
  ),
  ListModel(
    title: '王璐丹',
    avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574334614048&di=114f16ea23cc8bbd88e32a32629a0d11&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201708%2F24%2F20170824110601_evE3L.jpeg',
  )
];