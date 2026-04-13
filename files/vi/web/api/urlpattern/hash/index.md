---
title: "URLPattern: hash property"
short-title: hash
slug: Web/API/URLPattern/hash
page-type: web-api-instance-property
browser-compat: api.URLPattern.hash
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`hash`** của giao diện {{domxref("URLPattern")}} là một chuỗi chứa [mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) được dùng để khớp phần fragment của một URL.

Đây là [giá trị đã chuẩn hóa](/en-US/docs/Web/API/URL_Pattern_API#pattern_normalization) của mẫu hash được truyền cho [hàm tạo](/en-US/docs/Web/API/URLPattern/URLPattern), một [giá trị được kế thừa từ `baseURL`](/en-US/docs/Web/API/URLPattern/URLPattern#inheritance_from_a_baseurl) được truyền cho hàm tạo, hoặc giá trị mặc định (`"*"`), khớp với mọi hash.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

Ví dụ dưới đây tạo một đối tượng {{domxref("URLPattern")}} với `books/:id` cho phần `hash` và ghi lại thuộc tính.
Mẫu này khớp với bất kỳ fragment nào bắt đầu bằng `books/` và kết thúc bằng một chuỗi định danh tùy ý.

```js
const pattern = new URLPattern("https://example.org#books/:id");
console.log(pattern.hash); // 'books/:id'
console.log(pattern.test("https://example.org#books/123")); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
