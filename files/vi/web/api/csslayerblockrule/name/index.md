---
title: "CSSLayerBlockRule: thuộc tính name"
short-title: name
slug: Web/API/CSSLayerBlockRule/name
page-type: web-api-instance-property
browser-compat: api.CSSLayerBlockRule.name
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("CSSLayerBlockRule")}} đại diện cho tên của lớp cascade liên quan.

## Giá trị

Một chuỗi chứa tên của lớp, hoặc `""` nếu lớp là ẩn danh.

## Ví dụ

### HTML

```html
<output></output> <output></output>
```

### CSS

```css
output {
  display: block;
}

@layer special {
  div {
    color: rebeccapurple;
  }
}

@layer {
  div {
    color: black;
  }
}
```

### JavaScript

```js
const item1 = document.getElementsByTagName("output")[0];
const item2 = document.getElementsByTagName("output")[1];
const rules = document.getElementById("css-output").sheet.cssRules;

const layer = rules[1]; // A CSSLayerBlockRule
const anonymous = rules[2]; // An anonymous CSSLayerBlockRule

item1.textContent = `The first CSSLayerBlockRule defines the "${layer.name}" layer.`;
item2.textContent = `A second CSSLayerBlockRule defines a layer with the following name: "${anonymous.name}".`;
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Khai báo câu lệnh của một {{cssxref("@layer")}} được đại diện bởi {{domxref("CSSLayerStatementRule")}}.
- Cách [tạo cascade layers có tên](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers#creating_cascade_layers) trong CSS.
