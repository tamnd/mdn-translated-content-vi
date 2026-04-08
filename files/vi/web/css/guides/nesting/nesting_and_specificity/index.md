---
title: CSS nesting and specificity
short-title: Nesting and specificity
slug: Web/CSS/Guides/Nesting/Nesting_and_specificity
page-type: guide
sidebar: cssref
---

[Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) của nesting selector `&` được tính toán dựa trên specificity lớn nhất trong danh sách selector liên quan. Điều này giống hệt cách specificity được tính khi sử dụng hàm {{cssxref(':is',':is()')}}.

```html
<b class="foo">
  <i>Blue text</i>
</b>
```

## Cú pháp nesting `&`

```css-nolint
#a, b {
  & i {
    color: blue;
  }
}

.foo i {
  color: red;
}
```

## Cú pháp `:is()`

```css
:is(#a, b) {
  & i {
    color: blue;
  }
}

.foo i {
  color: red;
}
```

Trong ví dụ này, id selector (`#a`) có specificity là [`1-0-0`](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#selector_weight_categories), trong khi type selector (`b`) có specificity là `0-0-1`. [Nesting selector `&`](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector) và pseudo-class `:is()` đều nhận specificity là `1-0-0`, dù id selector `#a` không bao giờ được sử dụng.

Class selector `.foo` có specificity là `0-1-0`. Điều này làm cho tổng specificity của `& i` là `1-0-1` và của `.foo i` là `0-1-1`, nghĩa là `color: blue;` sẽ thắng.

## Xem thêm

- Module [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting)
- [Nesting selector `&`](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector)
- [Sử dụng CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting/Using)
- [Lồng at-rule](/en-US/docs/Web/CSS/Guides/Nesting/At-rules)
