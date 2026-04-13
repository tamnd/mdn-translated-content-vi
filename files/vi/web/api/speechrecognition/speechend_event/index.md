---
title: "SpeechRecognition: Sự kiện speechend"
short-title: speechend
slug: Web/API/SpeechRecognition/speechend_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.speechend_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`speechend`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi giọng nói được dịch vụ nhận dạng giọng nói nhận diện ngừng được phát hiện.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("speechend", (event) => { })

onspeechend = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `speechend` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("speechend", () => {
  console.log("Speech has stopped being detected");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onspeechend`:

```js
recognition.onspeechend = () => {
  console.log("Speech has stopped being detected");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
