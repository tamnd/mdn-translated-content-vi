---
title: "CustomElementRegistry: get() method"
short-title: get()
slug: Web/API/CustomElementRegistry/get
page-type: web-api-instance-method
browser-compat: api.CustomElementRegistry.get
---

{{APIRef("Web Components")}}

Phương thức **`get()`** của giao diện {{domxref("CustomElementRegistry")}} trả về constructor cho một custom element đã được định nghĩa trước đó.

## Cú pháp

```js-nolint
get(name)
```

### Tham số

- `name`
  - : Tên của custom element.

### Giá trị trả về

Constructor cho custom element có tên đã cho, hoặc {{jsxref("undefined")}} nếu không có custom element nào được định nghĩa với tên đó.

## Ví dụ

```js
customElements.define(
  "my-paragraph",
  class extends HTMLElement {
    constructor() {
      const template = document.getElementById("custom-paragraph");
      super() // returns element this scope
        .attachShadow({ mode: "open" }) // sets AND returns this.shadowRoot
        .append(document.importNode(template.content, true));
    }
  },
);

// Return a reference to the my-paragraph constructor
const ctor = customElements.get("my-paragraph");
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
