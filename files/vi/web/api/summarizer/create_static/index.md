---
title: "Summarizer: phương thức tĩnh create()"
short-title: create()
slug: Web/API/Summarizer/create_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.Summarizer.create_static
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`create()`** của giao diện {{domxref("Summarizer")}} tạo một thực thể `Summarizer` mới để tạo bản tóm tắt.

> [!NOTE]
> Phương thức `create()` yêu cầu [kích hoạt nhất thời](/en-US/docs/Glossary/Transient_activation), tức là nó phải được gọi để phản hồi một hành động của người dùng như nhấp chuột hoặc nhấn nút.

## Cú pháp

```js-nolint
Summarizer.create()
Summarizer.create(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng xác định các tùy chọn cấu hình cho `Summarizer`. Các giá trị có thể bao gồm:
    - `expectedInputLanguages`
      - : Một mảng các chuỗi chỉ định các ngôn ngữ dự kiến của văn bản đầu vào, phải là {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}} hợp lệ. Mặc định là `["en"]`.
    - `expectedContextLanguages`
      - : Một mảng các chuỗi chỉ định các ngôn ngữ dự kiến của bất kỳ chuỗi ngữ cảnh nào được cung cấp (hoặc [`sharedContext`](#sharedcontext) được truyền cho `Summarizer`, hoặc `context` được chỉ định trong lần gọi {{domxref("Summarizer.summarize", "summarize()")}} hoặc {{domxref("Summarizer.summarizeStreaming", "summarizeStreaming()")}}), phải là thẻ ngôn ngữ BCP 47 hợp lệ. Mặc định là `["en"]`.
    - `format`
      - : Một giá trị liệt kê chỉ định {{domxref("Summarizer.format", "định dạng")}} văn bản bạn muốn các bản tóm tắt được trả về. Mặc định là `markdown`.
    - `length`
      - : Một giá trị liệt kê chỉ định {{domxref("Summarizer.length", "độ dài")}} tương đối cho các bản tóm tắt được tạo. Mặc định là `short`.
    - `monitor`
      - : Một hàm callback với tham số {{domxref("CreateMonitor")}} cho phép theo dõi tiến trình tải xuống của mô hình AI.
    - `outputLanguage`
      - : Một chuỗi chỉ định ngôn ngữ dự kiến của các bản tóm tắt được tạo bởi `Summarizer`, phải là thẻ ngôn ngữ BCP 47 hợp lệ. Mặc định là `en`.
    - `sharedContext`
      - : Một chuỗi {{domxref("Summarizer.sharedContext", "sharedContext")}} mô tả ngữ cảnh mà các đoạn văn bản cần tóm tắt đang được sử dụng trong đó, giúp `Summarizer` tạo ra các bản tóm tắt phù hợp hơn.
    - `signal`
      - : Một thực thể đối tượng {{domxref("AbortSignal")}}, cho phép hủy bỏ thao tác `create()` thông qua {{domxref("AbortController")}} được liên kết. Hiệu ứng chính xác phụ thuộc vào thời điểm {{domxref("AbortController.abort()")}} được gọi:
        - Nếu `abort()` được gọi trước khi promise `create()` được giải quyết, thao tác `create()` sẽ bị hủy bỏ.
        - Nếu `abort()` được gọi sau khi promise `create()` hoàn thành, nó có tác dụng tương tự như việc gọi {{domxref("Summarizer.destroy()")}}: Các tài nguyên được gán cho thực thể `Summarizer` kết quả sẽ được giải phóng, và mọi lần gọi phương thức `Summarizer` đang diễn ra và tiếp theo sẽ bị từ chối với một `AbortError`.
    - `type`
      - : Một giá trị liệt kê chỉ định {{domxref("Summarizer.type", "loại")}} bản tóm tắt bạn muốn `Summarizer` này tạo. Mặc định là `key-points`.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một thực thể đối tượng `Summarizer`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc sử dụng Summarizer API bị chặn bởi {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu bất kỳ thẻ ngôn ngữ nào được chỉ định trong `expectedContextLanguages`, `expectedInputLanguages`, hoặc `outputLanguage` không hợp lệ hoặc không được hỗ trợ.
- `OperationError` {{domxref("DOMException")}}
  - : Ngoại lệ đa năng được ném ra nếu việc tạo `Summarizer` thất bại vì bất kỳ lý do nào khác.

## Ví dụ

### Tạo `Summarizer` cơ bản

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
