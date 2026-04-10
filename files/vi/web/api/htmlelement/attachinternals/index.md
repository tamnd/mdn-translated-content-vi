---
title: "HTMLElement: phương thức attachInternals()"
short-title: attachInternals()
slug: Web/API/HTMLElement/attachInternals
page-type: web-api-instance-method
browser-compat: api.HTMLElement.attachInternals
---

{{APIRef("Web Components")}}

Phương thức **`HTMLElement.attachInternals()`** trả về một đối tượng {{domxref("ElementInternals")}}.
Phương thức này cho phép một [phần tử tùy chỉnh](/en-US/docs/Web/API/Web_components/Using_custom_elements) tham gia vào các biểu mẫu HTML. Giao diện `ElementInternals` cung cấp các tiện ích để làm việc với các phần tử này theo cách tương tự như khi làm việc với bất kỳ phần tử biểu mẫu HTML tiêu chuẩn nào, đồng thời cũng hiển thị [Accessibility Object Model](https://wicg.github.io/aom/explainer.html) (Mô hình đối tượng khả năng tiếp cận) cho phần tử.

## Cú pháp

```js-nolint
attachInternals()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("ElementInternals")}}.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phần tử không phải là phần tử tùy chỉnh.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu tính năng "internals" bị vô hiệu hóa như một phần của định nghĩa phần tử.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phương thức này được gọi hai lần trên cùng một phần tử.

## Ví dụ

Ví dụ sau minh họa cách tạo một phần tử biểu mẫu tùy chỉnh liên kết với `HTMLElement.attachInternals`. Thuộc tính {{domxref("ElementInternals.form")}} sau đó được in ra console để minh họa rằng chúng ta có một đối tượng {{domxref("ElementInternals")}}.

```js
class CustomCheckbox extends HTMLElement {
  static formAssociated = true;

  constructor() {
    super();
    this.internals_ = this.attachInternals();
  }
  // …
}

window.customElements.define("custom-checkbox", CustomCheckbox);

let element = document.getElementById("custom-checkbox");
console.log(element.internals_.form);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [More capable form controls](https://web.dev/articles/more-capable-form-controls)
- [Creating custom form controls with ElementInternals](https://css-tricks.com/creating-custom-form-controls-with-elementinternals/)
