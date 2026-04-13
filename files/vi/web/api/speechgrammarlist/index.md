---
title: SpeechGrammarList
slug: Web/API/SpeechGrammarList
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SpeechGrammarList
---

{{APIRef("Web Speech API")}}{{deprecated_header}}

Giao diện **`SpeechGrammarList`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho một danh sách các đối tượng {{domxref("SpeechGrammar")}} chứa các từ hoặc mẫu từ mà chúng ta muốn dịch vụ nhận dạng nhận ra.

Ngữ pháp được định nghĩa bằng cách sử dụng [JSpeech Grammar Format](https://www.w3.org/TR/jsgf/) (**JSGF**).

> [!NOTE]
> Khái niệm ngữ pháp đã bị loại bỏ khỏi Web Speech API. Các tính năng liên quan vẫn còn trong thông số kỹ thuật và vẫn được các trình duyệt hỗ trợ nhận biết để tương thích ngược, nhưng chúng không có hiệu lực đối với các dịch vụ nhận dạng giọng nói.

## Hàm khởi tạo

- {{domxref("SpeechGrammarList.SpeechGrammarList", "SpeechGrammarList()")}} {{deprecated_inline}}
  - : Tạo một đối tượng `SpeechGrammarList` mới.

## Thuộc tính phiên bản

- {{domxref("SpeechGrammarList.length")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Trả về số lượng đối tượng {{domxref("SpeechGrammar")}} có trong `SpeechGrammarList`.

## Phương thức phiên bản

- {{domxref("SpeechGrammarList.item()")}} {{deprecated_inline}}
  - : Getter tiêu chuẩn, cho phép lấy các đối tượng {{domxref("SpeechGrammar")}} riêng lẻ từ `SpeechGrammarList` bằng cú pháp mảng.
- {{domxref("SpeechGrammarList.addFromURI()")}} {{deprecated_inline}}
  - : Lấy một ngữ pháp có tại một URI cụ thể và thêm nó vào `SpeechGrammarList` dưới dạng một đối tượng {{domxref("SpeechGrammar")}} mới.
- {{domxref("SpeechGrammarList.addFromString()")}} {{deprecated_inline}}
  - : Thêm một ngữ pháp trong một chuỗi vào `SpeechGrammarList` dưới dạng một đối tượng {{domxref("SpeechGrammar")}} mới.

## Ví dụ

```js
const grammar =
  "#JSGF V1.0; grammar colors; public <color> = aqua | azure | beige | bisque | black | blue | brown | chocolate | coral | crimson | cyan | fuchsia | ghostwhite | gold | goldenrod | gray | green | indigo | ivory | khaki | lavender | lime | linen | magenta | maroon | moccasin | navy | olive | orange | orchid | peru | pink | plum | purple | red | salmon | sienna | silver | snow | tan | teal | thistle | tomato | turquoise | violet | white | yellow ;";
const recognition = new SpeechRecognition();
const speechRecognitionList = new SpeechGrammarList();
speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
