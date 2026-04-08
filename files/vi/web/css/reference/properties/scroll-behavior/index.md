---
title: scroll-behavior
slug: Web/CSS/Reference/Properties/scroll-behavior
page-type: css-property
browser-compat: css.properties.scroll-behavior
sidebar: cssref
---

Thuộc tính **`scroll-behavior`** trong [CSS](/en-US/docs/Web/CSS) đặt hành vi cuộn cho một hộp cuộn khi cuộn được kích hoạt bởi điều hướng hoặc các API cuộn CSSOM.

{{InteractiveExample("CSS Demo: scroll-behavior")}}

```css interactive-example-choice
scroll-behavior: auto;
```

```css interactive-example-choice
scroll-behavior: smooth;
```

```html interactive-example
<section id="default-example">
  <div class="container">
    <p class="nav">
      Scroll to:
      <a href="#pageA">A</a>
      <a href="#pageB">B</a>
      <a href="#pageC">C</a>
    </p>
    <scroll-container id="example-element">
      <scroll-page id="pageA">A</scroll-page>
      <scroll-page id="pageB">B</scroll-page>
      <scroll-page id="pageC">C</scroll-page>
    </scroll-container>
  </div>
</section>
```

```css interactive-example
.container {
  flex-direction: column;
}

.nav a {
  color: #009e5f;
}

scroll-container {
  border: 1px solid black;
  display: block;
  height: 200px;
  overflow-y: scroll;
  width: 200px;
}

scroll-page {
  align-items: center;
  display: flex;
  font-size: 5em;
  height: 100%;
  justify-content: center;
}
```

Lưu ý rằng các lần cuộn khác, chẳng hạn như những lần do người dùng thực hiện, không bị ảnh hưởng bởi thuộc tính này. Khi thuộc tính này được chỉ định trên phần tử gốc, nó áp dụng cho khung nhìn (viewport). Thuộc tính được chỉ định trên phần tử `body` sẽ _không_ được kế thừa sang khung nhìn.

Các user agent được phép bỏ qua thuộc tính này.

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-behavior: auto;
scroll-behavior: smooth;

/* Giá trị toàn cục */
scroll-behavior: inherit;
scroll-behavior: initial;
scroll-behavior: revert;
scroll-behavior: revert-layer;
scroll-behavior: unset;
```

Thuộc tính `scroll-behavior` được chỉ định là một trong các giá trị từ khóa được liệt kê dưới đây.

### Giá trị

- `auto`
  - : Hộp cuộn cuộn ngay lập tức.
- `smooth`
  - : Hộp cuộn cuộn theo kiểu mượt mà bằng cách sử dụng hàm easing do user agent xác định trong khoảng thời gian do user agent xác định. Các user agent nên tuân theo các quy ước nền tảng, nếu có.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt hành vi cuộn mượt mà

#### HTML

```html
<nav>
  <a href="#page-1">1</a>
  <a href="#page-2">2</a>
  <a href="#page-3">3</a>
</nav>
<div class="scroll-container">
  <div class="scroll-page" id="page-1">1</div>
  <div class="scroll-page" id="page-2">2</div>
  <div class="scroll-page" id="page-3">3</div>
</div>
```

#### CSS

```css
a {
  display: inline-block;
  width: 50px;
  text-decoration: none;
}
nav,
.scroll-container {
  display: block;
  margin: 0 auto;
  text-align: center;
}
nav {
  width: 339px;
  padding: 5px;
  border: 1px solid black;
}
.scroll-container {
  width: 350px;
  height: 200px;
  overflow-y: scroll;
  scroll-behavior: smooth;
}
.scroll-page {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  font-size: 5em;
}
```

#### Kết quả

{{ EmbedLiveSample("Setting_smooth_scroll_behavior", "100%", 250) }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
