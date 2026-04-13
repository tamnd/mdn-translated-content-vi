---
title: "AudioTrackList: sự kiện removetrack"
short-title: removetrack
slug: Web/API/AudioTrackList/removetrack_event
page-type: web-api-event
browser-compat: api.AudioTrackList.removetrack_event
---

{{APIRef("HTML DOM")}}

Sự kiện `removetrack` được kích hoạt khi một rãnh bị xóa khỏi một [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("removetrack", (event) => { })

onremovetrack = (event) => { }
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

Sự kiện `removetrack` được gọi bất cứ khi nào một rãnh bị xóa khỏi phần tử media mà các rãnh âm thanh của phần tử đó được biểu diễn bởi đối tượng `AudioTrackList`.

Sự kiện này không thể bị hủy và không nổi bọt.

### Trường hợp sử dụng

Bạn có thể dùng sự kiện này để phản ứng khi một rãnh âm thanh mới không còn khả dụng. Ví dụ, bạn có thể muốn cập nhật các thành phần giao diện để không cho phép người dùng chọn rãnh âm thanh đã bị xóa.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const videoElement = document.querySelector("video");

videoElement.audioTracks.addEventListener("removetrack", (event) => {
  console.log(`Audio track: ${event.track.label} removed`);
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onremovetrack`:

```js
const videoElement = document.querySelector("video");

videoElement.audioTracks.onremovetrack = (event) => {
  console.log(`Audio track: ${event.track.label} removed`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`addtrack`](/en-US/docs/Web/API/AudioTrackList/addtrack_event), [`change`](/en-US/docs/Web/API/AudioTrackList/change_event)
- Sự kiện này trên [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList) nhắm tới: [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event)
- Sự kiện này trên [`MediaStream`](/en-US/docs/Web/API/MediaStream) nhắm tới: [`removetrack`](/en-US/docs/Web/API/MediaStream/removetrack_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
