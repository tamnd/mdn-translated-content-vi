---
title: "SpeechRecognitionResultList: phương thức item()"
short-title: item()
slug: Web/API/SpeechRecognitionResultList/item
page-type: web-api-instance-method
browser-compat: api.SpeechRecognitionResultList.item
---

{{APIRef("Web Speech API")}}

Getter **`item`** của giao diện
{{domxref("SpeechRecognitionResultList")}} là một getter tiêu chuẩn — nó cho phép
truy cập các đối tượng {{domxref("SpeechRecognitionResult")}} trong danh sách qua cú pháp
mảng.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Chỉ mục của item cần lấy.

### Giá trị trả về

Một đối tượng {{domxref("SpeechRecognitionResult")}}.

## Ví dụ

Code này được trích từ ví dụ
[Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Nhận được kết quả: ${color}.`;
  bg.style.backgroundColor = color;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
