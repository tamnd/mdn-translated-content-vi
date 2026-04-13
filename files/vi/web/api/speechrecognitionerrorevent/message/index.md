---
title: "SpeechRecognitionErrorEvent: thuộc tính message"
short-title: message
slug: Web/API/SpeechRecognitionErrorEvent/message
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionErrorEvent.message
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`message`** của giao diện {{domxref("SpeechRecognitionErrorEvent")}} trả về thông điệp mô tả lỗi chi tiết hơn.

## Giá trị

Chuỗi chứa thêm chi tiết về lỗi đã được phát sinh.
Lưu ý rằng thông số kỹ thuật không định nghĩa nội dung chính xác của các thông điệp này, điều này phụ thuộc vào quyết định của các nhà triển khai.

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
