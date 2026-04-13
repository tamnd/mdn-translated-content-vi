---
title: "HTMLAnchorElement: thuộc tính target"
short-title: target
slug: Web/API/HTMLAnchorElement/target
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.target
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`target`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi cho biết nơi hiển thị tài nguyên được liên kết.

Nó phản ánh thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/a#target) của phần tử {{HTMLElement("a")}}.

## Giá trị

Một chuỗi đại diện cho mục tiêu. Giá trị của nó có thể là:

- Tên của một {{HTMLElement("frame")}}.
- Một trong các [từ khóa có giá trị cụ thể](/en-US/docs/Web/HTML/Reference/Elements/a#target): `_blank`, `_self`, `_parent`, hoặc `_top`.

## Ví dụ

```html
<a href="www.example1.com" class="link1" target="_blank">example1</a>
```

```js
const link = document.querySelector(".link1");
console.log(link.target); // xuất ra: "_blank"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLBaseElement.target")}}
- Thuộc tính {{domxref("HTMLFormElement.target")}}
- Thuộc tính {{domxref("HTMLAreaElement.target")}}
