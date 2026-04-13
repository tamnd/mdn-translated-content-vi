---
title: "HTMLScriptElement: thuộc tính blocking"
short-title: blocking
slug: Web/API/HTMLScriptElement/blocking
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.blocking
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`blocking`** của {{domxref("HTMLScriptElement")}} trả về một đối tượng {{domxref("DOMTokenList")}} trực tiếp chứa các thao tác cần bị chặn khi tìm nạp tài nguyên ngoài. Nó phản ánh thuộc tính nội dung [`blocking`](/en-US/docs/Web/HTML/Reference/Elements/script#blocking) của phần tử {{HTMLElement("script")}}.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `blocking` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `blocking`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}} và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```html
<script id="el" async blocking="render"></script>
```

```js
const el = document.getElementById("el");
console.log(el.blocking); // Kết quả: "render"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.blocking")}}
- {{domxref("HTMLStyleElement.blocking")}}
