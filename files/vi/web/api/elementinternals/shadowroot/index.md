---
title: "ElementInternals: shadowRoot property"
short-title: shadowRoot
slug: Web/API/ElementInternals/shadowRoot
page-type: web-api-instance-property
browser-compat: api.ElementInternals.shadowRoot
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`shadowRoot`** của giao diện {{domxref("ElementInternals")}} trả về {{domxref("ShadowRoot")}} cho phần tử này.

## Giá trị

Một {{domxref("ShadowRoot")}} nếu phần tử có shadow root, ngược lại là `null`.

## Ví dụ

Ví dụ sau in giá trị của `shadowRoot` ra console, ngay sau khi gọi {{domxref("HTMLElement.attachInternals()")}}. Tại thời điểm này, giá trị là `null`. Sau khi gọi {{domxref("Element.attachShadow()")}}, phần tử có Shadow Root và `shadowRoot` trả về đối tượng đại diện cho nó.

```js
class MyCustomElement extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();

    console.log(this.internals_.shadowRoot); // null

    this.attachShadow({ mode: "open" });

    console.log(this.internals_.shadowRoot); // a ShadowRoot object
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
