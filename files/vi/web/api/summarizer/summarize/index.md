---
title: "Summarizer: phương thức summarize()"
short-title: summarize()
slug: Web/API/Summarizer/summarize
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Summarizer.summarize
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`summarize()`** của giao diện {{domxref("Summarizer")}} tạo một chuỗi bản tóm tắt mới.

## Cú pháp

```js-nolint
summarize(input)
summarize(input, options)
```

### Tham số

- `input`
  - : Một chuỗi đại diện cho văn bản cần tóm tắt.
- `options` {{optional_inline}}
  - : Một đối tượng xác định các tùy chọn cấu hình cho thao tác `summarize()`. Các giá trị có thể bao gồm:
    - `context`
      - : Một chuỗi mô tả ngữ cảnh mà văn bản đầu vào đang được sử dụng trong đó, giúp `Summarizer` tạo ra bản tóm tắt phù hợp hơn.
    - `signal`
      - : Một thực thể đối tượng {{domxref("AbortSignal")}}, cho phép hủy bỏ thao tác `summarize()` thông qua {{domxref("AbortController")}} được liên kết.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một chuỗi chứa bản tóm tắt được tạo.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Được ném ra nếu `Summarizer` trước đó đã bị hủy bỏ (đã gọi {{domxref("Summarizer.destroy()")}} hoặc bị hủy bỏ thông qua [`signal`](/en-US/docs/Web/API/Summarizer/create_static#signal) hủy bỏ sau khi tạo).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} hiện tại không hoạt động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc sử dụng Summarizer API bị chặn bởi {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}}.
- `NotReadableError` {{domxref("DOMException")}}
  - : Được ném ra nếu bản tóm tắt đầu ra bị lọc bởi tác nhân người dùng, ví dụ vì nó bị phát hiện là có hại, không chính xác hoặc vô nghĩa.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `context` được cung cấp không ở ngôn ngữ mà `Summarizer` hỗ trợ.
- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu thao tác tóm tắt vượt quá {{domxref("Summarizer.inputQuota", "inputQuota")}} có sẵn.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu lần gọi `summarize()` thất bại vì bất kỳ lý do nào khác, hoặc lý do mà tác nhân người dùng không muốn tiết lộ.

## Ví dụ

### Sử dụng cơ bản `summarize()`

```js
const summarizer = await Summarizer.create({
  sharedContext:
    "A general summary to help a user decide if the text is worth reading",
  type: "tldr",
  length: "short",
});

const summary = await summarizer.summarize(myTextString);
console.log(summary);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
