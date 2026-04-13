---
title: "MathMLElement: thuộc tính attributeStyleMap"
short-title: attributeStyleMap
slug: Web/API/MathMLElement/attributeStyleMap
page-type: web-api-instance-property
browser-compat: api.MathMLElement.attributeStyleMap
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`attributeStyleMap`** của giao diện {{domxref("MathMLElement")}} trả về một đối tượng {{domxref("StylePropertyMap")}} trực tiếp chứa danh sách các thuộc tính kiểu của phần tử được định nghĩa trong thuộc tính `style` nội tuyến của phần tử, hoặc được gán bằng thuộc tính {{domxref("MathMLElement.style", "style")}} của giao diện {{domxref("MathMLElement")}} thông qua script.

Thuộc tính viết tắt được mở rộng. Nếu bạn đặt `border-top: 1px solid black`, các thuộc tính dài ({{cssxref("border-top-color")}}, {{cssxref("border-top-style")}}, và {{cssxref("border-top-width")}}) được đặt thay thế.

Sự khác biệt chính giữa thuộc tính {{domxref("MathMLElement.style", "style")}} và thuộc tính `attributeStyleMap` là thuộc tính `style` trả về đối tượng {{domxref("CSSStyleDeclaration")}}, trong khi thuộc tính `attributeStyleMap` trả về đối tượng {{domxref("StylePropertyMap")}}.

Mặc dù thuộc tính này không thể ghi, bạn có thể đọc và ghi các kiểu nội tuyến thông qua đối tượng {{domxref("StylePropertyMap")}} mà nó trả về, giống như thông qua đối tượng {{domxref("CSSStyleDeclaration")}} được trả về qua thuộc tính `style`.

## Giá trị

Một đối tượng {{domxref("StylePropertyMap")}} trực tiếp.

## Ví dụ

Đoạn mã sau đây cho thấy mối quan hệ giữa thuộc tính `style` và thuộc tính `attributeStyleMap`:

```html
<math>
  <mrow>
    <mi>f</mi>
    <mo stretchy="false">(</mo>
    <mi id="el" style="border-top: 1px solid blue; color: red;">x</mi>
    <mo stretchy="false">)</mo>
    <mo>=</mo>
    <mi>x</mi>
  </mrow>
</math>
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

- {{domxref("MathMLElement.style")}}
- {{domxref("HTMLElement.attributeStyleMap")}}
- {{domxref("SVGElement.attributeStyleMap")}}
