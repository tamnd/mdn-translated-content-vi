---
title: LanguageDetector
slug: Web/API/LanguageDetector
page-type: web-api-interface
status:
  - experimental
browser-compat: api.LanguageDetector
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Giao diện **`LanguageDetector`** của {{domxref("Translator and Language Detector APIs", "Translator and Language Detector APIs", "", "nocode")}} chứa tất cả chức năng phát hiện ngôn ngữ, bao gồm kiểm tra tính khả dụng của mô hình AI, tạo phiên bản `LanguageDetector` mới, sử dụng nó để phát hiện ngôn ngữ, và nhiều hơn nữa.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("LanguageDetector.inputQuota", "inputQuota")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Hạn ngạch đầu vào có sẵn cho trình duyệt để phát hiện ngôn ngữ.
- {{domxref("LanguageDetector.expectedInputLanguages", "expectedInputLanguages")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Các ngôn ngữ dự kiến sẽ được phát hiện trong văn bản đầu vào.

## Phương thức tĩnh

- {{domxref("LanguageDetector.availability_static", "availability()")}} {{Experimental_Inline}}
  - : Trả về giá trị kiểu liệt kê cho biết liệu mô hình AI của trình duyệt có hỗ trợ cấu hình `LanguageDetector` đã cho hay không.
- {{domxref("LanguageDetector.create_static", "create()")}} {{Experimental_Inline}}
  - : Tạo một phiên bản `LanguageDetector` mới để phát hiện ngôn ngữ.

## Phương thức phiên bản

- {{domxref("LanguageDetector.destroy", "destroy()")}} {{Experimental_Inline}}
  - : Giải phóng các tài nguyên được gán cho phiên bản `LanguageDetector` mà nó được gọi và dừng mọi hoạt động tiếp theo trên đó.
- {{domxref("LanguageDetector.detect", "detect()")}} {{Experimental_Inline}}
  - : Phát hiện ngôn ngữ khớp gần nhất hoặc các ngôn ngữ mà một chuỗi văn bản đã cho có nhiều khả năng được viết.
- {{domxref("LanguageDetector.measureInputUsage", "measureInputUsage()")}} {{Experimental_Inline}}
  - : Báo cáo lượng hạn ngạch đầu vào sẽ được sử dụng bởi một thao tác phát hiện ngôn ngữ cho đầu vào văn bản đã cho.

## Ví dụ

Xem [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using) để có ví dụ hoàn chỉnh.

### Tạo phiên bản `LanguageDetector`

```js
const detector = await LanguageDetector.create({
  expectedInputLanguages: ["en-US", "zh"],
});
```

> [!NOTE]
> Các triển khai khác nhau có thể hỗ trợ các ngôn ngữ khác nhau.

### Phát hiện ngôn ngữ

```js
const results = await detector.detect(myTextString);

results.forEach((result) => {
  console.log(`${result.detectedLanguage}: ${result.confidence}`);
});

// Results in logs like this:
// la: 0.8359838724136353
// es: 0.017705978825688362
// sv: 0.012977192178368568
// en: 0.011148443445563316
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
