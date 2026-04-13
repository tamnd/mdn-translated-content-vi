---
title: "CustomElementRegistry: getName() method"
short-title: getName()
slug: Web/API/CustomElementRegistry/getName
page-type: web-api-instance-method
browser-compat: api.CustomElementRegistry.getName
---

{{APIRef("Web Components")}}

Phương thức **`getName()`** của giao diện {{domxref("CustomElementRegistry")}} trả về tên cho một custom element đã được định nghĩa trước đó.

## Cú pháp

```js-nolint
getName(constructor)
```

### Tham số

- `constructor`
  - : Constructor cho custom element.

### Giá trị trả về

Tên của custom element đã được định nghĩa trước đó, hoặc `null` nếu không có custom element nào được định nghĩa với constructor đó.

## Ví dụ

```js
class MyParagraph extends HTMLElement {
  constructor() {
    const template = document.getElementById("custom-paragraph");
    super() // returns element this scope
      .attachShadow({ mode: "open" }) // sets AND returns this.shadowRoot
      .append(document.importNode(template.content, true));
  }
}

customElements.define("my-paragraph", MyParagraph);

// Return a reference to the my-paragraph constructor
customElements.getName(MyParagraph) === "my-paragraph";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
