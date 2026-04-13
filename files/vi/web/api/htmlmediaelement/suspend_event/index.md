---
title: "HTMLMediaElement: sự kiện suspend"
short-title: suspend
slug: Web/API/HTMLMediaElement/suspend_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.suspend_event
---

{{APIRef("HTMLMediaElement")}}

Sự kiện `suspend` được kích hoạt khi tác nhân người dùng cố tình không tìm nạp dữ liệu phương tiện, trong trường hợp đó {{domxref("HTMLMediaElement.networkState")}} được đặt thành `HTMLMediaElement.NETWORK_IDLE`. Điều này có thể xảy ra nếu không còn dữ liệu để tải hoặc nếu việc tải là không cần thiết; ví dụ: trình duyệt có thể quyết định chỉ lưu vào bộ đệm trước 5 phút của video, trong trường hợp đó quá trình tải sẽ bị tạm dừng cho đến khi người dùng xem thêm video.

Sự kiện này không thể hủy và không bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("suspend", (event) => { })

onsuspend = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung chung.

## Ví dụ

Các ví dụ này thêm trình xử lý sự kiện cho sự kiện `suspend` của HTMLMediaElement, sau đó đăng thông báo khi trình xử lý sự kiện đó phản ứng với việc kích hoạt sự kiện.

Sử dụng `addEventListener()`:

```js
const video = document.querySelector("video");

video.addEventListener("suspend", (event) => {
  console.log("Data loading has been suspended.");
});
```

Sử dụng thuộc tính xử lý sự kiện `onsuspend`:

```js
const video = document.querySelector("video");

video.onsuspend = (event) => {
  console.log("Data loading has been suspended.");
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
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.durationchange_event", 'durationchange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.timeupdate_event", 'timeupdate')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.play_event", 'play')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.pause_event", 'pause')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.ratechange_event", 'ratechange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.volumechange_event", 'volumechange')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.emptied_event", 'emptied')}}
- Sự kiện HTMLMediaElement {{domxref("HTMLMediaElement.stalled_event", 'stalled')}}

## Xem thêm

- {{domxref("HTMLAudioElement")}}
- {{domxref("HTMLVideoElement")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
