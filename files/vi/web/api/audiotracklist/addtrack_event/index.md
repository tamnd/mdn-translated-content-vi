---
title: "AudioTrackList: sự kiện addtrack"
short-title: addtrack
slug: Web/API/AudioTrackList/addtrack_event
page-type: web-api-event
browser-compat: api.AudioTrackList.addtrack_event
---

{{APIRef("HTML DOM")}}

Sự kiện `addtrack` được kích hoạt khi một rãnh được thêm vào một [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("addtrack", (event) => { })

onaddtrack = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("TrackEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("TrackEvent")}}

## Thuộc tính sự kiện

_`TrackEvent` dựa trên {{domxref("Event")}}, vì vậy các thuộc tính của `Event` cũng khả dụng trên các đối tượng `TrackEvent`._

- {{domxref("TrackEvent.track", "track")}} {{ReadOnlyInline}}
  - : Đối tượng rãnh DOM mà sự kiện tham chiếu tới. Nếu khác `null`, đây luôn là một đối tượng thuộc một trong các kiểu rãnh media sau: {{domxref("AudioTrack")}}, {{domxref("VideoTrack")}} hoặc {{domxref("TextTrack")}}).

## Mô tả

### Kích hoạt

Sự kiện `addtrack` được gọi bất cứ khi nào một rãnh mới được thêm vào phần tử media mà các rãnh âm thanh của phần tử đó được biểu diễn bởi đối tượng `AudioTrackList`.
Điều này xảy ra khi các rãnh được thêm vào phần tử tại thời điểm media lần đầu được gắn vào phần tử; một sự kiện `addtrack` sẽ xảy ra cho mỗi rãnh âm thanh trong tài nguyên media.

Sự kiện này không thể bị hủy và không nổi bọt.

### Trường hợp sử dụng

Bạn có thể dùng sự kiện này để phản ứng khi một rãnh âm thanh mới trở nên khả dụng. Ví dụ, bạn có thể muốn cập nhật các thành phần giao diện để cho phép người dùng chọn rãnh âm thanh mới.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const videoElement = document.querySelector("video");

videoElement.audioTracks.addEventListener("addtrack", (event) => {
  console.log(`Audio track: ${event.track.label} added`);
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onaddtrack`:

```js
const videoElement = document.querySelector("video");

videoElement.audioTracks.onaddtrack = (event) => {
  console.log(`Audio track: ${event.track.label} added`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`removetrack`](/en-US/docs/Web/API/AudioTrackList/removetrack_event), [`change`](/en-US/docs/Web/API/AudioTrackList/change_event)
- Sự kiện này trên [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList) nhắm tới: [`addtrack`](/en-US/docs/Web/API/VideoTrackList/addtrack_event)
- Sự kiện này trên [`MediaStream`](/en-US/docs/Web/API/MediaStream) nhắm tới: [`addtrack`](/en-US/docs/Web/API/MediaStream/addtrack_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
