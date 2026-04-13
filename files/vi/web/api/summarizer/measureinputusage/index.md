---
title: "Summarizer: phương thức measureInputUsage()"
short-title: measureInputUsage()
slug: Web/API/Summarizer/measureInputUsage
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Summarizer.measureInputUsage
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`measureInputUsage()`** của giao diện {{domxref("Summarizer")}} báo cáo lượng {{domxref("Summarizer.inputQuota", "inputQuota")}} sẽ được sử dụng bởi thao tác tóm tắt cho một đầu vào văn bản nhất định.

## Cú pháp

```js-nolint
measureInputUsage(input)
measureInputUsage(input, options)
```

### Tham số

- `input`
  - : Một chuỗi đại diện cho văn bản đầu vào bạn muốn đo lượng sử dụng đầu vào.
- `options` {{optional_inline}}
  - : Một đối tượng xác định các tùy chọn cấu hình cho thao tác `measureInputUsage()`. Các giá trị có thể bao gồm:
    - `context`
      - : Một chuỗi mô tả ngữ cảnh mà văn bản đầu vào sẽ được sử dụng trong đó, để giúp tạo ra bản tóm tắt phù hợp hơn.
    - `signal`
      - : Một thực thể đối tượng {{domxref("AbortSignal")}}, cho phép hủy bỏ thao tác `measureInputUsage()` thông qua {{domxref("AbortController")}} được liên kết.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một số chỉ định mức sử dụng {{domxref("Summarizer.inputQuota", "inputQuota")}} của văn bản đầu vào đã cho.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc sử dụng Summarizer API bị chặn bởi {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}}.
- `NotReadableError` {{domxref("DOMException")}}
  - : Được ném ra nếu bản tóm tắt đầu ra bị lọc bởi tác nhân người dùng, ví dụ vì nó bị phát hiện là có hại, không chính xác hoặc vô nghĩa.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `context` được cung cấp không ở ngôn ngữ mà `Summarizer` hỗ trợ.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu lần gọi `measureInputUsage()` thất bại vì bất kỳ lý do nào khác, hoặc lý do mà tác nhân người dùng không muốn tiết lộ.

## Ví dụ

### Kiểm tra xem bạn có đủ hạn mức không

Trong đoạn mã dưới đây, chúng tôi tạo một thực thể `Summarizer` mới bằng cách sử dụng {{domxref("Summarizer.create_static", "create()")}}, sau đó trả về tổng hạn mức đầu vào thông qua {{domxref("Summarizer.inputQuota", "inputQuota")}} và mức sử dụng hạn mức đầu vào cho việc tóm tắt một chuỗi văn bản cụ thể thông qua `measureInputUsage()`.

Sau đó chúng tôi kiểm tra xem mức sử dụng đầu vào riêng lẻ cho chuỗi đó có lớn hơn tổng hạn mức có sẵn không. Nếu có, chúng tôi ném một lỗi thích hợp; nếu không, chúng tôi bắt đầu tóm tắt chuỗi bằng cách sử dụng {{domxref("Summarizer.summarize", "summarize()")}}.

```js
const summarizer = await Summarizer.create({
  sharedContext:
    "A general summary to help a user decide if the text is worth reading",
  type: "tldr",
  length: "short",
});

const totalInputQuota = summarizer.inputQuota;
const inputUsage = await summarizer.measureInputUsage(myTextString);

if (inputUsage > totalInputQuota) {
  throw new Error("Boo, insufficient quota to generate a summary.");
} else {
  console.log("Yay, quota available to generate a summary.");
  const summary = await summarizer.summarize(myTextString);
  // ...
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
