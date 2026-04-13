---
title: "SpeechRecognition: Sự kiện end"
short-title: end
slug: Web/API/SpeechRecognition/end_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.end_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`end`** của đối tượng {{domxref("SpeechRecognition")}} trong [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi dịch vụ nhận dạng giọng nói đã ngắt kết nối.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("end", (event) => { })

onend = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `end` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("end", () => {
  console.log("Speech recognition service disconnected");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onend`:

```js
recognition.onend = () => {
  console.log("Speech recognition service disconnected");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
