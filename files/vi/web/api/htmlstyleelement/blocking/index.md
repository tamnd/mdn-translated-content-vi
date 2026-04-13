---
title: "HTMLStyleElement: thuộc tính blocking"
short-title: blocking
slug: Web/API/HTMLStyleElement/blocking
page-type: web-api-instance-property
browser-compat: api.HTMLStyleElement.blocking
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`blocking`** của {{domxref("HTMLStyleElement")}} trả về một đối tượng {{domxref("DOMTokenList")}} trực tiếp chứa các thao tác sẽ bị chặn khi tải tài nguyên bên ngoài. Nó phản ánh thuộc tính nội dung [`blocking`](/en-US/docs/Web/HTML/Reference/Elements/style#blocking) của phần tử {{HTMLElement("style")}}.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `blocking` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán cho thuộc tính `blocking` trực tiếp, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}} và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```html
<style id="el" blocking="render">
  p {
    color: blue;
  }
</style>
```

```js
const el = document.getElementById("el");
console.log(el.blocking); // Kết quả: DOMTokenList ["render"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.blocking")}}
- {{domxref("HTMLScriptElement.blocking")}}
