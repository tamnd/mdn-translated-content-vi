---
title: "HTMLMediaElement: sự kiện loadeddata"
short-title: loadeddata
slug: Web/API/HTMLMediaElement/loadeddata_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.loadeddata_event
---

{{APIRef("HTMLMediaElement")}}

Sự kiện **`loadeddata`** được kích hoạt khi khung ở vị trí phát lại hiện tại của phương tiện đã tải xong; thường là khung hình đầu tiên.

> [!NOTE]
> Sự kiện này sẽ không kích hoạt trên thiết bị di động/máy tính bảng nếu trình tiết kiệm dữ liệu được bật trong cài đặt trình duyệt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("loadeddata", (event) => { })

onloadeddata = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung chung.

## Ví dụ

Các ví dụ này thêm trình xử lý sự kiện cho sự kiện `loadeddata` của HTMLMediaElement, sau đó đăng thông báo khi trình xử lý sự kiện đó phản ứng với việc kích hoạt sự kiện.

Sử dụng `addEventListener()`:

```js
const video = document.querySelector("video");

video.addEventListener("loadeddata", (event) => {
  console.log(
    "Yay! The readyState just increased to  " +
      "HAVE_CURRENT_DATA or greater for the first time.",
  );
});
```

Sử dụng thuộc tính xử lý sự kiện `onloadeddata`:

```js
const video = document.querySelector("video");

video.onloadeddata = (event) => {
  console.log(
    "Yay! The readyState just increased to  " +
      "HAVE_CURRENT_DATA or greater for the first time.",
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
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.ended_event", 'ended')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.loadedmetadata_event", 'loadedmetadata')}}
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
