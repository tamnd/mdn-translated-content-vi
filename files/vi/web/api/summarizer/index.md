---
title: Summarizer
slug: Web/API/Summarizer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Summarizer
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Giao diện **`Summarizer`** của {{domxref("Summarizer API", "Summarizer API", "", "nocode")}} chứa tất cả các chức năng cho API này, bao gồm kiểm tra tính khả dụng của mô hình AI trình duyệt, tạo một thực thể `Summarizer` mới, sử dụng nó để tạo bản tóm tắt mới, và nhiều hơn nữa.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("Summarizer.expectedContextLanguages", "expectedContextLanguages")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Các ngôn ngữ mà các chuỗi ngữ cảnh nên được viết bằng.
- {{domxref("Summarizer.expectedInputLanguages", "expectedInputLanguages")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Các ngôn ngữ mà `Summarizer` nên hỗ trợ.
- {{domxref("Summarizer.format", "format")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Định dạng văn bản mà các bản tóm tắt sẽ được trả về.
- {{domxref("Summarizer.inputQuota", "inputQuota")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Hạn mức đầu vào có sẵn cho trình duyệt để tạo bản tóm tắt.
- {{domxref("Summarizer.length", "length")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Độ dài tương đối của các bản tóm tắt được tạo.
- {{domxref("Summarizer.outputLanguage", "outputLanguage")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Ngôn ngữ mà bản tóm tắt sẽ được tạo bằng.
- {{domxref("Summarizer.sharedContext", "sharedContext")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi văn bản mô tả ngữ cảnh mà các đoạn văn bản cần tóm tắt đang được sử dụng trong đó, giúp `Summarizer` tạo ra các bản tóm tắt phù hợp hơn.
- {{domxref("Summarizer.type", "type")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Loại bản tóm tắt sẽ được tạo bởi `Summarizer`.

## Phương thức tĩnh

- {{domxref("Summarizer.availability_static", "availability()")}} {{Experimental_Inline}}
  - : Trả về một giá trị liệt kê cho biết mô hình AI trình duyệt có hỗ trợ cấu hình `Summarizer` nhất định hay không.
- {{domxref("Summarizer.create_static", "create()")}} {{Experimental_Inline}}
  - : Tạo một thực thể `Summarizer` mới để tạo bản tóm tắt.

## Phương thức phiên bản

- {{domxref("Summarizer.destroy", "destroy()")}} {{Experimental_Inline}}
  - : Giải phóng các tài nguyên được gán cho thực thể `Summarizer` được gọi và dừng mọi hoạt động tiếp theo trên đó.
- {{domxref("Summarizer.measureInputUsage", "measureInputUsage()")}} {{Experimental_Inline}}
  - : Báo cáo lượng hạn mức đầu vào sẽ được sử dụng bởi thao tác tóm tắt cho một đầu vào văn bản nhất định.
- {{domxref("Summarizer.summarize", "summarize()")}} {{Experimental_Inline}}
  - : Tạo một chuỗi bản tóm tắt mới.
- {{domxref("Summarizer.summarizeStreaming", "summarizeStreaming()")}} {{Experimental_Inline}}
  - : Tạo một bản tóm tắt mới dưới dạng {{domxref("ReadableStream")}}.

## Ví dụ

Xem [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using) để có ví dụ hoàn chỉnh.

### Tạo một thực thể `Summarizer`

```js
const summarizer = await Summarizer.create({
  sharedContext:
    "A general summary to help a user decide if the text is worth reading",
  type: "tldr",
  length: "short",
  format: "markdown",
  expectedInputLanguages: ["en-US"],
  outputLanguage: "en-US",
});
```

### Tạo bản tóm tắt

```js
const summary = await summarizer.summarize(myTextString);
console.log(summary);
```

### Tạo luồng bản tóm tắt

```js
const stream = summarizer.summarizeStreaming(myTextString);
let summary = "";

for await (const chunk of stream) {
  summary += chunk;
}

console.log("Stream complete");
summaryOutput.textContent = summary;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
