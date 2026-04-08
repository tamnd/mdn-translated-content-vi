---
title: HTML is global attribute
short-title: is
slug: Web/HTML/Reference/Global_attributes/is
page-type: html-attribute
browser-compat: html.global_attributes.is
sidebar: htmlsidebar
---

> [!NOTE]
> [Safari không có kế hoạch hỗ trợ các phần tử tích hợp tùy chỉnh](https://github.com/WebKit/standards-positions/issues/97) và [các nhà cung cấp trình duyệt đang khám phá các giải pháp thay thế để tùy chỉnh các phần tử tích hợp](https://github.com/WICG/webcomponents/issues/1029). Xem phần [tương thích trình duyệt](#browser_compatibility) để biết thông tin hỗ trợ.

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`is`** cho phép bạn chỉ định rằng một phần tử HTML tiêu chuẩn nên hoạt động như một phần tử tích hợp tùy chỉnh đã được định nghĩa (xem [Sử dụng custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements) để biết thêm chi tiết).

Thuộc tính này chỉ có thể được sử dụng nếu tên custom element được chỉ định đã được [định nghĩa](/en-US/docs/Web/API/CustomElementRegistry/define) thành công trong tài liệu hiện tại, và mở rộng loại phần tử mà nó đang được áp dụng.

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [word-count-web-component](https://github.com/mdn/web-components-examples/tree/main/word-count-web-component) của chúng tôi ([xem trực tiếp tại đây](https://mdn.github.io/web-components-examples/word-count-web-component/)).

```js
// Create a class for the element
class WordCount extends HTMLParagraphElement {
  constructor() {
    // Always call super first in constructor
    super();

    // Constructor contents omitted for brevity
    // …
  }
}

// Define the new element
customElements.define("word-count", WordCount, { extends: "p" });
```

```html
<p is="word-count"></p>
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
