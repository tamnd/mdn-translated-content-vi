---
title: "HTMLIFrameElement: thuộc tính sandbox"
short-title: sandbox
slug: Web/API/HTMLIFrameElement/sandbox
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.sandbox
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`sandbox`** của {{domxref("HTMLIFrameElement")}} trả về một đối tượng {{domxref("DOMTokenList")}} trực tiếp cho biết các hạn chế bổ sung đối với hành vi của nội dung lồng ghép. Nó phản ánh thuộc tính nội dung [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) của phần tử {{HTMLElement("iframe")}}.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `sandbox` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `sandbox`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}}, và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```html
<iframe
  id="el"
  title="example"
  src="https://example.com"
  sandbox="allow-same-origin allow-scripts"></iframe>
```

```js
const el = document.getElementById("el");
console.log(Array.from(el.sandbox)); // Output: ["allow-same-origin", "allow-scripts"]

el.sandbox = "";
console.log(Array.from(el.sandbox)); // Output: []
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
