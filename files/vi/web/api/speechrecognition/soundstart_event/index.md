---
title: "SpeechRecognition: Sự kiện soundstart"
short-title: soundstart
slug: Web/API/SpeechRecognition/soundstart_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.soundstart_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`soundstart`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi bất kỳ âm thanh nào — giọng nói có thể nhận dạng hay không — được phát hiện.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("soundstart", (event) => { })

onsoundstart = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `soundstart` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("soundstart", () => {
  console.log("Some sound is being received");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onsoundstart`:

```js
recognition.onsoundstart = () => {
  console.log("Some sound is being received");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
