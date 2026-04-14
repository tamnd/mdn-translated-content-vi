---
title: "<big>: Phần tử văn bản lớn hơn"
slug: Web/HTML/Reference/Elements/big
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.big
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<big>`** trong [HTML](/en-US/docs/Web/HTML) đã lỗi thời, hiển thị văn bản kèm theo ở cỡ chữ lớn hơn một cấp so với văn bản xung quanh (ví dụ: `medium` trở thành `large`). Kích thước được giới hạn ở cỡ chữ tối đa được phép của trình duyệt.

> [!WARNING]
> Phần tử này đã bị xóa khỏi thông số kỹ thuật và không nên dùng nữa. Hãy dùng thuộc tính CSS {{cssxref("font-size")}} để điều chỉnh cỡ chữ.

## Thuộc tính

Phần tử này không có thuộc tính nào khác ngoài [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes), chung cho tất cả các phần tử.

## Ví dụ

Ở đây chúng ta thấy các ví dụ về việc dùng `<big>` và sau đó là ví dụ về cách đạt được kết quả tương tự bằng cú pháp CSS hiện đại.

### Dùng big

Ví dụ này dùng phần tử lỗi thời `<big>` để tăng kích thước một số văn bản.

#### HTML

```html
<p>
  This is the first sentence.
  <big>This whole sentence is in bigger letters.</big>
</p>
```

#### Kết quả

{{EmbedLiveSample("Using_big", 640, 60)}}

### Dùng CSS `font-size`

Ví dụ này dùng thuộc tính CSS {{cssxref("font-size")}} để tăng cỡ chữ lên một cấp.

#### CSS

```css
.bigger {
  font-size: larger;
}
```

#### HTML

```html
<p>
  This is the first sentence.
  <span class="bigger">This whole sentence is in bigger letters.</span>
</p>
```

#### Kết quả

{{EmbedLiveSample("Using_CSS_font-size", 640, 60)}}

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref('HTMLElement')}}.

<!-- ## Technical summary -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- CSS: {{cssxref("font-size")}}, {{cssxref("font")}}
- HTML: {{htmlelement("small")}}, {{htmlelement("font")}}, {{htmlelement("style")}}
