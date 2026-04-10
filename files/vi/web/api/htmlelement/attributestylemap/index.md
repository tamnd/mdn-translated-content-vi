---
title: "HTMLElement: thuộc tính attributeStyleMap"
short-title: attributeStyleMap
slug: Web/API/HTMLElement/attributeStyleMap
page-type: web-api-instance-property
browser-compat: api.HTMLElement.attributeStyleMap
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`attributeStyleMap`** của giao diện {{domxref("HTMLElement")}} trả về một đối tượng {{domxref("StylePropertyMap")}} trực tiếp chứa danh sách các thuộc tính kiểu của phần tử được định nghĩa trong thuộc tính `style` nội tuyến của phần tử, hoặc được gán bằng thuộc tính {{domxref("HTMLElement.style", "style")}} của giao diện {{domxref("HTMLElement")}} thông qua script.

Các thuộc tính shorthand được mở rộng. Nếu bạn đặt `border-top: 1px solid black`, các thuộc tính dài ({{cssxref("border-top-color")}}, {{cssxref("border-top-style")}}, và {{cssxref("border-top-width")}}) sẽ được đặt thay thế.

Sự khác biệt chính giữa thuộc tính {{domxref("HTMLElement.style", "style")}} và thuộc tính `attributeStyleMap` là thuộc tính `style` sẽ trả về một đối tượng {{domxref("CSSStyleDeclaration")}}, trong khi thuộc tính `attributeStyleMap` sẽ trả về một đối tượng {{domxref("StylePropertyMap")}}.

Mặc dù bản thân thuộc tính này không thể ghi được, bạn có thể đọc và ghi các kiểu nội tuyến thông qua đối tượng {{domxref("StylePropertyMap")}} mà nó trả về, giống như thông qua đối tượng {{domxref("CSSStyleDeclaration")}} được trả về qua thuộc tính `style`.

## Giá trị

Một đối tượng {{domxref("StylePropertyMap")}} trực tiếp.

## Ví dụ

Đoạn mã sau đây thể hiện mối quan hệ giữa thuộc tính `style` và thuộc tính `attributeStyleMap`:

```html
<div id="el" style="border-top: 1px solid blue; color: red;">
  Một phần tử ví dụ
</div>
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.style")}}
- {{domxref("SVGElement.attributeStyleMap")}}
- {{domxref("MathMLElement.attributeStyleMap")}}
