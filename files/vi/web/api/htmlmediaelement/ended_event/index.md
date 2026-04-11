---
title: "HTMLMediaElement: sự kiện ended"
short-title: ended
slug: Web/API/HTMLMediaElement/ended_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.ended_event
---

{{APIRef("HTMLMediaElement")}}

Sự kiện `ended` được kích hoạt khi quá trình phát lại hoặc phát trực tuyến đã dừng do đã kết thúc phương tiện hoặc do không có thêm dữ liệu.

Sự kiện này xảy ra dựa trên {{domxref("HTMLMediaElement")}} ({{HTMLElement("audio")}} và {{HTMLElement("video")}}) kích hoạt `ended` khi phát lại đến cuối phương tiện.

Sự kiện này không thể hủy và không bong bóng.

> [!NOTE]
> Sự kiện `ended` không kích hoạt nếu thuộc tính [`loop`](/en-US/docs/Web/API/HTMLMediaElement/loop) là `true` và [`playbackRate`](/en-US/docs/Web/API/HTMLMediaElement/playbackRate) không âm.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("ended", (event) => { })

onended = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung chung.

## Ví dụ

Các ví dụ này thêm trình xử lý sự kiện cho sự kiện `ended` của HTMLMediaElement, sau đó đăng thông báo khi trình xử lý sự kiện đó phản ứng với việc kích hoạt sự kiện.

Sử dụng `addEventListener()`:

```js
const video = document.querySelector("video");

video.addEventListener("ended", (event) => {
  console.log(
    "Video stopped either because it has finished playing or no further data is available.",
  );
});
```

Sử dụng thuộc tính xử lý sự kiện `onended`:

```js
const video = document.querySelector("video");

video.onended = (event) => {
  console.log(
    "Video stopped either because it has finished playing or no further data is available.",
  );
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
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.loadedmetadata_event", 'loadedmetadata')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.loadeddata_event", 'loadeddata')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.canplay_event", 'canplay')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.canplaythrough_event", 'canplaythrough')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.durationchange_event", 'durationchange')}}
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
- [Media Capture and Streams](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [`MediaStreamTrack`: `ended` event](/en-US/docs/Web/API/MediaStreamTrack/ended_event)

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Web audio API: ended event](/en-US/docs/Web/API/AudioScheduledSourceNode/ended_event)
