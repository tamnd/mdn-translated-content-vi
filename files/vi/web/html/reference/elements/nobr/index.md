---
title: "<nobr>: Phần tử văn bản không ngắt"
slug: Web/HTML/Reference/Elements/nobr
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.nobr
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<nobr>`** trong [HTML](/en-US/docs/Web/HTML) ngăn văn bản nó chứa tự động xuống dòng trên nhiều dòng, có thể dẫn đến việc người dùng phải cuộn ngang để xem toàn bộ chiều rộng của văn bản.

> [!WARNING]
> Mặc dù phần tử này được hỗ trợ rộng rãi, nhưng nó _chưa bao giờ_ là HTML chuẩn, vì vậy bạn không nên dùng nó. Thay vào đó, hãy dùng thuộc tính CSS {{CSSxRef("white-space")}} như sau:

```html
<span class="nobr">Long line with no breaks</span>
```

```css
.nobr {
  white-space: nowrap;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("white-space")}}
- {{CSSxRef("overflow")}}
