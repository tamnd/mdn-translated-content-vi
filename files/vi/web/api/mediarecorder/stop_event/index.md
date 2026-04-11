---
title: "MediaRecorder: sự kiện stop"
short-title: stop
slug: Web/API/MediaRecorder/stop_event
page-type: web-api-event
browser-compat: api.MediaRecorder.stop_event
---

{{APIRef("MediaStream Recording")}}

Sự kiện **`stop`** của giao diện {{domxref("MediaRecorder")}} được kích hoạt khi {{domxref("MediaRecorder.stop()")}} được gọi, hoặc khi luồng phương tiện đang được ghi kết thúc. Trong mỗi trường hợp, sự kiện `stop` được đứng trước bởi sự kiện `dataavailable`, giúp {{domxref("Blob")}} đã ghi đến thời điểm đó có sẵn để bạn dùng trong ứng dụng.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("stop", (event) => { })

onstop = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
mediaRecorder.onstop = (e) => {
  console.log("data available after MediaRecorder.stop() called.");

  const audio = document.createElement("audio");
  audio.controls = true;
  const blob = new Blob(chunks, { type: "audio/ogg; codecs=opus" });
  const audioURL = window.URL.createObjectURL(blob);
  audio.src = audioURL;
  console.log("recorder stopped");
};

mediaRecorder.ondataavailable = (e) => {
  chunks.push(e.data);
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
