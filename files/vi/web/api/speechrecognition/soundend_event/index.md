---
title: "SpeechRecognition: Sự kiện soundend"
short-title: soundend
slug: Web/API/SpeechRecognition/soundend_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.soundend_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`soundend`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi bất kỳ âm thanh nào — giọng nói có thể nhận dạng hay không — ngừng được phát hiện.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("soundend", (event) => { })

onsoundend = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `soundend` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("soundend", (event) => {
  console.log("Sound has stopped being received");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onsoundend`:

```js
recognition.onsoundend = (event) => {
  console.log("Sound has stopped being received");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
