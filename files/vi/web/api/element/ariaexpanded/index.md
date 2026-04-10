---
title: "Element: thuộc tính ariaExpanded"
short-title: ariaExpanded
slug: Web/API/Element/ariaExpanded
page-type: web-api-instance-property
browser-compat: api.Element.ariaExpanded
---

{{APIRef("DOM")}}

Thuộc tính **`ariaExpanded`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded), cho biết liệu một phần tử nhóm thuộc sở hữu hoặc được điều khiển bởi phần tử này có được mở rộng hay thu gọn.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử nhóm mà phần tử này sở hữu hoặc điều khiển đang được mở rộng.
- `"false"`
  - : Phần tử nhóm mà phần tử này sở hữu hoặc điều khiển đang bị thu gọn.
- `"undefined"`
  - : Phần tử không sở hữu hoặc điều khiển một phần tử nhóm có thể mở rộng.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-expanded` trên phần tử có ID `animal` được đặt thành "false". Sử dụng `ariaExpanded` chúng ta cập nhật giá trị thành "true".

```html
<div class="animals-combobox">
  <label for="animal">Animal</label>
  <input
    id="animal"
    type="text"
    role="combobox"
    aria-autocomplete="list"
    aria-expanded="false"
    aria-haspopup="true" />
  <button id="animals-button" tabindex="-1" aria-label="Open">▽</button>
  <ul id="animals-listbox" role="listbox" aria-label="Animals">
    <li id="animal-cat" role="option">Cat</li>
    <li id="animal-dog" role="option">Dog</li>
  </ul>
</div>
```

```js
let el = document.getElementById("animal");
console.log(el.ariaExpanded); // false
el.ariaExpanded = "true";
console.log(el.ariaExpanded); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
