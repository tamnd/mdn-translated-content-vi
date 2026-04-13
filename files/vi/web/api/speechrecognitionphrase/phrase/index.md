---
title: "SpeechRecognitionPhrase: thuộc tính phrase"
short-title: phrase
slug: Web/API/SpeechRecognitionPhrase/phrase
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SpeechRecognitionPhrase.phrase
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`phrase`** của giao diện {{domxref("SpeechRecognitionPhrase")}} trả về chuỗi chứa từ hoặc cụm từ bạn muốn tăng cường trong [contextual bias](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#contextual_biasing_in_speech_recognition) của engine nhận dạng.

## Giá trị

Một chuỗi.

## Ví dụ

### Sử dụng cơ bản

Thuộc tính {{domxref("SpeechRecognition.phrases")}} chứa mảng các đối tượng `SpeechRecognitionPhrase` đại diện cho các cụm từ biasing theo ngữ cảnh. Mảng này có thể được sửa đổi giống như mảng JavaScript thông thường, ví dụ bằng cách đẩy các cụm từ mới vào động:

```js
recognition.phrases.push(new SpeechRecognitionPhrase("thistle", 5.0));
```

Sau đó bạn có thể truy cập các đối tượng này và thuộc tính của chúng như thế này. Để trả về giá trị `phrase` của cụm từ đã thêm, bạn có thể làm như vậy:

```js
// Nên trả về "thistle"
recognition.phrases[0].phrase;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
