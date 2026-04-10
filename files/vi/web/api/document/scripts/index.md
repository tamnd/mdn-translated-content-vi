---
title: "Document: scripts property"
short-title: scripts
slug: Web/API/Document/scripts
page-type: web-api-instance-property
browser-compat: api.Document.scripts
---

{{APIRef("DOM")}}

Thuộc tính **`scripts`** của giao diện {{domxref("Document")}} trả về một danh sách các phần tử {{HTMLElement("script")}} trong tài liệu. Đối tượng trả về là một {{domxref("HTMLCollection")}}.

## Giá trị

Một {{domxref("HTMLCollection")}}. Bạn có thể sử dụng nó giống như một mảng để lấy tất cả các phần tử trong danh sách.

## Ví dụ

Ví dụ này kiểm tra xem trang có phần tử {{HTMLElement("script")}} nào không.

```js
let scripts = document.scripts;

if (scripts.length) {
  alert("This page has scripts!");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
