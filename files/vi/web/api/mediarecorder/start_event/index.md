---
title: "MediaRecorder: sự kiện start"
short-title: start
slug: Web/API/MediaRecorder/start_event
page-type: web-api-event
browser-compat: api.MediaRecorder.start_event
---

{{APIRef("MediaStream Recording")}}

Sự kiện **`start`** của giao diện {{domxref("MediaRecorder")}} được kích hoạt khi {{domxref("MediaRecorder.start()")}} được gọi. Tại thời điểm này, dữ liệu bắt đầu được thu thập vào một {{domxref("Blob")}}.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("start", (event) => { })

onstart = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
record.onclick = () => {
  mediaRecorder.start();
  console.log("recorder started");
};

mediaRecorder.onstart = () => {
  // thực hiện điều gì đó khi
  // việc ghi được bắt đầu
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
