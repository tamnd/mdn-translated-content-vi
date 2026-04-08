---
title: ::part()
slug: Web/CSS/Reference/Selectors/::part
page-type: css-pseudo-element
browser-compat: css.selectors.part
sidebar: cssref
---

Phần tử giả **`::part`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử nào trong [shadow tree](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) có thuộc tính [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part) khớp.

```css
custom-element::part(foo) {
  /* Styles to apply to the `foo` part */
}
```

## Mô tả

Thuộc tính toàn cục [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part) làm cho một phần tử shadow tree hiển thị với DOM cha của nó. Tên các phần được khai báo bằng thuộc tính `part` được dùng làm tham số của phần tử giả `::part()`. Theo cách này, bạn có thể áp dụng các kiểu CSS cho các phần tử trong shadow tree từ bên ngoài.

Tên phần tương tự như các lớp CSS: nhiều phần tử có thể có cùng tên phần, và một phần tử có thể có nhiều tên phần. Tất cả tên phần được dùng trong phần tử giả `::part()` đều phải có mặt trong giá trị `part` được khai báo trên phần tử shadow tree nhưng thứ tự của tên phần không quan trọng, tức là các bộ chọn `::part(tab active)` và `::part(active tab)` là như nhau.

Phần tử giả `::part()` chỉ hiển thị với DOM cha. Điều này có nghĩa là khi một shadow tree được lồng vào nhau, các phần không hiển thị với bất kỳ tổ tiên nào ngoài cha trực tiếp. Thuộc tính [`exportparts`](/en-US/docs/Web/HTML/Reference/Global_attributes/exportparts) giải quyết hạn chế này bằng cách xuất rõ ràng các tên `part` đã được định nghĩa, làm cho chúng có thể được tạo kiểu toàn cục.

[Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) (chẳng hạn như `::part(label):hover`) có thể được thêm vào bộ chọn `::part()`, nhưng [lớp giả cấu trúc](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#tree-structural_pseudo-classes) khớp dựa trên thông tin cây, chẳng hạn như `:empty` và `:last-child`, thì không thể thêm vào.

Các phần tử giả bổ sung, chẳng hạn như `::before`, có thể được thêm vào bộ chọn `::part()`, nhưng phần tử `::part()` bổ sung không thể được thêm vào. Ví dụ, `::part(confirm-button)::part(active)` không bao giờ khớp với bất kỳ thứ gì, tức là nó không giống với `::part(confirm-button active)`. Điều này là vì làm như vậy sẽ tiết lộ nhiều thông tin cấu trúc hơn dự định.

## Cú pháp

```css
::part(<ident>+) {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<template id="tabbed-custom-element">
  <style>
    *,
    ::before,
    ::after {
      box-sizing: border-box;
      padding: 1rem;
    }
    :host {
      display: flex;
    }
  </style>
  <div part="tab active">Tab A</div>
  <div part="tab">Tab B</div>
  <div part="tab">Tab C</div>
</template>

<tabbed-custom-element></tabbed-custom-element>
```

### CSS

```css
tabbed-custom-element::part(tab) {
  color: blue;
  border-bottom: transparent solid 4px;
}

tabbed-custom-element::part(tab):hover {
  background-color: black;
  color: white;
}

tabbed-custom-element::part(tab active) {
  border-color: blue !important;
}
```

### JavaScript

```js
const template = document.querySelector("#tabbed-custom-element");
globalThis.customElements.define(
  template.id,
  class extends HTMLElement {
    constructor() {
      super().attachShadow({ mode: "open" }).append(template.content);
    }
  },
);
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part)
- Hàm lớp giả {{CSSxRef(":state",":state()")}}
- Thuộc tính [`exportparts`](/en-US/docs/Web/HTML/Reference/Global_attributes/exportparts)
- Module [CSS shadow parts](/en-US/docs/Web/CSS/Guides/Shadow_parts)
