---
title: ::target-text
slug: Web/CSS/Reference/Selectors/::target-text
page-type: css-pseudo-element
browser-compat: css.selectors.target-text
sidebar: cssref
---

Phần tử giả **`::target-text`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho văn bản đã được cuộn đến nếu trình duyệt hỗ trợ [phân mảnh văn bản](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments). Nó cho phép các tác giả lựa chọn cách làm nổi bật phần văn bản đó.

Phần tử giả `::target-text` tuân theo mô hình kế thừa đặc biệt chung cho tất cả các phần tử giả highlight. Để biết thêm chi tiết về cách kế thừa này hoạt động, xem phần [Kế thừa của các phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements_inheritance).

## Cú pháp

```css
::target-text {
  /* ... */
}
```

## Ví dụ

### Làm nổi bật phân mảnh văn bản

```css
::target-text {
  background-color: rebeccapurple;
  color: white;
}
```

Để xem CSS này trong thực tế, hãy theo liên kết đến [bản demo scroll-to-text](https://mdn.github.io/css-examples/target-text/index.html#:~:text=From%20the%20foregoing%20remarks%20we%20may%20gather%20an%20idea%20of%20the%20importance).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Phân mảnh văn bản](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments)
- {{cssxref(":target")}} (để làm nổi bật các phần tử mục tiêu)
