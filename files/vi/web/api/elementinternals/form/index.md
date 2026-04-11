---
title: "ElementInternals: form property"
short-title: form
slug: Web/API/ElementInternals/form
page-type: web-api-instance-property
browser-compat: api.ElementInternals.form
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`form`** của giao diện {{domxref("ElementInternals")}} trả về {{domxref("HTMLFormElement")}} được liên kết với phần tử này.

## Giá trị

Một {{domxref("HTMLFormElement")}}.

## Ví dụ

Ví dụ sau đây hiển thị một thành phần hộp kiểm tùy chỉnh bên trong biểu mẫu có ID là `myForm`.
In `form.length` ra console sẽ cho chúng ta giá trị của {{domxref("HTMLFormElement.length")}}.

```html
<form id="myForm">
  <custom-checkbox id="custom-checkbox"></custom-checkbox>
  <custom-label for="custom-checkbox">Join newsletter</custom-label>
</form>
```

```js
class CustomCheckbox extends HTMLElement {
  static formAssociated = true;
  #internals;

  constructor() {
    super();
    this.#internals = this.attachInternals();
  }

  connectedCallback() {
    console.log(this.#internals.form.length);
  }
}

window.customElements.define("custom-checkbox", CustomCheckbox);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
