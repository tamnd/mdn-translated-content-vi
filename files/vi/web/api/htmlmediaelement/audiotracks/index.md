---
title: "HTMLMediaElement: thuộc tính audioTracks"
short-title: audioTracks
slug: Web/API/HTMLMediaElement/audioTracks
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.audioTracks
---

{{APIRef("HTML DOM")}}

Chỉ đọc **`audioTracks`**
thuộc tính trên đối tượng {{domxref("HTMLMediaElement")}} trả về
một đối tượng {{domxref("AudioTrackList")}} liệt kê tất cả {{domxref("AudioTrack")}}
các đối tượng đại diện cho các bản âm thanh của phần tử đa phương tiện.

Yếu tố truyền thông có thể là
phần tử {{HTMLElement("audio")}} hoặc phần tử {{HTMLElement("video")}}.

Danh sách trả về là _live_; nghĩa là, khi các bản nhạc được thêm vào và xóa khỏi
phần tử phương tiện, nội dung của danh sách sẽ thay đổi linh hoạt. Một khi bạn có một tài liệu tham khảo đến
danh sách, bạn có thể theo dõi những thay đổi để phát hiện khi nào các bản âm thanh mới được thêm vào hoặc
những cái hiện có bị loại bỏ. Xem [AudioTrackList events](/en-US/docs/Web/API/AudioTrackList#events)
để tìm hiểu thêm về cách theo dõi các thay đổi đối với danh sách theo dõi của phần tử phương tiện.

## Giá trị

Một đối tượng {{domxref("AudioTrackList")}} đại diện cho danh sách các bản âm thanh được bao gồm
trong yếu tố truyền thông. Danh sách các bản nhạc có thể được truy cập bằng cách sử dụng ký hiệu mảng hoặc sử dụng
phương thức {{domxref("AudioTrackList.getTrackById", "getTrackById()")}} của đối tượng.

Mỗi bản nhạc được thể hiện bằng một đối tượng {{domxref("AudioTrack")}} cung cấp
thông tin về đường đua.

## Ví dụ

Trong ví dụ này, tất cả các bản âm thanh trên một phần tử nhất định đều bị tắt tiếng.

### HTML

HTML tự thiết lập phần tử đó.

```html
<video id="video" src="somevideo.mp4"></video>
```

### JavaScript

Mã JavaScript xử lý việc tắt tiếng các bản âm thanh của phần tử video.

```js
const video = document.getElementById("video");

for (const track of video.audioTracks) {
  track.enabled = false;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.audioTracks`
- {{HTMLElement("audio")}}, {{HTMLElement("video")}}
- {{domxref("AudioTrack")}}, {{domxref("AudioTrackList")}}
