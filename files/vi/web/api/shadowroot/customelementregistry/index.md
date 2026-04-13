---
title: "ShadowRoot: thuộc tính customElementRegistry"
short-title: customElementRegistry
slug: Web/API/ShadowRoot/customElementRegistry
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.customElementRegistry
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`customElementRegistry`** của giao diện {{domxref("ShadowRoot")}} trả về đối tượng {{domxref("CustomElementRegistry")}} liên kết với shadow root này, hoặc `null` nếu chưa được đặt.

`customElementRegistry` của một shadow root xác định các định nghĩa [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) nào sẽ được dùng để nâng cấp các phần tử bên trong cây shadow đó. Nó có thể được đặt khi shadow root được tạo thông qua tùy chọn `customElementRegistry` của {{domxref("Element.attachShadow()")}}, hoặc sau đó bằng {{domxref("CustomElementRegistry.initialize()")}}. Một khi đã được đặt thành đối tượng `CustomElementRegistry`, nó không thể thay đổi.

Thuộc tính này cũng khả dụng trên các đối tượng {{domxref("Document")}} thông qua cùng tên thuộc tính {{domxref("Document/customElementRegistry","customElementRegistry")}}.

## Giá trị

Một đối tượng {{domxref("CustomElementRegistry")}}, hoặc `null`.

## Ví dụ

### Đặt registry có phạm vi trên một shadow root

Ví dụ này tạo một scoped registry với một định nghĩa custom element và truyền nó vào {{domxref("Element.attachShadow()")}}. Thuộc tính `customElementRegistry` trên shadow root kết quả phản ánh scoped registry đó.

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

console.log(shadow.customElementRegistry === myRegistry); // true
console.log(shadow.querySelector("my-element").textContent);
// "Hello from scoped registry!"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.customElementRegistry")}}
- {{domxref("Element.customElementRegistry")}}
- {{domxref("CustomElementRegistry")}}
- {{domxref("CustomElementRegistry.CustomElementRegistry()", "CustomElementRegistry()")}} constructor
- {{domxref("Element.attachShadow()")}}
- [Using custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
- [Using shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
