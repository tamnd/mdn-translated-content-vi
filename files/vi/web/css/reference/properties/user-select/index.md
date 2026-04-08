---
title: user-select
slug: Web/CSS/Reference/Properties/user-select
page-type: css-property
browser-compat: css.properties.user-select
sidebar: cssref
---

Thuộc tính **`user-select`** của [CSS](/vi/docs/Web/CSS) kiểm soát liệu người dùng có thể chọn văn bản hay không. Điều này không có tác dụng đối với nội dung được tải như một phần của giao diện người dùng trình duyệt ({{Glossary("Chrome", "chrome")}}), ngoại trừ trong các hộp văn bản.

{{InteractiveExample("CSS Demo: user-select")}}

```css interactive-example-choice
user-select: none;
```

```css interactive-example-choice
user-select: text;
```

```css interactive-example-choice
user-select: all;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">Thử chọn văn bản này</p>
</section>
```

```css interactive-example
#example-element {
  font-size: 1.5rem;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
user-select: none;
user-select: auto;
user-select: text;
user-select: all;

/* Giá trị toàn cục */
user-select: inherit;
user-select: initial;
user-select: revert;
user-select: revert-layer;
user-select: unset;
```

> [!NOTE]
> `user-select` không phải là thuộc tính kế thừa, mặc dù giá trị ban đầu `auto` làm cho nó hoạt động như thể nó được kế thừa hầu hết thời gian. Các trình duyệt dựa trên WebKit/Chromium _có_ triển khai thuộc tính này như là được kế thừa, điều này vi phạm hành vi được mô tả trong đặc tả, và điều này sẽ gây ra một số vấn đề. Cho đến nay, Chromium đã chọn [sửa các vấn đề](https://chromium.googlesource.com/chromium/src/+/b01af0b296ecb855aac95c4ed335d188e6eac2de) để làm cho hành vi cuối cùng đáp ứng các đặc tả.

### Giá trị

- `none`
  - : Văn bản của phần tử và các phần tử con của nó không thể chọn được. Lưu ý rằng đối tượng {{domxref("Selection")}} có thể chứa các phần tử này.
- `auto`
  - : Giá trị được dùng của `auto` được xác định như sau:
    - Trên các phần tử giả `::before` và `::after`, giá trị được dùng là `none`
    - Nếu giá trị được dùng của `user-select` trên phần tử cha là `none`, giá trị được dùng là `none`
    - Ngược lại, nếu giá trị được dùng của `user-select` trên phần tử cha là `all`, giá trị được dùng là `all`
    - Ngược lại, giá trị được dùng là `text`

- `text`
  - : Văn bản có thể được người dùng chọn.
- `all`
  - : Nội dung của phần tử sẽ được chọn nguyên tử: Nếu một vùng chọn sẽ chứa một phần của phần tử, thì vùng chọn phải chứa toàn bộ phần tử bao gồm tất cả các phần tử con của nó. Nếu nhấp đúp hoặc nhấp chuột phải xảy ra trong các phần tử con, phần tử tổ tiên cao nhất có giá trị này sẽ được chọn.

> [!NOTE]
> Module [CSS basic user interface](/vi/docs/Web/CSS/Guides/Basic_user_interface) xác định giá trị `contain` cho thuộc tính `user-select` để cho phép vùng chọn bắt đầu trong phần tử được giới hạn bởi ranh giới của phần tử đó, tuy nhiên điều này không được hỗ trợ trong bất kỳ trình duyệt nào.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<p>Bạn có thể chọn văn bản này.</p>
<p class="unselectable">Này, bạn không thể chọn văn bản này!</p>
<p class="all">Nhấp một lần sẽ chọn tất cả văn bản này.</p>
```

### CSS

```css
.unselectable {
  -webkit-user-select: none; /* Safari */
  user-select: none;
}

.all {
  -webkit-user-select: all;
  user-select: all;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("::selection")}} phần tử giả
- Đối tượng JavaScript {{domxref("Selection")}}
