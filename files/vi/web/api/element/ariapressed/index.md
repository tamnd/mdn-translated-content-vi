---
title: "Element: thuộc tính ariaPressed"
short-title: ariaPressed
slug: Web/API/Element/ariaPressed
page-type: web-api-instance-property
browser-compat: api.Element.ariaPressed
---

{{APIRef("DOM")}}

Thuộc tính **`ariaPressed`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed), cho biết trạng thái "đã nhấn" hiện tại của nút bật/tắt.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("input")}} với `type="button"` hoặc phần tử {{htmlelement("button")}} vì chúng có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử đang được nhấn.
- `"false"`
  - : Phần tử hỗ trợ được nhấn nhưng hiện tại chưa được nhấn.
- `"mixed"`
  - : Cho biết giá trị chế độ hỗn hợp cho nút bật/t tắt ba trạng thái.
- `"undefined"`
  - : Phần tử không hỗ trợ được nhấn.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-pressed` trên phần tử có ID `saveChanges` được đặt thành "false" cho biết đầu vào này hiện đang không được nhấn. Sử dụng `ariaPressed` chúng ta cập nhật giá trị thành "true".

```html
<div id="saveChanges" tabindex="0" role="button" aria-pressed="false">Save</div>
```

```js
let el = document.getElementById("saveChanges");
console.log(el.ariaPressed); // "false"
el.ariaPressed = "true";
console.log(el.ariaPressed); // "true"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò button](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role)
