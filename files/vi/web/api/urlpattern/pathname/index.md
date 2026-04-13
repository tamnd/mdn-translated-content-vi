---
title: "URLPattern: pathname property"
short-title: pathname
slug: Web/API/URLPattern/pathname
page-type: web-api-instance-property
browser-compat: api.URLPattern.pathname
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`pathname`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần pathname của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu pathname được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), một [giá trị được kế thừa từ `baseURL`](/en-US/docs/Web/API/URLPattern/URLPattern#inheritance_from_a_baseurl) được truyền cho hàm tạo, hoặc giá trị mặc định (`"*"`), khớp với mọi đường dẫn.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ sau tạo một đối tượng {{domxref("URLPattern")}} với `/books/:id(\\d)` cho phần `pathname` và ghi lại thuộc tính.
Mẫu này khớp với bất kỳ URL nào bắt đầu bằng `/books/`, theo sau là một số nguyên.

```js
const pattern = new URLPattern({ pathname: "/books/:id(\\d)" });
console.log(pattern.pathname); // "/books/:id(\\d)"
console.log(pattern.test("https://example.com/books/8")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
