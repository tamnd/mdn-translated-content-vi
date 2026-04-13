---
title: "Summarizer: thuộc tính inputQuota"
short-title: inputQuota
slug: Web/API/Summarizer/inputQuota
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Summarizer.inputQuota
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`inputQuota`** chỉ đọc của giao diện {{domxref("Summarizer")}} trả về hạn mức đầu vào có sẵn cho trình duyệt để tạo bản tóm tắt.

## Giá trị

Một số chỉ định hạn mức đầu vào có sẵn. Số này phụ thuộc vào triển khai. Ví dụ, nó có thể là {{jsxref("infinity")}} nếu không có giới hạn ngoài bộ nhớ của người dùng và độ dài tối đa của chuỗi JavaScript, hoặc có thể là số token trong trường hợp các mô hình AI sử dụng sơ đồ token/tín dụng.

## Ví dụ

### Kiểm tra xem bạn có đủ hạn mức không

Trong đoạn mã dưới đây, chúng tôi tạo một thực thể `Summarizer` mới bằng cách sử dụng {{domxref("Summarizer.create_static", "create()")}}, sau đó trả về tổng hạn mức đầu vào thông qua `inputQuota` và mức sử dụng hạn mức đầu vào cho việc tóm tắt một chuỗi văn bản cụ thể thông qua {{domxref("Summarizer.measureInputUsage", "measureInputUsage()")}}.

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
