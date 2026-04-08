---
title: CSS nesting at-rules
short-title: Nesting at-rules
slug: Web/CSS/Guides/Nesting/At-rules
page-type: guide
sidebar: cssref
---

Bất kỳ [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) nào có phần thân chứa các quy tắc style đều có thể được lồng bên trong một quy tắc style khác bằng cách sử dụng CSS nesting. Các quy tắc style được lồng bên trong at-rule lấy định nghĩa nesting selector từ quy tắc style tổ tiên gần nhất. Các thuộc tính có thể được đưa trực tiếp vào bên trong một at-rule lồng, hoạt động như thể chúng được lồng trong một khối `& {...}`.

## Các at-rule có thể được lồng

- {{cssxref('@media')}}
- {{cssxref('@supports')}}
- {{cssxref('@layer')}}
- {{cssxref('@scope')}}
- {{cssxref('@container')}}
- {{cssxref('@starting-style')}}

## Ví dụ

### Lồng at-rule `@media`

Trong ví dụ này, ta thấy ba khối CSS. Khối đầu tiên cho thấy cách viết at-rule nesting thông thường, khối thứ hai là cách viết mở rộng như trình duyệt phân tích cú pháp, và khối thứ ba là tương đương không lồng.

#### CSS lồng

```css
.foo {
  display: grid;
  @media (orientation: landscape) {
    grid-auto-flow: column;
  }
}
```

#### CSS lồng mở rộng

```css
.foo {
  display: grid;
  @media (orientation: landscape) {
    & {
      grid-auto-flow: column;
    }
  }
}
```

#### Tương đương không lồng

```css
.foo {
  display: grid;
}

@media (orientation: landscape) {
  .foo {
    grid-auto-flow: column;
  }
}
```

### Nhiều at-rule `@media` lồng nhau

Các at-rule có thể được lồng trong các at-rule khác. Dưới đây là ví dụ về điều này và cách viết tương đương không lồng.

#### At-rule lồng nhau

```css
.foo {
  display: grid;
  @media (orientation: landscape) {
    grid-auto-flow: column;
    @media (width >= 1024px) {
      max-inline-size: 1024px;
    }
  }
}
```

#### Tương đương không lồng

```css
.foo {
  display: grid;
}
@media (orientation: landscape) {
  .foo {
    grid-auto-flow: column;
  }
}
@media (orientation: landscape) and (width >= 1024px) {
  .foo {
    max-inline-size: 1024px;
  }
}
```

### Lồng Cascade Layer (`@layer`)

[Cascade Layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) có thể được lồng để [tạo child layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer#nesting_layers). Chúng được kết hợp bằng dấu `.` (chấm).

#### Định nghĩa layer cha & con

Ta bắt đầu bằng cách định nghĩa các named cascade layer trước khi sử dụng, mà không gán bất kỳ quy tắc style nào.

```css
@layer base {
  @layer support;
}
```

#### Gán quy tắc vào layer bằng nesting

Ở đây, selector `.foo` gán các quy tắc của nó vào `@layer` **base**. `@layer` **support** lồng vào tạo ra sub-layer `base.support`, và nesting selector `&` được dùng để tạo quy tắc cho selector `.foo .bar`.

```css
.foo {
  @layer base {
    block-size: 100%;
    @layer support {
      & .bar {
        min-block-size: 100%;
      }
    }
  }
}
```

#### Tương đương không lồng

```css
@layer base {
  .foo {
    block-size: 100%;
  }
}
@layer base.support {
  .foo .bar {
    min-block-size: 100%;
  }
}
```

## Xem thêm

- Module [CSS Nesting](/en-US/docs/Web/CSS/Guides/Nesting)
- [Nesting selector `&`](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector)
- [Sử dụng CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting/Using)
- [Nesting và specificity](/en-US/docs/Web/CSS/Guides/Nesting/Nesting_and_specificity)
- [Lồng container query](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#nested_queries)
