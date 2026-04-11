---
title: "MediaRecorder: sự kiện resume"
short-title: resume
slug: Web/API/MediaRecorder/resume_event
page-type: web-api-event
browser-compat: api.MediaRecorder.resume_event
---

{{APIRef("MediaStream Recording")}}

Sự kiện **`resume`** của giao diện {{domxref("MediaRecorder")}} được kích hoạt khi {{domxref("MediaRecorder.resume()")}} được gọi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("resume", (event) => { })

onresume = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
pause.onclick = () => {
  if (MediaRecorder.state === "recording") {
    mediaRecorder.pause();
    // tạm dừng ghi
  } else if (MediaRecorder.state === "paused") {
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
