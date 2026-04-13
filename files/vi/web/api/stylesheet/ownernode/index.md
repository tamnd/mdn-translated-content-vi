---
title: "StyleSheet: ownerNode property"
short-title: ownerNode
slug: Web/API/StyleSheet/ownerNode
page-type: web-api-instance-property
browser-compat: api.StyleSheet.ownerNode
---

{{APIRef("CSSOM")}}

Thuộc tính **`ownerNode`** của giao diện {{domxref("StyleSheet")}} trả về nút liên kết bảng định kiểu này với tài liệu.

Đây thường là phần tử HTML [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) hoặc [`<style>`](/en-US/docs/Web/HTML/Reference/Elements/style), nhưng cũng có thể trả về một [nút chỉ thị xử lý](/en-US/docs/Web/API/ProcessingInstruction) trong trường hợp `<?xml-stylesheet ?>`.

## Giá trị

Một đối tượng {{domxref("Node")}}.

## Ví dụ

Giả sử phần `<head>` chứa như sau:

```html
<link rel="stylesheet" href="example.css" />
```

Thì:

```js
console.log(document.styleSheets[0].ownerNode);
// Hiển thị '<link rel="stylesheet" href="example.css">'
```

## Ghi chú

Đối với các bảng định kiểu được bao gồm bởi các bảng định kiểu khác, chẳng hạn với {{cssxref("@import")}}, giá trị của thuộc tính này là `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
