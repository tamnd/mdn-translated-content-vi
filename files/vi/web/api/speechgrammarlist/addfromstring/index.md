---
title: "SpeechGrammarList: phương thức addFromString()"
short-title: addFromString()
slug: Web/API/SpeechGrammarList/addFromString
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SpeechGrammarList.addFromString
---

{{APIRef("Web Speech API")}}{{deprecated_header}}

Phương thức **`addFromString()`** của giao diện {{domxref("SpeechGrammarList")}} lấy một ngữ pháp có trong một chuỗi cụ thể trong codebase (ví dụ: được lưu trữ trong một biến) và thêm nó vào `SpeechGrammarList` dưới dạng một đối tượng {{domxref("SpeechGrammar")}} mới.

## Cú pháp

```js-nolint
addFromString(string)
addFromString(string, weight)
```

### Tham số

- `string`
  - : Một chuỗi đại diện cho ngữ pháp cần thêm.
- `weight` {{optional_inline}}
  - : Một số thực đại diện cho trọng số của ngữ pháp so với các ngữ pháp khác có trong {{domxref("SpeechGrammarList")}}. Trọng số có nghĩa là tầm quan trọng của ngữ pháp này, hoặc khả năng nó được dịch vụ nhận dạng giọng nói nhận ra. Giá trị có thể nằm trong khoảng `0.0` đến `1.0`; Nếu không được chỉ định, giá trị mặc định được sử dụng là `1.0`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
