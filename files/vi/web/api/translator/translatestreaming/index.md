---
title: "Translator: translateStreaming() method"
short-title: translateStreaming()
slug: Web/API/Translator/translateStreaming
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Translator.translateStreaming
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`translateStreaming()`** của giao diện {{domxref("Translator")}} tạo bản dịch dưới dạng {{domxref("ReadableStream")}}.

## Cú pháp

```js-nolint
translateStreaming(input)
translateStreaming(input, options)
```

### Tham số

- `input`
  - : Một chuỗi đại diện cho văn bản cần dịch.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho thao tác `translateStreaming()`. Các giá trị có thể bao gồm:
    - `signal`
      - : Một đối tượng {{domxref("AbortSignal")}}, cho phép hủy thao tác `translateStreaming()` qua {{domxref("AbortController")}} liên kết.

### Giá trị trả về

Một {{domxref("ReadableStream")}} chứa bản dịch đã tạo.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Được ném ra nếu `Translator` đã bị phá hủy trước đó (đã có {{domxref("Translator.destroy()")}} được gọi trên nó, hoặc bị hủy qua [`signal`](/en-US/docs/Web/API/Translator/create_static#signal) hủy bỏ sau khi tạo).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} hiện tại không hoạt động.
- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu thao tác dịch vượt quá {{domxref("Translator.inputQuota", "inputQuota")}} có sẵn.

## Ví dụ

### Sử dụng cơ bản `translate()`

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});

const stream = translator.translateStreaming(myTextString);
let translation = "";

for await (const chunk of stream) {
  console.log(chunk);
  translation += chunk;
}

console.log("Complete translation:", translation);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
