---
title: "ElementInternals: willValidate property"
short-title: willValidate
slug: Web/API/ElementInternals/willValidate
page-type: web-api-instance-property
browser-compat: api.ElementInternals.willValidate
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`willValidate`** của giao diện {{domxref("ElementInternals")}} trả về `true` nếu phần tử là phần tử có thể gửi và là ứng viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).

Các phần tử bị loại khỏi danh sách ứng viên xác thực ràng buộc bao gồm các phần tử có thuộc tính: `disabled`, `hidden` hoặc `readonly`, các phần tử input có `type=button` hoặc `type=reset`, hoặc bất kỳ phần tử nào là phần tử {{htmlelement("datalist")}} hoặc có phần tử tổ tiên `<datalist>`.

## Giá trị

`true` nếu phần tử là ứng viên xác thực ràng buộc, ngược lại là `false`.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phần tử không có thuộc tính `formAssociated` được đặt thành `true`.

## Ví dụ

Ví dụ sau hiển thị một thành phần hộp kiểm tùy chỉnh với `formAssociated` được đặt thành `true`, giá trị của `willValidate` được ghi ra console.

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
console.log(element.internals_.willValidate); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
