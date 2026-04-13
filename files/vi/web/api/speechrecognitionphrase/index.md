---
title: SpeechRecognitionPhrase
slug: Web/API/SpeechRecognitionPhrase
page-type: web-api-interface
status:
  - experimental
browser-compat: api.SpeechRecognitionPhrase
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Giao diện **`SpeechRecognitionPhrase`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho cụm từ có thể được truyền vào engine nhận dạng giọng nói để [biasing theo ngữ cảnh](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#contextual_biasing_in_speech_recognition).

## Thuộc tính phiên bản

- {{domxref("SpeechRecognitionPhrase.boost")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Số thực đại diện cho mức độ tăng cường bạn muốn áp dụng cho `phrase` tương ứng.
- {{domxref("SpeechRecognitionPhrase.phrase")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Chuỗi chứa từ hoặc cụm từ bạn muốn tăng cường trong bias của engine nhận dạng.

## Ví dụ

### Sử dụng cơ bản

Mã sau đây trước tiên tạo mảng chứa các cụm từ cần tăng cường và giá trị {{domxref("SpeechRecognitionPhrase.boost", "boost")}} của chúng. Chúng ta chuyển đổi dữ liệu này thành `ObservableArray` của các đối tượng `SpeechRecognitionPhrase` bằng cách ánh xạ các phần tử mảng gốc sang các lệnh gọi hàm tạo {{domxref("SpeechRecognitionPhrase.SpeechRecognitionPhrase", "SpeechRecognitionPhrase()")}}:

```js
const phraseData = [
  { phrase: "azure", boost: 5.0 },
  { phrase: "khaki", boost: 3.0 },
  { phrase: "tan", boost: 2.0 },
];

const phraseObjects = phraseData.map(
  (p) => new SpeechRecognitionPhrase(p.phrase, p.boost),
);
```

Sau khi tạo phiên bản {{domxref("SpeechRecognition")}}, chúng ta thêm các cụm từ biasing theo ngữ cảnh bằng cách đặt mảng `phraseObjects` làm giá trị của thuộc tính {{domxref("SpeechRecognition.phrases")}}:

```js
const recognition = new SpeechRecognition();
recognition.continuous = false;
recognition.lang = "en-US";
recognition.interimResults = false;
recognition.processLocally = true;
recognition.phrases = phraseObjects;

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
- {{domxref("SpeechRecognition.phrases")}}
