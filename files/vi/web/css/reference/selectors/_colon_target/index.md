---
title: :target
slug: Web/CSS/Reference/Selectors/:target
page-type: css-pseudo-class
browser-compat: css.selectors.target
sidebar: cssref
---

**`:target`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) chọn _phần tử mục tiêu của tài liệu_. Khi tài liệu được tải, phần tử mục tiêu được xác định bằng [định danh đoạn URL](/en-US/docs/Web/URI/Reference/Fragment#fragment) của tài liệu.

```css
/* Chọn phần tử mục tiêu của tài liệu */
:target {
  border: 2px solid black;
}
```

Ví dụ: URL sau có một định danh đoạn (được biểu thị bằng ký hiệu _#_) đánh dấu phần tử có [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) là `setup` làm phần tử mục tiêu của tài liệu:

```url
http://www.example.com/help/#setup
```

Phần tử sau sẽ được chọn bởi bộ chọn `:target` khi URL hiện tại bằng URL trên:

```html
<section id="setup">Installation instructions</section>
```

## Cú pháp

```css
:target {
  /* ... */
}
```

## Mô tả

Khi một tài liệu HTML được tải, trình duyệt sẽ đặt phần tử mục tiêu của nó. Phần tử được xác định bằng định danh đoạn URL. Nếu không có định danh đoạn URL, tài liệu sẽ không có phần tử mục tiêu. Lớp giả `:target` cho phép tạo kiểu cho phần tử mục tiêu của tài liệu. Phần tử có thể được focus, tô sáng, tạo hiệu ứng hoạt hình, v.v.

Phần tử mục tiêu được đặt khi tải tài liệu và khi gọi các phương thức [`history.back()`](/en-US/docs/Web/API/History/back), [`history.forward()`](/en-US/docs/Web/API/History/forward), và [`history.go()`](/en-US/docs/Web/API/History/forward). Nhưng nó _không_ thay đổi khi các phương thức [`history.pushState()`](/en-US/docs/Web/API/History/pushState) và [`history.replaceState()`](/en-US/docs/Web/API/History/replaceState) được gọi.

> [!NOTE]
> Do [một lỗi có thể có trong đặc tả CSS](https://discourse.wicg.io/t/target-css-does-not-work-because-shadowroot-does-not-set-a-target-element/2070/), `:target` không hoạt động bên trong [web component](/en-US/docs/Web/API/Web_components) vì [shadow root](/en-US/docs/Web/API/ShadowRoot) không truyền phần tử mục tiêu xuống shadow tree.

## Ví dụ

### Mục lục

Lớp giả `:target` có thể được dùng để tô sáng phần của trang đã được liên kết từ mục lục.

#### HTML

```html
<h3>Table of Contents</h3>
<ol>
  <li><a href="#p1">Jump to the first paragraph!</a></li>
  <li><a href="#p2">Jump to the second paragraph!</a></li>
  <li>
    <a href="#nowhere">
      This link goes nowhere, because the target doesn't exist.
    </a>
  </li>
</ol>

<h3>My Fun Article</h3>
<p id="p1">
  You can target <i>this paragraph</i> using a URL fragment. Click on the first
  link above to try out!
</p>
<p id="p2">
  This is <i>another paragraph</i>, also accessible from the second link above.
  Isn't that delightful?
</p>
```

#### CSS

```css
p:target {
  background-color: gold;
}

/* Add a pseudo-element inside the target element */
p:target::before {
  font: 70% sans-serif;
  content: "►";
  color: limegreen;
  margin-right: 0.25em;
}

/* Style italic elements within the target element */
p:target i {
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('A_table_of_contents', 500, 300)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the :target pseudo-class in selectors](/en-US/docs/Web/CSS/Guides/Selectors/Using_:target)
- {{cssxref("::target-text")}} (để tô sáng các đoạn văn bản)
