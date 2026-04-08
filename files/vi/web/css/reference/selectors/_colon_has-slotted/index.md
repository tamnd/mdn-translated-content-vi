---
title: :has-slotted
slug: Web/CSS/Reference/Selectors/:has-slotted
page-type: css-pseudo-class
browser-compat: css.selectors.has-slotted
sidebar: cssref
---

**`:has-slotted`** là [lớp giả (pseudo-class)](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS), khớp khi nội dung của một phần tử {{HTMLElement("slot")}} không rỗng hoặc không sử dụng giá trị mặc định (xem [Using templates and slots](/en-US/docs/Web/API/Web_components/Using_templates_and_slots) để biết thêm thông tin).

> [!NOTE]
> Ngay cả một nút văn bản khoảng trắng duy nhất cũng đủ để làm cho `:has-slotted` áp dụng.

Lớp giả này chỉ hoạt động khi được sử dụng bên trong CSS đặt trong một [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM).

```css
/* Selects the content of a <slot> element that has content that is not default  */
:has-slotted {
  color: green;
}

/* Selects the content of a <slot> element that has no content or default  */
:not(:has-slotted) {
  color: red;
}
```

## Cú pháp

```css-nolint
:has-slotted {
  /* ... */
}
```

## Ví dụ

Ví dụ này có hai phần tử `<slot>`, một phần tử đã được gán nội dung và phần tử còn lại thì chưa.

### HTML

```html
<p>
  <template shadowrootmode="open">
    <style>
      :has-slotted {
        color: rebeccapurple;
      }
    </style>
    <slot name="one">Placeholder 1</slot>
    <slot name="two">Placeholder 2</slot>
  </template>
  <span slot="one">Slotted content</span>
</p>
```

### Kết quả

Phần tử `<slot>` đã được gán nội dung khớp với lớp giả `:has-slotted` và có giá trị `color` là `rebeccapurple` được áp dụng.

{{EmbedLiveSample("simple_example",100,70)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("template")}}
- Phần tử HTML {{HTMLElement("slot")}}
- {{CSSXRef("::slotted")}}
