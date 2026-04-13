---
title: "TextTrackList: removetrack event"
short-title: removetrack
slug: Web/API/TextTrackList/removetrack_event
page-type: web-api-event
browser-compat: api.TextTrackList.removetrack_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`removetrack`** được kích hoạt khi một track bị xóa khỏi [`TextTrackList`](/en-US/docs/Web/API/TextTrackList).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("removetrack", (event) => { })

onremovetrack = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("TrackEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("TrackEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("TrackEvent.track", "track")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("TextTrack")}} mà sự kiện đề cập đến.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const mediaElement = document.querySelector("video, audio");

mediaElement.textTracks.addEventListener("removetrack", (event) => {
  console.log(`Text track: ${event.track.label} removed`);
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onremovetrack`:

```js
const mediaElement = document.querySelector("video, audio");

mediaElement.textTracks.onremovetrack = (event) => {
  console.log(`Text track: ${event.track.label} removed`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`addtrack`](/en-US/docs/Web/API/VideoTrackList/addtrack_event), [`change`](/en-US/docs/Web/API/VideoTrackList/change_event)
- Sự kiện này trên [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList): [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event)
- Sự kiện này trên [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList): [`removetrack`](/en-US/docs/Web/API/AudioTrackList/removetrack_event)
- Sự kiện này trên [`MediaStream`](/en-US/docs/Web/API/MediaStream): [`removetrack`](/en-US/docs/Web/API/MediaStream/removetrack_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
