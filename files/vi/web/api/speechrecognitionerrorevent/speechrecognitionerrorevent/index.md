---
title: "SpeechRecognitionErrorEvent: hàm khởi tạo SpeechRecognitionErrorEvent()"
short-title: SpeechRecognitionErrorEvent()
slug: Web/API/SpeechRecognitionErrorEvent/SpeechRecognitionErrorEvent
page-type: web-api-constructor
browser-compat: api.SpeechRecognitionErrorEvent.SpeechRecognitionErrorEvent
---

{{APIRef("Web Speech API")}}

Hàm khởi tạo **`SpeechRecognitionErrorEvent()`** tạo phiên bản đối tượng {{domxref("SpeechRecognitionErrorEvent")}} mới.

## Cú pháp

```js-nolint
new SpeechRecognitionErrorEvent(type, init)
```

### Tham số

- `type`
  - : Chuỗi chứa tên của sự kiện. Luôn luôn là `error`.
- `init`
  - : Đối tượng khởi tạo chứa các thuộc tính:
    - `error`
      - : Giá trị liệt kê đại diện cho loại lỗi. Xem [các giá trị `error` có thể có](/en-US/docs/Web/API/SpeechRecognitionErrorEvent/error#value).
    - `message` {{optional_inline}}
      - : Chuỗi chứa thêm chi tiết về lỗi đã được phát sinh. Lưu ý rằng thông số kỹ thuật không định nghĩa nội dung chính xác của các thông điệp này, các nhà triển khai phải tự định nghĩa.

## Ví dụ

Bạn hiếm khi phải tạo phiên bản `SpeechRecognitionErrorEvent` thủ công. Các phiên bản như vậy có sẵn dưới dạng đối tượng sự kiện bên trong các hàm xử lý sự kiện `error`.

Ví dụ:

```js
const recognition = new SpeechRecognition();

recognition.addEventListener("error", (event) => {
  console.log(`Speech recognition error detected: ${event.error}`);
  console.log(`Additional information: ${event.message}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
