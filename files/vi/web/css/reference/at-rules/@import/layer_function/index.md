---
title: layer()
slug: Web/CSS/Reference/At-rules/@import/layer_function
page-type: css-function
browser-compat: css.at-rules.import.layer
sidebar: cssref
---

Hàm **`layer()`** [CSS](/en-US/docs/Web/CSS) [function](/en-US/docs/Web/CSS/Reference/Values/Functions) được dùng cùng với at-rule {{cssxref("@import")}} để đặt tài nguyên được nhập vào một [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) được đặt tên riêng biệt.

## Cú pháp

```css
@import url layer(layer-name);
@import "dark.css" layer(framework.themes.dark);
```

`framework.themes.dark` là layer mà file CSS sẽ được nhập vào.

## Cú pháp chính thức

{{CSSSyntaxRaw(`layer() = layer( <layer-name> )`)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("@import")}}
- [CSS at-rule functions](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
