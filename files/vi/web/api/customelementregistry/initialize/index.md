---
title: "CustomElementRegistry: initialize() method"
short-title: initialize()
slug: Web/API/CustomElementRegistry/initialize
page-type: web-api-instance-method
browser-compat: api.CustomElementRegistry.initialize
---

{{APIRef("Web Components")}}

Phương thức **`initialize()`** của giao diện {{domxref("CustomElementRegistry")}} gắn registry này với một cây con DOM, đặt {{domxref("Element.customElementRegistry", "customElementRegistry")}} của từng hậu duệ bao hàm chưa có registry nào, và thử nâng cấp mọi [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) được tìm thấy.

## Cú pháp

```js-nolint
initialize(root)
```

### Tham số

- `root`
  - : Một đối tượng {{domxref("Node")}} (thường là {{domxref("Document")}}, {{domxref("ShadowRoot")}}, hoặc {{domxref("Element")}}) mà các hậu duệ bao hàm của nó sẽ được gắn với registry này.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Ném ra nếu `CustomElementRegistry` này không phải là scoped (tức là không được tạo bằng `new CustomElementRegistry()`) và `root` là một node {{domxref("Document")}} hoặc `Document` của node document của `root` có {{domxref("Document.customElementRegistry", "customElementRegistry")}} không phải là `CustomElementRegistry` này.

## Mô tả

Khi `initialize()` được gọi, nó sẽ duyệt qua các hậu duệ bao hàm của `root` theo thứ tự cây. Với mỗi phần tử (hoặc `Document`/`ShadowRoot` ở gốc) có `null` {{domxref("Element.customElementRegistry", "customElementRegistry")}}, nó đặt registry đó thành `CustomElementRegistry` này. Sau đó nó thử [nâng cấp](/en-US/docs/Web/API/CustomElementRegistry/upgrade) từng phần tử có `customElementRegistry` khớp với registry này.

Một khi `customElementRegistry` của một node đã được đặt thành một đối tượng `CustomElementRegistry`, nó không thể thay đổi được. Điều này có nghĩa là `initialize()` chỉ có thể đặt registry trên những node vẫn còn `null`. Tuy nhiên, nó vẫn sẽ cố [nâng cấp](/en-US/docs/Web/API/CustomElementRegistry/upgrade) bất kỳ phần tử nào có `customElementRegistry` đã khớp với registry này, không chỉ các phần tử vừa được gán.

Node có `customElementRegistry` là `null` trong một số trường hợp, bao gồm:

- Các tài liệu được tạo bởi {{domxref("DOMImplementation.createHTMLDocument()")}}, vốn có custom element registry mặc định là `null`. Các element được tạo trong những tài liệu như vậy cũng có registry là `null`.
- Các shadow root được tạo với `customElementRegistry` đặt thành `null` thông qua {{domxref("Element.attachShadow()")}}.
- Các shadow root khai báo được tạo từ phần tử {{HTMLElement("template")}} với thuộc tính `shadowrootcustomelementregistry`, thuộc tính này yêu cầu HTML parser để lại custom element registry của shadow root là `null`.

## Ví dụ

### Khởi tạo một shadow root với scoped registry

Ví dụ này tạo một shadow root không có custom element registry, thêm HTML chứa một custom element, rồi gọi `initialize()` để gắn một scoped registry. Element `<my-element>` sẽ được nâng cấp khi `initialize()` đặt registry trên shadow root và các hậu duệ của nó.

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

// Create the shadow DOM structure without a registry
const shadow = host.attachShadow({
  mode: "open",
  customElementRegistry: null,
});
shadow.innerHTML = "<my-element></my-element>";

// Later, associate the scoped registry and upgrade custom elements
myRegistry.initialize(shadow);

console.log(shadow.querySelector("my-element").textContent);
// "Hello from scoped registry!"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
- {{domxref("CustomElementRegistry.CustomElementRegistry()", "CustomElementRegistry()")}} constructor
- {{domxref("CustomElementRegistry.define()")}}
- {{domxref("CustomElementRegistry.upgrade()")}}
