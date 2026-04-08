---
title: Column combinator
slug: Web/CSS/Reference/Selectors/Column_combinator
page-type: css-combinator
status:
  - experimental
spec-urls: https://drafts.csswg.org/selectors/#selectordef-column
sidebar: cssref
---

{{SeeCompatTable}}

**Bộ kết hợp cột** (`||`) được đặt giữa hai bộ chọn CSS. Nó chỉ khớp những phần tử khớp với bộ chọn thứ hai mà thuộc về các phần tử cột được bộ chọn đầu tiên chọn.

```css
/* Table cells that belong to the "selected" column */
col.selected||td {
  background: gray;
}
```

## Cú pháp

```css-nolint
/* The white space around the || combinator is optional but recommended. */
column-selector || cell-selector {
  /* style properties */
}
```

## Ví dụ

### HTML

```html
<table border="1">
  <colgroup>
    <col span="2" />
    <col class="selected" />
  </colgroup>
  <tbody>
    <tr>
      <td>A</td>
      <td>B</td>
      <td>C</td>
    </tr>

    <tr>
      <td colspan="2">D</td>
      <td>E</td>
    </tr>
    <tr>
      <td>F</td>
      <td colspan="2">G</td>
    </tr>
  </tbody>
</table>
```

### CSS

```css
col.selected||td {
  background: gray;
  color: white;
  font-weight: bold;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- {{HTMLElement("col")}}
- {{HTMLElement("colgroup")}}
- {{CSSxRef("grid")}}
- {{CSSxRef(":nth-of-type")}}
- {{CSSxRef(":nth-last-of-type")}}
- Mô-đun [Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
