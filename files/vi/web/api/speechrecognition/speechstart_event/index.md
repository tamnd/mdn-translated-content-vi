---
title: "SpeechRecognition: Sự kiện speechstart"
short-title: speechstart
slug: Web/API/SpeechRecognition/speechstart_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.speechstart_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`speechstart`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi âm thanh được dịch vụ nhận dạng giọng nói nhận diện là giọng nói đã được phát hiện.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("speechstart", (event) => { })

onspeechstart = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `speechstart` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("speechstart", () => {
  console.log("Speech has been detected");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onspeechstart`:

```js
recognition.onspeechstart = () => {
  console.log("Speech has been detected");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
