---
title: unset
slug: Web/CSS/Reference/Values/unset
page-type: css-keyword
browser-compat: css.types.global_keywords.unset
sidebar: cssref
---

Từ khóa **`unset`** trong [CSS](/vi/docs/Web/CSS) đặt lại một thuộc tính về giá trị kế thừa của nó nếu thuộc tính đó tự nhiên kế thừa từ phần tử cha, và về [giá trị khởi tạo](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) nếu không. Nói cách khác, nó hoạt động giống như từ khóa {{cssxref("inherit")}} trong trường hợp đầu tiên, khi thuộc tính là [thuộc tính kế thừa](/vi/docs/Web/CSS/Guides/Cascade/Inheritance#inherited_properties), và giống như từ khóa {{cssxref("initial")}} trong trường hợp thứ hai, khi thuộc tính là [thuộc tính không kế thừa](/vi/docs/Web/CSS/Guides/Cascade/Inheritance#non-inherited_properties).

**`unset`** có thể được áp dụng cho bất kỳ thuộc tính CSS nào, bao gồm cả thuộc tính viết tắt CSS {{cssxref("all")}}.

## Ví dụ

### Color

[`color`](/vi/docs/Web/CSS/Reference/Properties/color#formal_definition) là một thuộc tính kế thừa.

#### HTML

```html
<p>This text is red.</p>
<div class="foo">
  <p>This text is also red.</p>
</div>
<div class="bar">
  <p>This text is green (default inherited value).</p>
</div>
```

#### CSS

```css
.foo {
  color: blue;
}

.bar {
  color: green;
}

p {
  color: red;
}

.bar p {
  color: unset;
}
```

#### Kết quả

{{ EmbedLiveSample('Color') }}

### Border

[`border`](/vi/docs/Web/CSS/Reference/Properties/border#formal_definition) là một thuộc tính không kế thừa.

#### HTML

```html
<p>This text has a red border.</p>
<div>
  <p>This text has a red border.</p>
</div>
<div class="bar">
  <p>This text has a black border (initial default, not inherited).</p>
</div>
```

#### CSS

```css
div {
  border: 1px solid green;
}

p {
  border: 1px solid red;
}

.bar p {
  border-color: unset;
}
```

#### Kết quả

{{ EmbedLiveSample('Border', 'auto', 200) }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Dùng từ khóa {{cssxref("initial")}} để đặt một thuộc tính về giá trị khởi tạo của nó.
- Dùng từ khóa {{cssxref("inherit")}} để làm cho thuộc tính của một phần tử giống với phần tử cha của nó.
- Dùng từ khóa {{cssxref("revert")}} để đặt lại một thuộc tính về giá trị được thiết lập bởi stylesheet của user-agent (hoặc bởi style người dùng, nếu có).
- Dùng từ khóa {{cssxref("revert-layer")}} để đặt lại một thuộc tính về giá trị được thiết lập trong tầng cascade trước đó.
- Thuộc tính {{cssxref("all")}} cho phép bạn đặt lại tất cả các thuộc tính về trạng thái khởi tạo, kế thừa, revert hoặc unset cùng một lúc.
