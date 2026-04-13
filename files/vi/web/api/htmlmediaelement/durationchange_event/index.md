---
title: "HTMLMediaElement: sự kiện durationchange"
short-title: durationchange
slug: Web/API/HTMLMediaElement/durationchange_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.durationchange_event
---

{{APIRef("HTMLMediaElement")}}

Sự kiện `durationchange` được kích hoạt khi thuộc tính `duration` đã được cập nhật.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("durationchange", (event) => { })

ondurationchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung chung.

## Ví dụ

Các ví dụ này thêm trình xử lý sự kiện cho sự kiện `durationchange` của HTMLMediaElement, sau đó đăng thông báo khi trình xử lý sự kiện đó phản ứng với việc kích hoạt sự kiện.

Sử dụng `addEventListener()`:

```js
const video = document.querySelector("video");

video.addEventListener("durationchange", (event) => {
  console.log("Not sure why, but the duration of the video has changed.");
});
```

Sử dụng thuộc tính xử lý sự kiện `ondurationchange`:

```js
const video = document.querySelector("video");

video.ondurationchange = (event) => {
  console.log("Not sure why, but the duration of the video has changed.");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Sự kiện liên quan

- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.playing_event", 'playing')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.waiting_event", 'waiting')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.seeking_event", 'seeking')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.seeked_event", 'seeked')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.ended_event", 'ended')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.loadedmetadata_event", 'loadedmetadata')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.loadeddata_event", 'loadeddata')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.canplay_event", 'canplay')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.canplaythrough_event", 'canplaythrough')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.timeupdate_event", 'timeupdate')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.play_event", 'play')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.pause_event", 'pause')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.ratechange_event", 'ratechange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.volumechange_event", 'volumechange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.suspend_event", 'suspend')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.emptied_event", 'emptied')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.stalled_event", 'stalled')}}

## Xem thêm

- {{domxref("HTMLAudioElement")}}
- {{domxref("HTMLVideoElement")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
