---
title: "Element: thuộc tính ariaDisabled"
short-title: ariaDisabled
slug: Web/API/Element/ariaDisabled
page-type: web-api-instance-property
browser-compat: api.Element.ariaDisabled
---

{{APIRef("DOM")}}

Thuộc tính **`ariaDisabled`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled), cho biết phần tử có thể nhận biết nhưng bị vô hiệu hóa, vì vậy nó không thể chỉnh sửa hoặc hoạt động khác.

> [!NOTE]
> Khi có thể, hãy sử dụng phần tử {{htmlelement("input")}} với `type="button"` hoặc phần tử {{htmlelement("button")}} — vì những phần tử này có ngữ nghĩa tích hợp sẵn và không yêu cầu thuộc tính ARIA.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử và tất cả các hậu duệ có thể lấy tiêu điểm đều bị vô hiệu hóa, nhưng vẫn có thể nhận biết, và giá trị của chúng không thể thay đổi bởi người dùng.
- `"false"`
  - : Phần tử được kích hoạt.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-disabled` trên phần tử có ID `saveChanges` được đặt thành "true" cho biết đầu vào này hiện đang bị vô hiệu hóa. Sử dụng `ariaDisabled` chúng ta cập nhật giá trị thành "false".

```html
<div id="saveChanges" tabindex="0" role="button" aria-disabled="true">Save</div>
```

```js
let el = document.getElementById("saveChanges");
console.log(el.ariaDisabled); // "true"
el.ariaDisabled = "false";
console.log(el.ariaDisabled); // "false"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
