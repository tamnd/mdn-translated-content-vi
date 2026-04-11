---
title: "HTMLFormElement: thuộc tính acceptCharset"
short-title: acceptCharset
slug: Web/API/HTMLFormElement/acceptCharset
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.acceptCharset
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLFormElement.acceptCharset`** đại diện cho {{glossary("character encoding")}} của phần tử {{htmlelement("form")}} đã cho.

Đặc tả chỉ cho phép một giá trị không phân biệt hoa thường là `"UTF-8"`, phản ánh mức độ phổ biến của bộ mã hóa này (trước đây có thể chỉ định nhiều bộ mã hóa ký tự dưới dạng danh sách phân tách bằng dấu phẩy hoặc khoảng trắng).

Thuộc tính này phản ánh giá trị của thuộc tính HTML [`accept-charset`](/en-US/docs/Web/HTML/Reference/Elements/form#accept-charset) của biểu mẫu.

## Giá trị

Một chuỗi có thể khớp không phân biệt hoa thường với `UTF-8`.

## Ví dụ

```js
let charSet = document.forms["my-form"].acceptCharset;
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
