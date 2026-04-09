---
title: "AudioTrackList: sự kiện change"
short-title: change
slug: Web/API/AudioTrackList/change_event
page-type: web-api-event
browser-compat: api.AudioTrackList.change_event
---

{{APIRef("HTML DOM")}}

Sự kiện `change` được kích hoạt khi một rãnh âm thanh được bật hoặc tắt, ví dụ bằng cách thay đổi thuộc tính [`enabled`](/en-US/docs/Web/API/AudioTrack/enabled) của rãnh.

Sự kiện này không thể bị hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const videoElement = document.querySelector("video");
videoElement.audioTracks.addEventListener("change", (event) => {
  console.log(`'${event.type}' event fired`);
});

// changing the value of `enabled` will trigger the `change` event
const toggleTrackButton = document.querySelector(".toggle-track");
toggleTrackButton.addEventListener("click", () => {
  const track = videoElement.audioTracks[0];
  track.enabled = !track.enabled;
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onchange`:

```js
const videoElement = document.querySelector("video");
videoElement.audioTracks.onchange = (event) => {
  console.log(`'${event.type}' event fired`);
});

// changing the value of `enabled` will trigger the `change` event
const toggleTrackButton = document.querySelector(".toggle-track");
toggleTrackButton.addEventListener("click", () => {
  const track = videoElement.audioTracks[0];
  track.enabled = !track.enabled;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`addtrack`](/en-US/docs/Web/API/AudioTrackList/addtrack_event), [`removetrack`](/en-US/docs/Web/API/AudioTrackList/removetrack_event)
- Sự kiện này trên [`VideoTrackList`](/en-US/docs/Web/API/VideoTrackList) nhắm tới: [`change`](/en-US/docs/Web/API/VideoTrackList/change_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
