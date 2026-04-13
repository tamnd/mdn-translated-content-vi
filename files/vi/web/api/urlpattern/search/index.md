---
title: "URLPattern: search property"
short-title: search
slug: Web/API/URLPattern/search
page-type: web-api-instance-property
browser-compat: api.URLPattern.search
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`search`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần search của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu search được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), một [giá trị được kế thừa từ `baseURL`](/en-US/docs/Web/API/URLPattern/URLPattern#inheritance_from_a_baseurl) được truyền cho hàm tạo, hoặc giá trị mặc định (`"*"`), khớp với mọi phần search.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ sau tạo một đối tượng {{domxref("URLPattern")}} với `'q=baby'` cho phần `search` và ghi lại thuộc tính.
Mẫu này khớp với bất kỳ URL nào có phần search chứa đúng chuỗi đó.

```js
const pattern = new URLPattern({
  search: "q=baby",
});
console.log(pattern.search); // "q=baby"
console.log(pattern.test("https://example.com/shoes?q=baby")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
