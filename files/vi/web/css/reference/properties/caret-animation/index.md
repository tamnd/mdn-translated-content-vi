---
title: caret-animation
slug: Web/CSS/Reference/Properties/caret-animation
page-type: css-property
status:
  - experimental
browser-compat: css.properties.caret-animation
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`caret-animation`** trong [CSS](/en-US/docs/Web/CSS) dùng để bật hoặc tắt hiệu ứng nhấp nháy của **con trỏ chèn**, là dấu hiệu hiển thị trong các phần tử có thể chỉnh sửa để chỉ ra vị trí ký tự tiếp theo sẽ được chèn vào hoặc xóa đi.

Khi áp dụng hoạt ảnh tùy chỉnh cho con trỏ, bạn nên tắt hiệu ứng nhấp nháy mặc định để nó không gây xung đột với hoạt ảnh.

## Cú pháp

```css
/* Giá trị từ khóa */
caret-animation: auto;
caret-animation: manual;

/* Giá trị toàn cục */
caret-animation: inherit;
caret-animation: initial;
caret-animation: revert;
caret-animation: revert-layer;
caret-animation: unset;
```

### Giá trị

Thuộc tính `caret-animation` được chỉ định bằng một trong các giá trị từ khóa liệt kê dưới đây.

- `auto`
  - : Con trỏ nhấp nháy liên tục. Đây là giá trị mặc định (ban đầu).
- `manual`
  - : Con trỏ không nhấp nháy.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản `caret-animation`

Ví dụ này cho thấy sự khác biệt giữa `caret-animation` được đặt thành `auto` và `manual` trên phần tử có thể chỉnh sửa.

#### HTML

Phần đánh dấu gồm hai phần tử {{htmlelement("p")}} với thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) để cho phép chỉnh sửa.

```html live-sample___caret-animation-basic
<p contenteditable="true">
  My caret animates because <code>caret-animation</code> is set to
  <code>auto</code>.
</p>
<p contenteditable="true">
  My caret doesn't animate because <code>caret-animation</code> is set to
  <code>manual</code>.
</p>
```

#### CSS

CSS đặt giá trị {{cssxref("caret-color")}} thành `red`. Sau đó, đoạn văn đầu tiên có `caret-animation` là `auto` và đoạn văn thứ hai có `caret-animation` là `manual`.

```css live-sample___caret-animation-basic
p {
  caret-color: red;
}

p:first-of-type {
  caret-animation: auto;
}

p:last-of-type {
  caret-animation: manual;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample('caret-animation-basic', 'auto', 100)}}

Hãy thử nhấp vào hai đoạn văn để thấy sự khác biệt trong hành vi con trỏ.

### Tạo hoạt ảnh con trỏ tùy chỉnh

Trong ví dụ này, hoạt ảnh con trỏ tùy chỉnh được áp dụng cho đoạn văn có thể chỉnh sửa và ô nhập văn bản.

#### HTML

Phần đánh dấu gồm phần tử {{htmlelement("p")}} và hai phần tử {{htmlelement("input")}} kiểu văn bản. Phần tử `<p>` có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) để cho phép chỉnh sửa. Đoạn văn và ô nhập đầu tiên có class `custom-caret`.

```html live-sample___caret-animation-custom
<p contenteditable="true" class="custom-caret">
  This paragraph has a custom animation applied to it, plus
  <code>caret-animation: manual</code> to stop the default caret blinking and
  allow the smooth animation to be seen.
</p>

<input
  type="text"
  class="custom-caret"
  value="I've got a custom caret animation" />

<input type="text" value="I've got the default blinking caret" />
```

#### CSS

Đầu tiên, chúng ta định nghĩa một tập hợp {{cssxref("@keyframes")}} thay đổi {{cssxref("caret-color")}} từ `transparent` sang `darkblue`.

```css live-sample___caret-animation-custom
@keyframes custom-caret-animation {
  from {
    caret-color: transparent;
  }

  to {
    caret-color: darkblue;
  }
}
```

Sau đó, chúng ta tạo kiểu cho thẻ `<p>` và `<input>` đầu tiên với hoạt ảnh `@keyframes` tùy chỉnh, một {{cssxref("caret-color")}}, và giá trị `caret-animation` là `manual` để tắt hiệu ứng nhấp nháy con trỏ mặc định.

```css hidden live-sample___caret-animation-custom
body {
  display: flex;
  flex-direction: column;
}

input {
  margin-bottom: 20px;
}
```

```css live-sample___caret-animation-custom
.custom-caret {
  animation: custom-caret-animation infinite linear alternate 0.75s;
  caret-color: darkblue;
  caret-animation: manual;
}

p,
input {
  font-size: 1.6rem;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample('caret-aniamtion-custom', 'auto', 260)}}

Hãy thử nhấp vào hai phần tử đầu tiên để xem hoạt ảnh con trỏ tùy chỉnh trông như thế nào. Để so sánh với con trỏ nhấp nháy mặc định, bạn có thể nhấp vào phần tử thứ ba.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("caret-color")}}, {{cssxref("caret-shape")}}
- Thuộc tính viết tắt {{cssxref("caret")}}
- Mô-đun [CSS basic user interface](/en-US/docs/Web/CSS/Guides/Basic_user_interface)
