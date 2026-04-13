---
title: "Navigator: thuộc tính mediaSession"
short-title: mediaSession
slug: Web/API/Navigator/mediaSession
page-type: web-api-instance-property
browser-compat: api.Navigator.mediaSession
---

{{APIRef("Media Session API")}}

Thuộc tính chỉ đọc **`mediaSession`** của {{domxref("Navigator")}}
giao diện trả về {{domxref("MediaSession")}}
đối tượng có thể được sử dụng để chia sẻ với siêu dữ liệu của trình duyệt và các thông tin khác về
trạng thái phát lại hiện tại của phương tiện đang được tài liệu xử lý.

Cái này
đến lượt thông tin có thể được chia sẻ với thiết bị và/hoặc hệ điều hành để
Trải nghiệm người dùng điều khiển phương tiện tiêu chuẩn của thiết bị để mô tả và kiểm soát quá trình phát lại
của giới truyền thông.

Ngoài ra, giao diện `MediaSession` cung cấp
Phương thức {{domxref("MediaSession.setActionHandler", "setActionHandler()")}}, cho phép
bạn nhận được các sự kiện khi người dùng sử dụng các điều khiển thiết bị như trên màn hình hoặc
chơi vật lý, tạm dừng, tìm kiếm và các điều khiển tương tự khác. Một ứng dụng radio internet, dành cho
ví dụ: có thể sử dụng `setActionHandler()` để cho phép điều khiển phương tiện trên bàn phím
hoặc ở nơi khác trên thiết bị của người dùng được sử dụng để kiểm soát việc phát lại phương tiện của ứng dụng.

## Giá trị

Đối tượng {{domxref("MediaSession")}} mà tài liệu hiện tại có thể sử dụng để chia sẻ thông tin
về phương tiện truyền thông đang phát và trạng thái phát lại hiện tại của nó. Thông tin này có thể bao gồm
siêu dữ liệu điển hình như tiêu đề, nghệ sĩ và tên album của bài hát đang được phát dưới dạng
cũng như có khả năng một hoặc nhiều hình ảnh chứa những thứ như ảnh bìa album, ảnh nghệ sĩ,
vân vân.

## Ví dụ

Trong ví dụ này, siêu dữ liệu được gửi tới đối tượng `mediaSession`. Lưu ý
mã bắt đầu bằng cách đảm bảo rằng thuộc tính `navigator.mediaSession`
có sẵn trước khi cố gắng sử dụng nó.

```js
if ("mediaSession" in navigator) {
  navigator.mediaSession.metadata = new MediaMetadata({
    title: "Podcast Episode Title",
    artist: "Podcast Host",
    album: "Podcast Name",
    artwork: [{ src: "podcast.jpg" }],
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
