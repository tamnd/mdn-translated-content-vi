---
title: "CustomElementRegistry: CustomElementRegistry() constructor"
short-title: CustomElementRegistry()
slug: Web/API/CustomElementRegistry/CustomElementRegistry
page-type: web-api-constructor
browser-compat: api.CustomElementRegistry.CustomElementRegistry
---

{{APIRef("Web Components")}}

Hàm tạo **`CustomElementRegistry()`** tạo ra một đối tượng {{domxref("CustomElementRegistry")}} mới để dùng trong phạm vi cục bộ.

Hàm tạo này được dùng đặc biệt để tạo các scoped registry giới hạn các định nghĩa [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) trong một phạm vi cụ thể, chẳng hạn như một phần tử hoặc {{domxref("ShadowRoot")}}.

> [!NOTE]
> Đối tượng `CustomElementRegistry` toàn cục gắn với một {{domxref("Window")}} không được tạo bằng hàm tạo này; nó được tạo tự động khi cửa sổ được thiết lập, và có thể truy cập qua thuộc tính {{domxref("window.customElements")}}.

## Cú pháp

```js-nolint
new CustomElementRegistry()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("CustomElementRegistry")}} mới.

## Mô tả

Khi bạn tạo `CustomElementRegistry` bằng `new CustomElementRegistry()`, registry thu được được xem là _scoped_. Điều này có nghĩa là:

- Các định nghĩa custom element được thêm vào bằng {{domxref("CustomElementRegistry.define", "define()")}} không khả dụng toàn cục. Chúng chỉ áp dụng cho các node đã được gắn với registry này.
- Nó không hỗ trợ tùy chọn `extends` trong `define()` (để tạo [customized built-in element](/en-US/docs/Web/API/Web_components/Using_custom_elements#types_of_custom_element)). Việc cố dùng `extends` với scoped registry sẽ ném ra `NotSupportedError` {{domxref("DOMException")}}.

Để gắn một scoped registry với một cây con DOM, bạn có thể dùng phương thức {{domxref("CustomElementRegistry.initialize()", "initialize()")}}, truyền nó vào {{domxref("Element.attachShadow()")}}, hoặc dùng tùy chọn `customElementRegistry` của phương thức {{domxref("Document.createElement()")}}.

## Ví dụ

### Tạo một scoped custom element registry

Ví dụ này tạo một scoped registry, định nghĩa một custom element trên đó, và truyền registry cho {{domxref("Element.attachShadow()")}}. Khi HTML chứa `<my-element>` được thêm vào shadow root, element sẽ được nâng cấp bằng định nghĩa của scoped registry.

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

console.log(shadow.querySelector("my-element").textContent);
// "Hello from scoped registry!"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
- {{domxref("CustomElementRegistry.initialize()")}}
- {{domxref("CustomElementRegistry.define()")}}
