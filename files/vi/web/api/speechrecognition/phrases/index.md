---
title: "SpeechRecognition: Thuộc tính phrases"
short-title: phrases
slug: Web/API/SpeechRecognition/phrases
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SpeechRecognition.phrases
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Thuộc tính **`phrases`** của giao diện {{domxref("SpeechRecognition")}} thiết lập một mảng các đối tượng {{domxref("SpeechRecognitionPhrase")}} để sử dụng cho [thiên vị ngữ cảnh](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#contextual_biasing_in_speech_recognition).

## Giá trị

Một `ObservableArray` các đối tượng {{domxref("SpeechRecognitionPhrase")}}.

## Ví dụ

### Sử dụng cơ bản

Đoạn mã sau đầu tiên tạo một mảng chứa các cụm từ cần tăng cường và các giá trị {{domxref("SpeechRecognitionPhrase.boost", "boost")}} của chúng. Chúng ta chuyển đổi dữ liệu này thành một `ObservableArray` các đối tượng `SpeechRecognitionPhrase` bằng cách ánh xạ mảng ban đầu tới các lời gọi bộ khởi tạo {{domxref("SpeechRecognitionPhrase.SpeechRecognitionPhrase", "SpeechRecognitionPhrase()")}}:

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

Sau khi tạo một thể hiện {{domxref("SpeechRecognition")}}, chúng ta sau đó đưa các cụm từ thiên vị ngữ cảnh vào bằng cách thiết lập mảng `phraseObjects` làm giá trị của thuộc tính `SpeechRecognition.phrases`:

```js
const recognition = new SpeechRecognition();
recognition.continuous = false;
recognition.lang = "en-US";
recognition.interimResults = false;
recognition.processLocally = true;
recognition.phrases = phraseObjects;

// …
```

Đoạn mã này được trích từ ví dụ [on-device speech color changer](https://github.com/mdn/dom-examples/tree/main/web-speech-api/on-device-speech-color-changer) ([chạy demo trực tiếp](https://mdn.github.io/dom-examples/web-speech-api/on-device-speech-color-changer/)). Xem [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API) để biết giải thích đầy đủ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
- {{domxref("SpeechRecognitionPhrase")}}
