---
title: SpeechGrammar
slug: Web/API/SpeechGrammar
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SpeechGrammar
---

{{APIRef("Web Speech API")}}{{deprecated_header}}

Giao diện **`SpeechGrammar`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho một tập hợp các từ hoặc các mẫu từ để dịch vụ nhận dạng nhận biết.

Ngữ pháp được định nghĩa sử dụng [JSpeech Grammar Format](https://www.w3.org/TR/jsgf/) (**JSGF**).

> [!NOTE]
> Khái niệm ngữ pháp đã bị xóa khỏi Web Speech API. Các tính năng liên quan vẫn còn trong thông số kỹ thuật và vẫn được các trình duyệt hỗ trợ để tương thích ngược, nhưng chúng không có tác dụng đối với dịch vụ nhận dạng giọng nói.

## Hàm khởi tạo

- {{domxref("SpeechGrammar.SpeechGrammar()", "SpeechGrammar()")}} {{Non-standard_Inline}} {{deprecated_inline}}
  - : Tạo đối tượng `SpeechGrammar` mới.

## Thuộc tính phiên bản

- {{domxref("SpeechGrammar.src")}} {{deprecated_inline}}
  - : Đặt và trả về chuỗi chứa ngữ pháp từ bên trong phiên bản đối tượng `SpeechGrammar`.
- {{domxref("SpeechGrammar.weight")}} {{Optional_Inline}} {{deprecated_inline}}
  - : Đặt và trả về trọng số của đối tượng `SpeechGrammar`.

## Ví dụ

```js
const grammar =
  "#JSGF V1.0; grammar colors; public <color> = aqua | azure | beige | bisque | black | blue | brown | chocolate | coral | crimson | cyan | fuchsia | ghostwhite | gold | goldenrod | gray | green | indigo | ivory | khaki | lavender | lime | linen | magenta | maroon | moccasin | navy | olive | orange | orchid | peru | pink | plum | purple | red | salmon | sienna | silver | snow | tan | teal | thistle | tomato | turquoise | violet | white | yellow ;";
const recognition = new SpeechRecognition();
const speechRecognitionList = new SpeechGrammarList();
speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;

console.log(speechRecognitionList[0].src); // nên trả về cùng nội dung như biến grammar
console.log(speechRecognitionList[0].weight); // nên trả về 1 - giống trọng số được đặt trong addFromString.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
