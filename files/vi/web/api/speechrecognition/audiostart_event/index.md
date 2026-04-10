---
title: "SpeechRecognition: Sự kiện audiostart"
short-title: audiostart
slug: Web/API/SpeechRecognition/audiostart_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.audiostart_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`audiostart`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi tác nhân người dùng bắt đầu ghi âm thanh cho nhận dạng giọng nói.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("audiostart", (event) => { })

onaudiostart = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `audiostart` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("audiostart", () => {
  console.log("Audio capturing started");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onaudiostart`:

```js
recognition.onaudiostart = () => {
  console.log("Audio capturing started");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
