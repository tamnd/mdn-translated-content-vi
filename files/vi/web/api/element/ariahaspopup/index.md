---
title: "Element: thuộc tính ariaHasPopup"
short-title: ariaHasPopup
slug: Web/API/Element/ariaHasPopup
page-type: web-api-instance-property
browser-compat: api.Element.ariaHasPopup
---

{{APIRef("DOM")}}

Thuộc tính **`ariaHasPopup`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup), cho biết sự sẵn có và kiểu của phần tử popup tương tác, chẳng hạn như menu hoặc dialog, có thể được kích hoạt bởi một phần tử.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"false"`
  - : Phần tử không có popup.
- `"true"`
  - : Phần tử có một popup là menu.
- `"menu"`
  - : Phần tử có một popup là menu.
- `"listbox"`
  - : Phần tử có một popup là listbox.
- `"tree"`
  - : Phần tử có một popup là tree.
- `"grid"`
  - : Phần tử có một popup là grid.
- `"dialog"`
  - : Phần tử có một popup là dialog.

> [!WARNING]
> Lưu ý rằng hỗ trợ cho các giá trị `aria-haspopup` khác nhau có thể thay đổi tùy thuộc vào phần tử mà thuộc tính được chỉ định. Đảm bảo rằng khi sử dụng `aria-haspopup`, nó được thực hiện theo đặc tả kỹ thuật ARIA, và nó hoạt động như mong đợi khi kiểm tra với trình duyệt và công nghệ hỗ trợ cần thiết.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-haspopup` trên phần tử có ID `animal` được đặt thành `"true"`. Sử dụng `ariaHasPopup`, chúng ta cập nhật giá trị thành `"listbox"`, đây là giá trị dự kiến cho một combobox gọi popup `listbox`.

```html
<div class="animals-combobox">
  <label for="animal">Animal</label>
  <input
    id="animal"
    type="text"
    role="combobox"
    aria-autocomplete="list"
    aria-controls="animals-listbox"
    aria-activedescendant=""
    aria-expanded="false"
    aria-haspopup="true" />
  <ul id="animals-listbox" role="listbox" aria-label="Animals">
    <li id="animal-cat" role="option">Cat</li>
    <li id="animal-dog" role="option">Dog</li>
  </ul>
</div>
```

```js
let el = document.getElementById("animal");
console.log(el.ariaHasPopup); // true
el.ariaHasPopup = "listbox";
console.log(el.ariaHasPopup); // listbox
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
