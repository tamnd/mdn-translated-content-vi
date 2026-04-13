---
title: "VideoTrackList: change event"
short-title: change
slug: Web/API/VideoTrackList/change_event
page-type: web-api-event
browser-compat: api.VideoTrackList.change_event
---

{{APIRef("HTML DOM")}}

Sự kiện `change` được kích hoạt khi một video track được kích hoạt hoặc hủy kích hoạt, chẳng hạn bằng cách thay đổi thuộc tính [`selected`](/en-US/docs/Web/API/VideoTrack/selected) của track.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} thông thường không có thuộc tính bổ sung.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const videoElement = document.querySelector("video");
videoElement.videoTracks.addEventListener("change", (event) => {
  console.log(`'${event.type}' event fired`);
});

// changing the value of `selected` will trigger the `change` event
const toggleTrackButton = document.querySelector(".toggle-track");
toggleTrackButton.addEventListener("click", () => {
  const track = videoElement.videoTracks[0];
  track.selected = !track.selected;
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onchange`:

```js
const videoElement = document.querySelector("video");
videoElement.videoTracks.onchange = (event) => {
  console.log(`'${event.type}' event fired`);
};

// changing the value of `selected` will trigger the `change` event
const toggleTrackButton = document.querySelector(".toggle-track");
toggleTrackButton.addEventListener("click", () => {
  const track = videoElement.videoTracks[0];
  track.selected = !track.selected;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`addtrack`](/en-US/docs/Web/API/VideoTrackList/addtrack_event), [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event)
- Sự kiện này trên mục tiêu [`AudioTrackList`](/en-US/docs/Web/API/AudioTrackList): [`change`](/en-US/docs/Web/API/AudioTrackList/change_event)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
