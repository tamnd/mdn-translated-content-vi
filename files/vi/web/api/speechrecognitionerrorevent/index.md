---
title: SpeechRecognitionErrorEvent
slug: Web/API/SpeechRecognitionErrorEvent
page-type: web-api-interface
browser-compat: api.SpeechRecognitionErrorEvent
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechRecognitionErrorEvent`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho các thông báo lỗi từ dịch vụ nhận dạng.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SpeechRecognitionErrorEvent.SpeechRecognitionErrorEvent", "SpeechRecognitionErrorEvent()")}}
  - : Tạo đối tượng `SpeechRecognitionErrorEvent` mới.

## Thuộc tính phiên bản

_`SpeechRecognitionErrorEvent` cũng kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("SpeechRecognitionErrorEvent.error")}} {{ReadOnlyInline}}
  - : Trả về loại lỗi được phát sinh.
- {{domxref("SpeechRecognitionErrorEvent.message")}} {{ReadOnlyInline}}
  - : Trả về thông điệp mô tả lỗi chi tiết hơn.

## Ví dụ

```js
const recognition = new SpeechRecognition();

recognition.onerror = (event) => {
  console.log(`Speech recognition error detected: ${event.error}`);
  console.log(`Additional information: ${event.message}`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
