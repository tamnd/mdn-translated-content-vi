---
title: scroll-initial-target
slug: Web/CSS/Reference/Properties/scroll-initial-target
page-type: css-property
status:
  - experimental
browser-compat: css.properties.scroll-initial-target
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`scroll-initial-target`** trong [CSS](/en-US/docs/Web/CSS) cho phép xác định các phần tử là mục tiêu snap tiềm năng khi {{glossary("scroll container")}} tổ tiên của chúng được hiển thị lần đầu tiên.

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-initial-target: none;
scroll-initial-target: nearest;

/* Giá trị toàn cục */
scroll-initial-target: inherit;
scroll-initial-target: initial;
scroll-initial-target: revert;
scroll-initial-target: revert-layer;
scroll-initial-target: unset;
```

### Giá trị

- `none`
  - : Phần tử không phải là mục tiêu cuộn ban đầu.
- `nearest`
  - : Phần tử có khả năng là mục tiêu cuộn ban đầu cho scroll container tổ tiên gần nhất của nó.

## Mô tả

Thuộc tính `scroll-initial-target` cho phép xác định các phần tử cần được snap khi {{glossary("scroll snap")}} container cha của chúng được hiển thị lần đầu tiên. Đặt giá trị thành `nearest` xác định phần tử như một mục tiêu tiềm năng cần được snap khi scroll container tổ tiên gần nhất xuất hiện lần đầu trên trang.

Nếu nhiều phần tử hoặc phần tử giả trong scroll container được đặt thành `nearest`, phần tử đầu tiên theo thứ tự cây là mục tiêu scroll-snapping ban đầu.

Giá trị khởi tạo là `none`, nghĩa là phần tử có thể scroll-snap mặc định không phải là mục tiêu cuộn ban đầu. Giá trị `none` cũng có thể được đặt trên một phần tử để rõ ràng khiến nó không là mục tiêu cuộn ban đầu.

Nếu vị trí cuộn ban đầu của scroll container có khả năng được đặt bởi cả thuộc tính phân phối nội dung {{cssxref("place-content")}} và bởi `scroll-initial-target` trên bất kỳ phần tử con nào — phần tử con đầu tiên có `scroll-initial-target: nearest` sẽ thắng.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng `scroll-initial-target`

Ví dụ dưới đây minh họa hai giá trị của `scroll-initial-target` và cách phần tử đầu tiên có `scroll-initial-target` được snap.

#### HTML

Chúng ta bao gồm 5 container, có đoạn văn giải thích hiệu ứng mong đợi đứng trước.

```html
<p><code>none</code> on #4 only</p>
<div class="none">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div class="set">4</div>
  <div>5</div>
</div>

<p><code>nearest</code> on #4 only</p>
<div class="nearest">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div class="set">4</div>
  <div>5</div>
</div>

<p><code>nearest</code> on even elements</p>
<div class="nearest">
  <div>1</div>
  <div class="set">2</div>
  <div>3</div>
  <div class="set">4</div>
  <div>5</div>
</div>

<p><code>nearest</code> on odd elements</p>
<div class="nearest">
  <div class="set">1</div>
  <div>2</div>
  <div class="set">3</div>
  <div>4</div>
  <div class="set">5</div>
</div>

<p><code>nearest</code> on odd elements, with <code>none</code> on #1</p>
<div class="nearest">
  <div class="set unset">1</div>
  <div>2</div>
  <div class="set">3</div>
  <div>4</div>
  <div class="set">5</div>
</div>
```

#### CSS

Chúng ta thiết lập các phần tử nearest và none làm scroll-snap container, căn giữa các phần tử được snap.

```css
/* mandatory scroll-snap on parent */
div.nearest,
div.none {
  scroll-snap-type: x mandatory;
}

/* scroll-snap alignment for children */
div > div {
  scroll-snap-align: center;
  scroll-initial-target: always;
}
```

Chúng ta sau đó đặt `scroll-initial-target` là `none` hoặc `nearest` cho tất cả các phần tử có lớp `.set`.

```css
.none .set,
.nearest .set.unset {
  scroll-initial-target: none;
}
.nearest .set {
  scroll-initial-target: nearest;
}
```

```css hidden
/* setup */
body {
  height: 100%;
  display: flex;
  align-items: center;
  flex-flow: column nowrap;
  font-family: sans-serif;
  text-align: center;
}

div.nearest,
div.none {
  display: flex;
  overflow: auto;
  font-size: 3rem;
}

div div {
  width: 90%;
  min-width: 15rem;
  flex: none;
  outline: 1px solid #333333;
}

/* coloration */
div > div:nth-child(even) {
  background-color: #87ea87;
}

div > div:nth-child(odd) {
  background-color: #87ccea;
}

p {
  margin: 1em 0 0;
}

@supports not (scroll-initial-target: nearest) {
  body::before {
    content: "Your browser doesn't support the scroll-initial-target property.";
    background-color: wheat;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1em;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Using scroll-initial-target", "100%", "500")}}

Hiệu ứng của thuộc tính được thể hiện khi scroll-snap container được vẽ lên trang.

Mỗi hàng snap đến phần tử đầu tiên có `nearest` được đặt, nếu có, theo thứ tự cây. Trong ví dụ cuối, chúng ta đã ghi đè giá trị `nearest` bằng `none` trên phần tử đầu tiên, vì vậy phần tử đầu tiên có `nearest` được áp dụng là #3.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
