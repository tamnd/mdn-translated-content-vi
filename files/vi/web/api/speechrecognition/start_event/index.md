---
title: "SpeechRecognition: Sự kiện start"
short-title: start
slug: Web/API/SpeechRecognition/start_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.start_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`start`** của đối tượng {{domxref("SpeechRecognition")}} trong [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi dịch vụ nhận dạng giọng nói bắt đầu nghe audio đến với ý định nhận dạng các grammar liên kết với `SpeechRecognition` hiện tại.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("start", (event) => { })

onstart = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung chung không có thuộc tính bổ sung.

## Ví dụ

Bạn có thể sử dụng sự kiện `start` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("start", () => {
  console.log("Speech recognition service has started");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onstart`:

```js
recognition.onstart = () => {
  console.log("Speech recognition service has started");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
