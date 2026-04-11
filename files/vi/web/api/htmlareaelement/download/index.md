---
title: "HTMLAreaElement: thuộc tính download"
short-title: download
slug: Web/API/HTMLAreaElement/download
page-type: web-api-instance-property
browser-compat: api.HTMLAreaElement.download
---

{{APIRef("HTML DOM")}}

Thuộc tính **`download`** của giao diện {{DOMxRef("HTMLAreaElement")}} là một chuỗi cho biết tài nguyên được liên kết nên được tải xuống thay vì hiển thị trong trình duyệt. Giá trị này đại diện cho tên tệp đề xuất.

Nó phản ánh thuộc tính [`download`](/en-US/docs/Web/HTML/Reference/Elements/area#download) của phần tử {{htmlelement("area")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const area = document.getElementById("imageArea");
console.log(area.download);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
