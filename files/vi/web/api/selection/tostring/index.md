---
title: "Selection: phương thức toString()"
short-title: toString()
slug: Web/API/Selection/toString
page-type: web-api-instance-method
browser-compat: api.Selection.toString
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.toString()`** trả về chuỗi hiện đang được đối tượng selection biểu diễn, tức là văn bản hiện được chọn.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn vùng chọn.

## Mô tả

Phương thức này trả về văn bản hiện đang được chọn.

Trong [JavaScript](/en-US/docs/Web/JavaScript), phương thức này được gọi tự động khi một hàm yêu cầu chuỗi và đối tượng selection được truyền vào:

```js
alert(window.getSelection()); // Cái được gọi
alert(window.getSelection().toString()); // Cái thực sự được gọi.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
