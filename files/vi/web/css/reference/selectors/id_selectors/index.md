---
title: ID selectors
slug: Web/CSS/Reference/Selectors/ID_selectors
page-type: css-selector
browser-compat: css.selectors.id
sidebar: cssref
---

**Bộ chọn ID** CSS khớp một phần tử dựa trên giá trị của thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử đó. Để phần tử được chọn, thuộc tính `id` của nó phải khớp chính xác với giá trị được đặt trong bộ chọn.

```css
/* The element with id="demo" */
#demo {
  border: red 2px solid;
}
```

## Cú pháp

```css
#id_value {
  /* … */
}
```

Lưu ý rằng về mặt cú pháp (nhưng không phải về mặt độ ưu tiên), điều này tương đương với [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) sau:

```css
[id="id_value"] {
  /* … */
}
```

Giá trị `id_value` phải là một [định danh CSS](/en-US/docs/Web/CSS/Reference/Values/ident) hợp lệ. Các thuộc tính `id` HTML không phải là định danh CSS hợp lệ phải được [thoát ký tự](/en-US/docs/Web/CSS/Reference/Values/ident#escaping_characters) trước khi có thể dùng trong bộ chọn ID.

## Ví dụ

### Bộ chọn ID hợp lệ

#### HTML

```html
<p id="blue">This paragraph has a blue background.</p>
<p>This is just a regular paragraph.</p>
```

```html
<!-- The next two paragraphs have id attributes
that contain characters which must be escaped in CSS -->

<p id="item?one">This paragraph has a pink background.</p>
<p id="123item">This paragraph has a yellow background.</p>
```

#### CSS

```css
#blue {
  background-color: skyblue;
}
```

```css
/* In the next two rules, the id attributes must be escaped */

#item\?one {
  background-color: pink;
}

#\00003123item {
  background-color: yellow;
}
```

#### Kết quả

{{EmbedLiveSample("Examples", '100%', 200)}}

### Bộ chọn ID không hợp lệ

Các bộ chọn ID trong các quy tắc sau không phải là định danh CSS hợp lệ và sẽ bị bỏ qua.

```css example-bad
#item?one {
  background-color: green;
}

#123item {
  background-color: green;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
- [Học CSS: Bộ chọn cơ bản](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors)
