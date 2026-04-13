---
title: "URLPattern: protocol property"
short-title: protocol
slug: Web/API/URLPattern/protocol
page-type: web-api-instance-property
browser-compat: api.URLPattern.protocol
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`protocol`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần protocol của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu protocol được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), một [giá trị được kế thừa từ `baseURL`](/en-US/docs/Web/API/URLPattern/URLPattern#inheritance_from_a_baseurl) được truyền cho hàm tạo, hoặc giá trị mặc định (`"*"`), khớp với mọi protocol.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ sau tạo một đối tượng {{domxref("URLPattern")}} với `http{s}?` cho phần `protocol` và ghi lại thuộc tính.
Mẫu này khớp với bất kỳ URL nào có protocol `http` hoặc `https`.

```js
const pattern = new URLPattern({ protocol: "http{s}?" });
console.log(pattern.protocol); // 'http{s}?'
console.log(pattern.test("https://example.com/shoes?q=baby")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
