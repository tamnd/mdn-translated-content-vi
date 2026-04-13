---
title: "VideoTrackList: addtrack event"
short-title: addtrack
slug: Web/API/VideoTrackList/addtrack_event
page-type: web-api-event
browser-compat: api.VideoTrackList.addtrack_event
---

{{APIRef("HTML DOM")}}

Sự kiện `addtrack` được kích hoạt khi một video track được thêm vào [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("addtrack", (event) => { })

onaddtrack = (event) => { }
```

## Loại sự kiện

Một {{domxref("TrackEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("TrackEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("TrackEvent.track", "track")}} {{ReadOnlyInline}}
  - : {{domxref("VideoTrack")}} mới được thêm vào mà sự kiện đề cập đến.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const videoElement = document.querySelector("video");

videoElement.videoTracks.addEventListener("addtrack", (event) => {
  console.log(`Video track: ${event.track.label} added`);
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onaddtrack`:

```js
const videoElement = document.querySelector("video");

videoElement.videoTracks.onaddtrack = (event) => {
  console.log(`Video track: ${event.track.label} added`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event), [`change`](/en-US/docs/Web/API/VideoTrackList/change_event)
- Sự kiện này trên mục tiêu [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList): [`addtrack`](/en-US/docs/Web/API/AudioTrackList/addtrack_event)
- Sự kiện này trên mục tiêu [`MediaStream`](/en-US/docs/Web/API/MediaStream): [`addtrack`](/en-US/docs/Web/API/MediaStream/addtrack_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
