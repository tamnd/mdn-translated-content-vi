---
title: "Element: customElementRegistry property"
short-title: customElementRegistry
slug: Web/API/Element/customElementRegistry
page-type: web-api-instance-property
browser-compat: api.Element.customElementRegistry
---

{{APIRef("Web Components")}}

Thuộc tính **`customElementRegistry`** là thuộc tính chỉ đọc of the {{domxref("Element")}} interface trả về the {{domxref("CustomElementRegistry")}} object associated with this element, or `null` if one has not been set.

An element's `customElementRegistry` is set when the element is created (for example, via {{domxref("Document.createElement()")}} with the `customElementRegistry` option, or when parsed in a context that has a scoped registry). Once set to a `CustomElementRegistry` object, it cannot be changed. The registry determines which [custom element](/en-US/docs/Web/API/Web_components/Sử dụng_custom_elements) definitions are used when the element is [upgraded](/en-US/docs/Web/API/CustomElementRegistry/upgrade).

## Giá trị

Một {{domxref("CustomElementRegistry")}} object, or `null`.

## Ví dụ

### Accessing an element's custom element registry

Ví dụ này creates a scoped registry, attaches it to a shadow root, and then reads back the `customElementRegistry` property from an element inside the shadow tree to confirm it matches the scoped registry.

```js
const myRegistry = new CustomElementRegistry();
myRegistry.define(
  "my-element",
  class extends HTMLElement {
    connectedCallback() {
      this.textContent = "Hello from scoped registry!";
    }
  },
);

const host = document.createElement("div");
document.body.appendChild(host);
const shadow = host.attachShadow({
  mode: "open",
  customElementRegistry: myRegistry,
});
shadow.innerHTML = "<my-element></my-element>";

const el = shadow.querySelector("my-element");
console.log(el.customElementRegistry === myRegistry); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Document.customElementRegistry")}}
- {{domxref("ShadowRoot.customElementRegistry")}}
- {{domxref("CustomElementRegistry")}}
- [Sử dụng custom elements](/en-US/docs/Web/API/Web_components/Sử dụng_custom_elements)
