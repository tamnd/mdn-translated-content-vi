---
title: :link
slug: Web/CSS/Reference/Selectors/:link
page-type: css-pseudo-class
browser-compat: css.selectors.link
sidebar: cssref
---

Lớp giả **`:link`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) đại diện cho một phần tử chưa được truy cập. Nó khớp với mọi phần tử {{HTMLElement("a")}} hoặc {{HTMLElement("area")}} chưa được truy cập có thuộc tính `href`.

{{InteractiveExample("CSS Demo: :link", "tabbed-shorter")}}

```css interactive-example
p {
  font-weight: bold;
}

a:link {
  color: forestgreen;
  text-decoration-color: hotpink;
}
```

```html interactive-example
<p>Pages that you might have visited:</p>
<ul>
  <li>
    <a href="https://developer.mozilla.org">MDN Web Docs</a>
  </li>
  <li>
    <a href="https://www.youtube.com/">YouTube</a>
  </li>
</ul>
<p>Pages unlikely to be in your history:</p>
<ul>
  <li>
    <a href="https://developer.mozilla.org/missing-2">Random MDN page</a>
  </li>
  <li>
    <a href="https://example.com/missing-2">Random Example page</a>
  </li>
</ul>
```

Các kiểu được định nghĩa bởi lớp giả `:link` và {{cssxref(":visited")}} có thể bị ghi đè bởi bất kỳ lớp giả hành động người dùng nào tiếp theo ({{cssxref(":hover")}} hoặc {{cssxref(":active")}}) có độ đặc hiệu ít nhất bằng nhau. Để tạo kiểu liên kết phù hợp, hãy đặt quy tắc `:link` trước tất cả các quy tắc liên quan đến liên kết khác, theo thứ tự _LVHA_: `:link` — `:visited` — `:hover` — `:active`. Lớp giả `:visited` và lớp giả `:link` loại trừ lẫn nhau.

> [!NOTE]
> Sử dụng {{cssxref(":any-link")}} để chọn một phần tử bất kể nó đã được truy cập hay chưa.

## Cú pháp

```css
:link {
  /* ... */
}
```

## Ví dụ

Theo mặc định, hầu hết các trình duyệt áp dụng giá trị {{cssxref("color")}} đặc biệt cho các liên kết đã truy cập. Do đó, các liên kết trong ví dụ này sẽ có màu chữ đặc biệt chỉ trước khi bạn truy cập chúng. (Sau đó, bạn cần xóa lịch sử trình duyệt để xem chúng lại.) Tuy nhiên, các giá trị {{cssxref("background-color")}} có thể vẫn còn, vì hầu hết các trình duyệt không đặt thuộc tính đó cho các liên kết đã truy cập theo mặc định.

### HTML

```html
<a href="#ordinary-target">This is an ordinary link.</a><br />
<a href="">You've already visited this link.</a><br />
<a>Placeholder link (won't get styled)</a>
```

### CSS

```css
a:link {
  background-color: gold;
  color: green;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các lớp giả liên quan đến liên kết: {{ cssxref(":visited") }}, {{ cssxref(":hover") }}, {{ cssxref(":active") }}
