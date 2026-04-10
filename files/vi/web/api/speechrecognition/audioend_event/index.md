---
title: "SpeechRecognition: Sự kiện audioend"
short-title: audioend
slug: Web/API/SpeechRecognition/audioend_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.audioend_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`audioend`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi tác nhân người dùng kết thúc ghi âm thanh cho nhận dạng giọng nói.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("audioend", (event) => { })

onaudioend = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `audioend` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("audioend", () => {
  console.log("Audio capturing ended");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onaudioend`:

```js
recognition.onaudioend = () => {
  console.log("Audio capturing ended");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
