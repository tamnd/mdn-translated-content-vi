---
title: "HTMLBaseElement: target property"
short-title: target
slug: Web/API/HTMLBaseElement/target
page-type: web-api-instance-property
browser-compat: api.HTMLBaseElement.target
---

{{ApiRef("HTML DOM")}}

Thuộc tính `target` của giao diện {{domxref("HTMLBaseElement")}} là một chuỗi đại diện cho tab đích mặc định để hiển thị kết quả đầu ra cho các siêu liên kết và phần tử biểu mẫu.

Nó phản ánh thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/base#target) của phần tử {{HTMLElement("base")}}.

## Giá trị

Một chuỗi đại diện cho đích. Giá trị của nó có thể là:

- Tên của một {{HTMLElement("frame")}}.
- Một trong các [từ khóa có giá trị cụ thể](/en-US/docs/Web/HTML/Reference/Elements/base#target): `_blank`, `_self`, `_parent`, hoặc `_top`.

## Ví dụ

```html
<head>
  <base target="_top" />
</head>
```

```js
const baseElement = document.getElementsByTagName("base")[0];
console.log(baseElement.target); // Output: '_top'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLAnchorElement.target")}}
- Thuộc tính {{domxref("HTMLAreaElement.target")}}
- Thuộc tính {{domxref("HTMLFormElement.target")}}
