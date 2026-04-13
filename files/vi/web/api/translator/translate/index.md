---
title: "Translator: translate() method"
short-title: translate()
slug: Web/API/Translator/translate
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Translator.translate
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`translate()`** của giao diện {{domxref("Translator")}} trả về bản dịch của một chuỗi đầu vào.

## Cú pháp

```js-nolint
translate(input)
translate(input, options)
```

### Tham số

- `input`
  - : Một chuỗi đại diện cho văn bản cần dịch.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho thao tác `translate()`. Các giá trị có thể bao gồm:
    - `signal`
      - : Một đối tượng {{domxref("AbortSignal")}}, cho phép hủy thao tác `translate()` qua {{domxref("AbortController")}} liên kết.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với một chuỗi chứa bản dịch đã tạo.

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

const translation = await translator.translate(myTextString);
console.log(translation);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
