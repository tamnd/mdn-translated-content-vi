---
title: "ElementInternals: ariaBrailleRoleDescription property"
short-title: ariaBrailleRoleDescription
slug: Web/API/ElementInternals/ariaBrailleRoleDescription
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaBrailleRoleDescription
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaBrailleRoleDescription`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription), xác định mô tả vai trò ARIA chữ nổi của phần tử.

Thuộc tính này có thể được sử dụng để cung cấp phiên bản viết tắt của giá trị [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription).
Nó chỉ nên được sử dụng khi `aria-roledescription` có mặt và trong trường hợp hiếm gặp khi nó quá dài cho chữ nổi.
Thuộc tính [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription) chứa thông tin bổ sung về thời điểm nên đặt thuộc tính này.

## Giá trị

Một chuỗi được dùng để chuyển đổi thành chữ nổi.

## Ví dụ

Giả sử chúng ta có một phần tử slide tùy chỉnh:

```js
class CustomSlide extends HTMLElement {
  constructor() {
    super();
    this._internals = this.attachInternals();
    this._internals.role = "slide";
  }

  // …
}

customElements.define("custom-slide", CustomSlide);
```

Chúng ta có thể lấy và đặt giá trị `aria-brailleroledescription` của phần tử tùy chỉnh:

```js
const customEl = document.querySelector("custom-slide");
log(customEl.ariaBrailleRoleDescription);
customEl.ariaBrailleRoleDescription = "sd";
log(customEl.ariaBrailleRoleDescription);
```

### Kết quả

{{EmbedLiveSample("Getting and setting ariaBrailleRoleDescription")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Xem thêm

- [ARIA roles](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)
