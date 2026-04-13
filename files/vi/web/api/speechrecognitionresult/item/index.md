---
title: "SpeechRecognitionResult: phương thức item()"
short-title: item()
slug: Web/API/SpeechRecognitionResult/item
page-type: web-api-instance-method
browser-compat: api.SpeechRecognitionResult.item
---

{{APIRef("Web Speech API")}}

Getter **`item`** của giao diện {{domxref("SpeechRecognitionResult")}} là một getter tiêu chuẩn cho phép truy cập các đối tượng {{domxref("SpeechRecognitionAlternative")}} trong kết quả thông qua cú pháp mảng.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Chỉ mục của mục cần truy xuất.

### Giá trị trả về

Một đối tượng {{domxref("SpeechRecognitionAlternative")}}.

## Ví dụ

Đoạn mã này được trích từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
