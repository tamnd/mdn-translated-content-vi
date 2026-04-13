---
title: "SpeechRecognition: Sự kiện error"
short-title: error
slug: Web/API/SpeechRecognition/error_event
page-type: web-api-event
browser-compat: api.SpeechRecognition.error_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`error`** của đối tượng {{domxref("SpeechRecognition")}} trong [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi xảy ra lỗi nhận dạng giọng nói.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("SpeechRecognitionErrorEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("SpeechRecognitionErrorEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng khả dụng._

- {{domxref("SpeechRecognitionErrorEvent.error")}} {{ReadOnlyInline}}
  - : Trả về loại lỗi được ném ra.
- {{domxref("SpeechRecognitionErrorEvent.message")}} {{ReadOnlyInline}}
  - : Trả về một thông báo mô tả chi tiết hơn về lỗi.

## Ví dụ

Bạn có thể sử dụng sự kiện `error` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const recognition = new (SpeechRecognition || webkitSpeechRecognition)();

recognition.addEventListener("error", (event) => {
  console.error(`Speech recognition error detected: ${event.error}`);
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onerror`:

```js
recognition.onerror = (event) => {
  console.error(`Speech recognition error detected: ${event.error}`);
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
