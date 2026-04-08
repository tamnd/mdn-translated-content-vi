---
title: :nth-of-type()
slug: Web/CSS/Reference/Selectors/:nth-of-type
page-type: css-pseudo-class
browser-compat: css.selectors.nth-of-type
sidebar: cssref
---

**`:nth-of-type()`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) khớp các phần tử dựa trên vị trí của chúng trong số các phần tử anh chị em cùng loại (tên thẻ).

{{InteractiveExample("CSS Demo: :nth-of-type", "tabbed-shorter")}}

```css interactive-example
dt {
  font-weight: bold;
}

dd {
  margin: 3px;
}

dd:nth-of-type(even) {
  border: 2px solid orange;
}
```

```html interactive-example
<dl>
  <dt>Vegetables:</dt>
  <dd>1. Tomatoes</dd>
  <dd>2. Cucumbers</dd>
  <dd>3. Mushrooms</dd>
  <dt>Fruits:</dt>
  <dd>4. Apples</dd>
  <dd>5. Mangos</dd>
  <dd>6. Pears</dd>
  <dd>7. Oranges</dd>
</dl>
```

## Cú pháp

```css-nolint
:nth-of-type(<An+B> | even | odd) {
  /* ... */
}
```

### Tham số

Lớp giả `:nth-of-type()` nhận một đối số duy nhất, đại diện cho mẫu khớp các phần tử.

Xem {{Cssxref(":nth-child")}} để có giải thích chi tiết hơn về cú pháp.

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<div>
  <div>This element isn't counted.</div>
  <p>1st paragraph.</p>
  <p class="fancy">2nd paragraph.</p>
  <div>This element isn't counted.</div>
  <p class="fancy">3rd paragraph.</p>
  <p>4th paragraph.</p>
</div>
```

#### CSS

```css
/* Odd paragraphs */
p:nth-of-type(2n + 1) {
  color: red;
}

/* Even paragraphs */
p:nth-of-type(2n) {
  color: blue;
}

/* First paragraph */
p:nth-of-type(1) {
  font-weight: bold;
}

/* This will match the 3rd paragraph as it will match elements which are 2n+1 AND have a class of fancy.
The second paragraph has a class of fancy but is not matched as it is not :nth-of-type(2n+1) */
p.fancy:nth-of-type(2n + 1) {
  text-decoration: underline;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_example', 250, 250)}}

> [!NOTE]
> Không có cách nào để chọn phần tử thứ n theo lớp bằng bộ chọn này. Bộ chọn chỉ xem xét loại phần tử khi tạo danh sách kết quả khớp. Tuy nhiên, bạn có thể áp dụng CSS cho một phần tử dựa trên vị trí `:nth-of-type` **và** một lớp, như minh họa trong ví dụ trên.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref(":nth-child")}}, {{Cssxref(":nth-last-of-type")}}
