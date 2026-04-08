---
title: sibling-count()
slug: Web/CSS/Reference/Values/sibling-count
page-type: css-function
browser-compat: css.types.sibling-count
sidebar: cssref
---

Hàm **`sibling-count()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) trả về một số nguyên đại diện cho tổng số phần tử DOM anh em (con trực tiếp của cha) của phần tử mà nó được sử dụng, bao gồm chính nó.

> [!NOTE]
> Hàm {{CSSxRef("counter()")}} cung cấp kết quả tương tự nhưng trả về `<string>` (phù hợp hơn cho [nội dung được tạo](/vi/docs/Web/CSS/Guides/Generated_content)), trong khi `sibling-count()` trả về `<integer>` (có thể dùng cho các phép tính).

## Cú pháp

```css-nolint
sibling-count()
```

### Tham số

Hàm `sibling-count()` không chấp nhận tham số.

### Giá trị trả về

Một số nguyên; tổng số phần tử DOM anh em bao gồm chính phần tử đó.

## Ví dụ

### Số cột động

Ví dụ này minh họa cách đặt chiều rộng của mỗi mục trong danh sách dựa trên số lượng mục, cho phép đặt mỗi con trong cột riêng của nó.

#### HTML

Chúng ta bao gồm một vùng chứa {{htmlelement("ul")}} và một số phần tử con {{htmlelement("li")}}.

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
</ul>
```

#### CSS

Chúng ta chia {{CSSxRef("width")}} của mỗi mục danh sách cho số lượng con trực tiếp mà danh sách chứa. Chúng ta cũng đặt mỗi phần tử lẻ có {{CSSxRef("background-color")}} để minh họa rõ hơn hiệu ứng kết quả.

```css
ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  text-align: center;
  display: flex;
}

li {
  width: calc(100% / sibling-count());
}

li:nth-of-type(odd) {
  background-color: rgb(0 0 0 / 0.05);
}
```

#### Kết quả

{{EmbedLiveSample("Dynamic column count", "300", "80")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sibling-index()")}}
- {{CSSxRef("calc")}}
