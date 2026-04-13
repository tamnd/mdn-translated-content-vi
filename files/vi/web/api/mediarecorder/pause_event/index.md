---
title: "MediaRecorder: sự kiện pause"
short-title: pause
slug: Web/API/MediaRecorder/pause_event
page-type: web-api-event
browser-compat: api.MediaRecorder.pause_event
---

{{APIRef("MediaStream Recording")}}

Sự kiện **`pause`** của giao diện {{domxref("MediaRecorder")}} được kích hoạt khi {{domxref("MediaRecorder.pause()")}} được gọi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("pause", (event) => { })

onpause = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
pause.onclick = () => {
  if (mediaRecorder.state === "recording") {
    mediaRecorder.pause();
    // tạm dừng ghi
  } else if (mediaRecorder.state === "paused") {
    mediaRecorder.resume();
    // tiếp tục ghi
  }
};

mediaRecorder.onpause = () => {
  // thực hiện điều gì đó khi
  // việc ghi bị tạm dừng
};

mediaRecorder.onresume = () => {
  // thực hiện điều gì đó khi
  // việc ghi được tiếp tục
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [Web Dictaphone](https://mdn.github.io/dom-examples/media/web-dictaphone/): MediaRecorder + getUserMedia + Web Audio API visualization demo, bởi [Chris Mills](https://github.com/chrisdavidmills) ([mã nguồn trên GitHub](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone).)
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), bởi [Sam Dutton](https://github.com/samdutton).
- {{domxref("Navigator.getUserMedia")}}
