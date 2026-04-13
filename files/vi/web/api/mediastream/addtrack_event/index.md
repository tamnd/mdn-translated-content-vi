---
title: "MediaStream: sự kiện addtrack"
short-title: addtrack
slug: Web/API/MediaStream/addtrack_event
page-type: web-api-event
browser-compat: api.MediaStream.addtrack_event
---

{{APIRef("Media Capture and Streams")}}

Sự kiện **`addtrack`** được kích hoạt khi một đối tượng [`MediaStreamTrack`](/en-US/docs/Web/API/MediaStreamTrack) mới được thêm vào [`MediaStream`](/en-US/docs/Web/API/MediaStream).

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("addtrack", (event) => { })

onaddtrack = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MediaStreamTrackEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MediaStreamTrackEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}._

- {{domxref("MediaStreamTrackEvent.track")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("MediaStreamTrack")}} đại diện cho track đã được thêm vào luồng.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const stream = new MediaStream();

stream.addEventListener("addtrack", (event) => {
  console.log(`Track ${event.track.kind} mới được thêm`);
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onaddtrack`:

```js
const stream = new MediaStream();

stream.onaddtrack = (event) => {
  console.log(`Track ${event.track.kind} mới được thêm`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`removetrack`](/en-US/docs/Web/API/MediaStream/removetrack_event)
- Sự kiện này trên các target [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList): [`addtrack`](/en-US/docs/Web/API/AudioTrackList/addtrack_event)
- Sự kiện này trên các target [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList): [`addtrack`](/en-US/docs/Web/API/VideoTrackList/addtrack_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
