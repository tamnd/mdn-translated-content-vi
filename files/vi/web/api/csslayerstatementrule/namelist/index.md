---
title: "CSSLayerStatementRule: nameList property"
short-title: nameList
slug: Web/API/CSSLayerStatementRule/nameList
page-type: web-api-instance-property
browser-compat: api.CSSLayerStatementRule.nameList
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`nameList`** của giao diện {{DOMxRef("CSSLayerStatementRule")}} trả về danh sách tên lớp cascade liên quan. Tên không thể được sửa đổi.

## Giá trị

Một {{jsxref("Array")}} các chuỗi, mỗi chuỗi đại diện cho một lớp cascade được biểu diễn bởi quy tắc câu lệnh {{cssxref("@layer")}}.

## Ví dụ

### HTML

```html
<div></div>
```

### CSS

```css
@layer layerName, layerName2;

@layer layerName3 {
  div {
    font-family: serif;
  }
}
```

### JavaScript

```js
const item = document.getElementsByTagName("div")[0];
const rules = document.getElementById("css-output").sheet.cssRules;

const layerStatementRule = rules[0]; // A CSSLayerStatementRule
const layerBlockRule = rules[1]; // A CSSLayerBlockRule; no nameList property.

item.textContent = `@layer declares the following layers: ${layer.nameList.join(
  ", ",
)}.`;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXRef("CSSLayerBlockRule.name")}}
- {{CSSXref("@layer")}}
- [Câu lệnh at-rule `@layer` cho các lớp được đặt tên](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers#the_layer_statement_at-rule_for_named_layers)
