---
title: "CustomElementRegistry: upgrade() method"
short-title: upgrade()
slug: Web/API/CustomElementRegistry/upgrade
page-type: web-api-instance-method
browser-compat: api.CustomElementRegistry.upgrade
---

{{APIRef("Web Components")}}

Phương thức **`upgrade()`** của giao diện {{domxref("CustomElementRegistry")}} nâng cấp tất cả các custom element có shadow trong một cây con {{domxref("Node")}}, ngay cả trước khi chúng được kết nối với tài liệu chính.

## Cú pháp

```js-nolint
upgrade(root)
```

### Tham số

- `root`
  - : Một thể hiện {{domxref("Node")}} có các phần tử hậu duệ chứa shadow cần nâng cấp. Nếu không có phần tử hậu duệ nào có thể được nâng cấp, sẽ không có lỗi nào bị ném ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Khi một phần tử HTML được phân tích cú pháp hoặc tạo ra, nó có thể dùng một tên thẻ tương ứng với một [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) (ví dụ, `<my-element>`). Nếu lớp của custom element đó chưa được đăng ký với {{domxref("CustomElementRegistry")}} phù hợp vào thời điểm phần tử được tạo, phần tử đó tồn tại như một {{domxref("HTMLElement")}} chưa được định nghĩa. Nó trông và hoạt động như một phần tử không xác định bình thường - không có hành vi đặc biệt, callback vòng đời, hay phương thức prototype tùy chỉnh.

**Nâng cấp** là quá trình chuyển đổi ngược một phần tử như vậy thành một custom element đầy đủ khi định nghĩa của nó trở nên sẵn có. Khi một phần tử được nâng cấp:

1. Prototype của nó được hoán đổi sang lớp custom element đã được đăng ký bằng {{domxref("CustomElementRegistry.define()", "define()")}}.
2. {{domxref("HTMLElement/connectedCallback", "connectedCallback()")}} của nó và mọi lifecycle callback khác áp dụng được sẽ được gọi.
3. Nếu lớp định nghĩa {{domxref("HTMLElement/observedAttributes", "observedAttributes")}}, thì {{domxref("HTMLElement/attributeChangedCallback", "attributeChangedCallback()")}} sẽ được gọi cho mỗi thuộc tính đã có giá trị.

Thông thường, các phần tử sẽ được nâng cấp tự động khi định nghĩa của chúng được đăng ký bằng `define()`, nhưng chỉ khi chúng đã được kết nối với tài liệu. Phương thức `upgrade()` hữu ích khi bạn cần nâng cấp các phần tử tồn tại trong một cây con DOM chưa được kết nối (ví dụ, phần tử được tạo qua {{domxref("Document.createElement()")}} hoặc được phân tích vào một {{domxref("DocumentFragment")}}) trước khi chúng được chèn vào tài liệu.

## Ví dụ

Lấy từ [đặc tả HTML](https://html.spec.whatwg.org/multipage/custom-elements.html#dom-customelementregistry-upgrade):

```js
const el = document.createElement("spider-man");

class SpiderMan extends HTMLElement {}
customElements.define("spider-man", SpiderMan);

console.assert(!(el instanceof SpiderMan)); // not yet upgraded

customElements.upgrade(el);
console.assert(el instanceof SpiderMan); // upgraded!
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
