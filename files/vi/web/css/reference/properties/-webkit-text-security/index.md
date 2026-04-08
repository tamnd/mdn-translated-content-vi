---
title: -webkit-text-security
slug: Web/CSS/Reference/Properties/-webkit-text-security
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-webkit-text-security
sidebar: cssref
---

{{Non-standard_Header}}

**`-webkit-text-security`** là một thuộc tính CSS không chuẩn che giấu các ký tự trong trường {{HtmlElement("form")}} (chẳng hạn {{HtmlElement("input")}} hoặc {{HtmlElement("textarea")}}) bằng cách thay thế chúng bằng một hình dạng. Nó chỉ ảnh hưởng đến các trường _không_ có `type=password`.

## Cú pháp

```css
-webkit-text-security: circle;
-webkit-text-security: disc;
-webkit-text-security: square;
-webkit-text-security: none;

/* Giá trị toàn cục */
-webkit-text-security: inherit;
-webkit-text-security: initial;
-webkit-text-security: revert;
-webkit-text-security: revert-layer;
-webkit-text-security: unset;
```

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-text-security = circle | disc | square | none`)}}

## Ví dụ

### Che giấu nội dung ô nhập văn bản

Hãy thử gõ vào trường bên dưới. Nếu trình duyệt của bạn hỗ trợ thuộc tính này, các ký tự sẽ được thay thế bằng hình vuông.

#### HTML

```html
<label for="name">Name:</label> <input type="text" name="name" id="name" />
```

#### CSS

```css
input {
  -webkit-text-security: square;
}
```

#### Kết quả

{{EmbedLiveSample("Obscuring_a_text_input")}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các phần mở rộng CSS WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions)
