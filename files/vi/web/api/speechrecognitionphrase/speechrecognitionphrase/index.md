---
title: "SpeechRecognitionPhrase: hàm khởi tạo SpeechRecognitionPhrase()"
short-title: SpeechRecognitionPhrase()
slug: Web/API/SpeechRecognitionPhrase/SpeechRecognitionPhrase
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.SpeechRecognitionPhrase.SpeechRecognitionPhrase
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Hàm khởi tạo **`SpeechRecognitionPhrase()`** tạo đối tượng {{domxref("SpeechRecognitionPhrase")}} mới.

Mảng các đối tượng `SpeechRecognitionPhrase` được truyền vào engine nhận dạng giọng nói qua thuộc tính {{domxref("SpeechRecognition.phrases")}} để [biasing theo ngữ cảnh](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#contextual_biasing_in_speech_recognition).

## Cú pháp

```js-nolint
new SpeechRecognitionPhrase(phrase)
new SpeechRecognitionPhrase(phrase, boost)
```

### Tham số

- `phrase`
  - : Chuỗi chứa từ hoặc cụm từ bạn muốn tăng cường.
- `boost` {{optional_inline}}
  - : Số thực từ `0.0` đến `10.0` (bao gồm) đại diện cho trọng số bạn muốn áp dụng cho `phrase`. Giá trị này xấp xỉ bằng logarithm tự nhiên của số lần nhiều hơn mà trang web cho rằng cụm từ này có khả năng xuất hiện. Nếu không được chỉ định, `boost` mặc định là `1.0`.
    > [!NOTE]
    > Giá trị cao như `9.0` hoặc `10.0` có thể khiến engine nhận dạng nhầm lẫn nhận dạng các cụm từ khác là cụm từ được chỉ định. Do đó, các giá trị như vậy nên được sử dụng hiếm khi.

### Giá trị trả về

Đối tượng {{domxref("SpeechRecognitionPhrase")}} mới.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Giá trị `boost` được chỉ định nhỏ hơn `0.0` hoặc lớn hơn `10.0`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SpeechRecognition")}}
- {{domxref("SpeechRecognition.phrases")}}
