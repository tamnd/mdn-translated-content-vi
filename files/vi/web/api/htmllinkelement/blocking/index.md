---
title: "HTMLLinkElement: thuộc tính blocking"
short-title: blocking
slug: Web/API/HTMLLinkElement/blocking
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.blocking
---

{{APIRef("HTML DOM")}}

Thuộc tính **`blocking`** chỉ đọc của giao diện {{domxref("HTMLLinkElement")}} trả về một đối tượng {{domxref("DOMTokenList")}} trực tiếp chứa các hoạt động cần bị chặn khi tải tài nguyên bên ngoài. Nó phản ánh thuộc tính nội dung [`blocking`](/en-US/docs/Web/HTML/Reference/Elements/link#blocking) của phần tử {{HTMLElement("link")}}.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `blocking` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `blocking`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}}, và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```html
<link
  id="el"
  rel="stylesheet"
  href="/example.css"
  blocking="render"
  crossorigin />
```

```js
const el = document.getElementById("el");
console.log(el.blocking); // Output: DOMTokenList ["render"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.blocking")}}
- {{domxref("HTMLStyleElement.blocking")}}
