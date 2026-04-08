---
title: Class selectors
slug: Web/CSS/Reference/Selectors/Class_selectors
page-type: css-selector
browser-compat: css.selectors.class
sidebar: cssref
---

**Bộ chọn lớp** [CSS](/en-US/docs/Web/CSS) khớp các phần tử dựa trên nội dung của thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) của chúng.

```css
/* All elements with class="spacious" */
.spacious {
  margin: 2em;
}

/* All <li> elements with class="spacious" */
li.spacious {
  margin: 2em;
}

/* All <li> elements with a class list that includes both "spacious" and "elegant" */
/* For example, class="elegant retro spacious" */
li.spacious.elegant {
  margin: 2em;
}
```

## Cú pháp

```css
.class_name {
  /* … */
}
```

Lưu ý rằng điều này tương đương với [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) sau:

```css
[class~="class_name"] {
  /* … */
}
```

Giá trị `class_name` phải là một [định danh CSS](/en-US/docs/Web/CSS/Reference/Values/ident) hợp lệ. Các thuộc tính `class` HTML không phải là định danh CSS hợp lệ phải được [thoát ký tự](/en-US/docs/Web/CSS/Reference/Values/ident#escaping_characters) trước khi có thể dùng trong bộ chọn lớp.

## Ví dụ

### Bộ chọn lớp hợp lệ

#### HTML

```html
<p class="red">This paragraph has red text.</p>
<p class="red yellow-bg">
  This paragraph has red text and a yellow background.
</p>
<p class="red fancy">This paragraph has red text and "fancy" styling.</p>
<p>This is just a regular paragraph.</p>
```

```html
<!-- The next two paragraphs have class attributes
that contain characters which must be escaped in CSS -->

<p class="item?one">This paragraph has a pink background.</p>
<p class="123item">This paragraph has a yellow background.</p>
```

#### CSS

```css
.red {
  color: #ff3333;
}

.yellow-bg {
  background: #ffffaa;
}

.fancy {
  font-weight: bold;
  text-shadow: 4px 4px 3px #7777ff;
}
```

```css
/* In the next two rules, the class attributes must be escaped */

.item\?one {
  background-color: pink;
}

.\00003123item {
  background-color: yellow;
}
```

#### Kết quả

{{EmbedLiveSample('Examples', "", 300)}}

### Bộ chọn lớp không hợp lệ

Các bộ chọn lớp trong các quy tắc sau không phải là định danh CSS hợp lệ và sẽ bị bỏ qua.

```css example-bad
.item?one {
  background-color: green;
}

.123item {
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
