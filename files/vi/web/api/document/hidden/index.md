---
title: "Document: thuộc tính hidden"
short-title: hidden
slug: Web/API/Document/hidden
page-type: web-api-instance-property
browser-compat: api.Document.hidden
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Document.hidden`** trả về giá trị Boolean cho biết trang có được coi là ẩn hay không.

Thuộc tính {{domxref("Document.visibilityState")}} cung cấp một cách thay thế để xác định xem trang có ẩn hay không.

## Giá trị

Một giá trị Boolean, `true` nếu trang đang ẩn, và `false` nếu ngược lại.

## Ví dụ

```js
document.addEventListener("visibilitychange", () => {
  console.log(document.hidden);
  // Sửa đổi hành vi…
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.visibilityState")}}
