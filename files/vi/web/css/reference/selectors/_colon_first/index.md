---
title: :first
slug: Web/CSS/Reference/Selectors/:first
page-type: css-pseudo-class
browser-compat: css.selectors.first
sidebar: cssref
---

**`:first`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS), được sử dụng với [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@page")}}, đại diện cho trang đầu tiên của tài liệu được in. (Xem {{cssxref(":first-child")}} để biết về phần tử đầu tiên nói chung của một nút.)

```css
/* Chọn trang đầu tiên khi in */
@page :first {
  margin-left: 50%;
  margin-top: 50%;
}
```

> [!NOTE]
> Bạn không thể thay đổi tất cả các thuộc tính CSS với lớp giả này. Bạn chỉ có thể thay đổi lề, {{cssxref("orphans")}}, {{cssxref("widows")}}, và ngắt trang của tài liệu. Hơn nữa, bạn chỉ có thể sử dụng các đơn vị [độ dài tuyệt đối](/en-US/docs/Web/CSS/Reference/Values/length#absolute_length_units) khi định nghĩa lề. Tất cả các thuộc tính khác sẽ bị bỏ qua.

## Cú pháp

```css
:first {
  /* ... */
}
```

## Ví dụ

### Sử dụng `:first` cho kiểu dáng in trang

Nhấn nút "Print!" để in ví dụ. Các từ trên trang đầu tiên sẽ xuất hiện ở đâu đó gần trung tâm, trong khi các trang khác sẽ có nội dung ở vị trí mặc định:

```html live-sample___colon-first
<p>First Page.</p>
<p>Second Page.</p>
<button>Print!</button>
```

```css live-sample___colon-first
@page :first {
  size: 8.5in 11in;
  margin-left: 3in;
  margin-top: 5in;
}

p {
  page-break-after: always;
  font: 1.2em sans-serif;
}
```

```js live-sample___colon-first
document.querySelector("button").addEventListener("click", () => {
  window.print();
});
```

{{EmbedLiveSample('colon-first', '100%', , , , , , "allow-modals")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("@page")}}
- Các lớp giả liên quan đến trang khác: {{Cssxref(":left")}}, {{Cssxref(":right")}}
