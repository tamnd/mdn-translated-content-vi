---
title: "SpeechRecognition: Thuộc tính grammars"
short-title: grammars
slug: Web/API/SpeechRecognition/grammars
page-type: web-api-instance-property
browser-compat: api.SpeechRecognition.grammars
---

{{APIRef("Web Speech API")}}

Thuộc tính **`grammars`** của giao diện {{domxref("SpeechRecognition")}} trả về và thiết lập một tập hợp các đối tượng {{domxref("SpeechGrammar")}} biểu diễn các grammar sẽ được hiểu bởi `SpeechRecognition` hiện tại.

> [!NOTE]
> Khái niệm grammar đã bị loại bỏ khỏi Web Speech API. Các tính năng liên quan vẫn còn trong đặc tả và vẫn được các trình duyệt hỗ trợ nhận diện để tương thích ngược, nhưng chúng không có tác dụng đối với các dịch vụ nhận dạng giọng nói.

## Giá trị

Một {{domxref("SpeechGrammarList")}} chứa các đối tượng {{domxref("SpeechGrammar")}} biểu diễn các grammar được sử dụng bởi ứng dụng của bạn.

## Ví dụ

```js
const grammar =
  "#JSGF V1.0; grammar colors; public <color> = aqua | azure | beige | bisque | black | blue | brown | chocolate | coral | crimson | cyan | fuchsia | ghostwhite | gold | goldenrod | gray | green | indigo | ivory | khaki | lavender | lime | linen | magenta | maroon | moccasin | navy | olive | orange | orchid | peru | pink | plum | purple | red | salmon | sienna | silver | snow | tan | teal | thistle | tomato | turquoise | violet | white | yellow ;";
const recognition = new SpeechRecognition();
const speechRecognitionList = new SpeechGrammarList();
speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;

// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
