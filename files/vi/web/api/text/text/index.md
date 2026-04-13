---
title: "Text: Text() constructor"
short-title: Text()
slug: Web/API/Text/Text
page-type: web-api-constructor
browser-compat: api.Text.Text
---

{{ APIRef("DOM")}}

Hàm khởi tạo **`Text()`** trả về một đối tượng {{domxref("Text")}} mới với chuỗi tùy chọn được truyền vào làm nội dung văn bản của nó.

## Cú pháp

```js-nolint
new Text()
new Text(string)
```

### Tham số

- `string` {{optional_inline}}
  - : Một chuỗi đại diện cho nội dung văn bản của nút văn bản.

### Giá trị trả về

Một đối tượng {{domxref("Text")}} mới với nội dung của tham số `string`, hoặc chuỗi rỗng nếu không có tham số nào được truyền vào.

## Ví dụ

```js
let text = new Text("Test");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [The DOM API](/en-US/docs/Web/API/Document_Object_Model)
