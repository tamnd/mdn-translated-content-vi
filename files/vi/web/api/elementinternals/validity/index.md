---
title: "ElementInternals: validity property"
short-title: validity
slug: Web/API/ElementInternals/validity
page-type: web-api-instance-property
browser-compat: api.ElementInternals.validity
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`validity`** của giao diện {{domxref("ElementInternals")}} trả về đối tượng {{domxref("ValidityState")}} đại diện cho các trạng thái tính hợp lệ khác nhau mà phần tử có thể có, liên quan đến xác thực ràng buộc.

## Giá trị

Một đối tượng {{domxref("ValidityState")}}.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phần tử không có thuộc tính `formAssociated` được đặt thành `true`.

## Ví dụ

Ví dụ sau hiển thị một thành phần hộp kiểm tùy chỉnh với `formAssociated` được đặt thành `true`, giá trị của `validity.valid` được ghi ra console.

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
console.log(element.internals_.validity.valid);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
