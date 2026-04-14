---
title: "<center>: Phần tử văn bản căn giữa"
slug: Web/HTML/Reference/Elements/center
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.center
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<center>`** trong [HTML](/en-US/docs/Web/HTML) là một [phần tử cấp khối](/en-US/docs/Glossary/Block-level_content) hiển thị nội dung cấp khối hoặc nội tuyến của nó ở giữa nằm ngang trong phần tử chứa. Container thường là, nhưng không bắt buộc phải là, {{HTMLElement("body")}}.

Thẻ này đã bị deprecated trong HTML 4 (và XHTML 1) để ủng hộ thuộc tính [CSS](/en-US/docs/Web/CSS) {{Cssxref("text-align")}}, có thể được áp dụng cho phần tử {{HTMLElement("div")}} hoặc cho một {{HTMLElement("p")}} riêng lẻ. Để căn giữa các khối, hãy dùng các thuộc tính CSS khác như {{Cssxref("margin-left")}} và {{Cssxref("margin-right")}} và đặt chúng thành `auto` (hoặc đặt {{Cssxref("margin")}} thành `0 auto`).

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("HTMLElement")}}.

## Ví dụ 1

```html
<center>
  This text will be centered.
  <p>So will this paragraph.</p>
</center>
```

### Kết quả

{{EmbedLiveSample("Example 1")}}

## Ví dụ 2 (thay thế bằng CSS)

```html
<div class="center">
  This text will be centered.
  <p>So will this paragraph.</p>
</div>
```

```css
.center {
  text-align: center;
}
```

### Kết quả

{{EmbedLiveSample("Example 2 (CSS alternative)")}}

## Ví dụ 3 (thay thế bằng CSS)

```html
<p class="center">
  This line will be centered.<br />
  And so will this line.
</p>
```

```css
.center {
  text-align: center;
}
```

### Kết quả

{{EmbedLiveSample("Example 3 (CSS alternative)")}}

> [!NOTE]
> Áp dụng {{cssxref("text-align", "text-align: center")}} cho phần tử {{HTMLElement("div")}} hoặc {{HTMLElement("p")}} sẽ căn giữa _nội dung_ của các phần tử đó trong khi giữ nguyên kích thước tổng thể của chúng.

<!-- ## Technical summary -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("text-align")}}
- {{Cssxref("display")}}
