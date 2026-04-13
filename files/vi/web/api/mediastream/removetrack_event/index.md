---
title: "MediaStream: sự kiện removetrack"
short-title: removetrack
slug: Web/API/MediaStream/removetrack_event
page-type: web-api-event
browser-compat: api.MediaStream.removetrack_event
---

{{APIRef("Media Capture and Streams")}}

Sự kiện **`removetrack`** được kích hoạt khi một đối tượng {{domxref("MediaStreamTrack")}} mới đã bị xóa khỏi một {{domxref("MediaStream")}}.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("removetrack", (event) => { })

onremovetrack = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MediaStreamTrackEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MediaStreamTrackEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}._

- {{domxref("MediaStreamTrackEvent.track")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("MediaStreamTrack")}} đại diện cho track đã bị xóa khỏi luồng.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const stream = new MediaStream();

stream.addEventListener("removetrack", (event) => {
  console.log(`Track ${event.track.kind} đã bị xóa`);
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onremovetrack`:

```js
const stream = new MediaStream();

stream.onremovetrack = (event) => {
  console.log(`Track ${event.track.kind} đã bị xóa`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`addtrack`](/en-US/docs/Web/API/MediaStream/addtrack_event)
- Sự kiện này trên các target [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList): [`removetrack`](/en-US/docs/Web/API/AudioTrackList/removetrack_event)
- Sự kiện này trên các target [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList): [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
