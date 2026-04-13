---
title: Translator
slug: Web/API/Translator
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Translator
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Giao diện **`Translator`** của {{domxref("Translator and Language Detector APIs", "Translator and Language Detector APIs", "", "nocode")}} chứa tất cả các chức năng dịch liên quan, bao gồm kiểm tra tính khả dụng của mô hình AI, tạo đối tượng `Translator` mới, sử dụng nó để tạo bản dịch và nhiều hơn nữa.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("Translator.inputQuota", "inputQuota")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Hạn mức đầu vào có sẵn cho trình duyệt để tạo bản dịch.
- {{domxref("Translator.sourceLanguage", "sourceLanguage")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Ngôn ngữ dự kiến của văn bản đầu vào cần dịch.
- {{domxref("Translator.targetLanguage", "targetLanguage")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Ngôn ngữ mà văn bản đầu vào sẽ được dịch sang.

## Phương thức tĩnh

- {{domxref("Translator.availability_static", "availability()")}} {{Experimental_Inline}}
  - : Trả về một giá trị liệt kê cho biết tính khả dụng của mô hình AI cho cấu hình `Translator` đã cho.
- {{domxref("Translator.create_static", "create()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `Translator` mới để tạo bản dịch.

## Phương thức phiên bản

- {{domxref("Translator.destroy", "destroy()")}} {{Experimental_Inline}}
  - : Giải phóng các tài nguyên được phân bổ cho đối tượng `Translator` và dừng mọi hoạt động tiếp theo trên nó.
- {{domxref("Translator.measureInputUsage", "measureInputUsage()")}} {{Experimental_Inline}}
  - : Báo cáo mức hạn mức đầu vào sẽ được sử dụng bởi một thao tác dịch cho một văn bản đầu vào nhất định.
- {{domxref("Translator.translate", "translate()")}} {{Experimental_Inline}}
  - : Trả về một chuỗi chứa bản dịch của chuỗi đầu vào.
- {{domxref("Translator.translateStreaming", "translateStreaming()")}} {{Experimental_Inline}}
  - : Tạo bản dịch của chuỗi đầu vào dưới dạng {{domxref("ReadableStream")}}.

## Ví dụ

Xem [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using) để có ví dụ đầy đủ.

### Tạo đối tượng `Translator`

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});
```

### Tạo bản dịch

```js
const translation = await translator.translate(myTextString);
console.log(translation);
```

### Tạo luồng bản dịch

```js
const stream = translator.translateStreaming(myTextString);
let translation = "";

for await (const chunk of stream) {
  translation += chunk;
}

console.log("Stream complete");
console.log(translation);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
