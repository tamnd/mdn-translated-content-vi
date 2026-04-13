---
title: "SVGElement: thuộc tính attributeStyleMap"
short-title: attributeStyleMap
slug: Web/API/SVGElement/attributeStyleMap
page-type: web-api-instance-property
browser-compat: api.SVGElement.attributeStyleMap
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`attributeStyleMap`** của giao diện {{domxref("SVGElement")}} trả về một đối tượng {{domxref("StylePropertyMap")}} trực tiếp chứa danh sách các thuộc tính style của phần tử được định nghĩa trong thuộc tính `style` nội tuyến của phần tử, hoặc được gán bằng thuộc tính {{domxref("SVGElement.style", "style")}} của giao diện {{domxref("SVGElement")}} qua script.

Các thuộc tính viết tắt được mở rộng. Nếu bạn đặt `border-top: 1px solid black`, các thuộc tính dài ({{cssxref("border-top-color")}}, {{cssxref("border-top-style")}}, và {{cssxref("border-top-width")}}) sẽ được đặt thay thế.

Sự khác biệt chính giữa thuộc tính {{domxref("SVGElement.style", "style")}} và thuộc tính `attributeStyleMap` là: thuộc tính `style` trả về đối tượng {{domxref("CSSStyleDeclaration")}}, trong khi thuộc tính `attributeStyleMap` trả về đối tượng {{domxref("StylePropertyMap")}}.

Mặc dù bản thân thuộc tính này không thể ghi, bạn vẫn có thể đọc và ghi style nội tuyến thông qua đối tượng {{domxref("StylePropertyMap")}} mà nó trả về, giống như thông qua đối tượng {{domxref("CSSStyleDeclaration")}} trả về qua thuộc tính `style`.

## Giá trị

Một đối tượng {{domxref("StylePropertyMap")}} trực tiếp.

## Ví dụ

Đoạn code sau minh họa mối quan hệ giữa thuộc tính `style` và thuộc tính `attributeStyleMap`:

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 250 250"
  width="250"
  height="250">
  <circle
    cx="100"
    cy="100"
    r="50"
    id="el"
    style="border-top: 1px solid blue; color: red;" />
</svg>
<div id="output"></div>
```

```css
#el {
  font-size: 16px;
}

#output {
  white-space: pre-line;
}
```

```js
const element = document.getElementById("el");
const output = document.getElementById("output");

for (const property of element.attributeStyleMap) {
  output.textContent += `${property[0]} = ${property[1][0].toString()}\n`;
}
```

{{EmbedLiveSample("Examples", "200", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGElement.style")}}
- {{domxref("HTMLElement.attributeStyleMap")}}
- {{domxref("MathMLElement.attributeStyleMap")}}
