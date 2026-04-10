---
title: "Element: thuộc tính ariaChecked"
short-title: ariaChecked
slug: Web/API/Element/ariaChecked
page-type: web-api-instance-property
browser-compat: api.Element.ariaChecked
---

{{APIRef("DOM")}}

Thuộc tính **`ariaChecked`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked), cho biết trạng thái "đã chọn" hiện tại của checkbox, radio button và các widget khác có trạng thái chọn.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử HTML {{htmlelement("input")}} với `type="checkbox"` vì phần tử này có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử đã được chọn.
- `"mixed"`
  - : Cho biết giá trị chế độ hỗn hợp cho checkbox hoặc menuitemcheckbox ba trạng thái.
- `"false"`
  - : Phần tử hỗ trợ được chọn nhưng hiện tại chưa được chọn.
- `"undefined"`
  - : Phần tử không hỗ trợ được chọn.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-checked` trên phần tử có ID `checkBoxInput` được đặt thành "false" cho biết đầu vào này hiện đang bỏ chọn. Sử dụng `ariaChecked` chúng ta cập nhật giá trị thành "true".

```html
<span
  role="checkbox"
  id="checkBoxInput"
  aria-checked="false"
  tabindex="0"
  aria-labelledby="chk1-label">
</span>
<label id="chk1-label">Remember my preferences</label>
```

```js
let el = document.getElementById("checkBoxInput");
console.log(el.ariaChecked); // "false"
el.ariaChecked = "true";
console.log(el.ariaChecked); // "true"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: vai trò checkbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
