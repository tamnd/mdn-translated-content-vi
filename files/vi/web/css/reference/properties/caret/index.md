---
title: caret
slug: Web/CSS/Reference/Properties/caret
page-type: css-shorthand-property
status:
  - experimental
browser-compat: css.properties.caret
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`caret`** trong [CSS](/en-US/docs/Web/CSS) đặt giao diện và hành vi của **con trỏ chèn** trong một khai báo duy nhất.

{{InteractiveExample("CSS Demo: caret")}}

```css interactive-example-choice
caret: red;
```

```css interactive-example-choice
caret: block manual;
```

```css interactive-example-choice
caret: underscore auto green;
```

```css interactive-example-choice
caret: bar manual orange;
```

```html interactive-example
<section class="default-example container" id="default-example">
  <div>
    <label for="example-element">Edit text field:</label>
    <input id="example-element" type="text" value="Sample text" />
  </div>
</section>
```

```css interactive-example
div {
  text-align: left;
}

#example-element {
  font-size: 1.2rem;
  padding: 8px;
  width: 300px;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("caret-color")}}
- {{cssxref("caret-animation")}}
- {{cssxref("caret-shape")}}

## Cú pháp

```css
/* Giá trị đơn lẻ */
caret: red; /* chỉ caret-color */
caret: block; /* chỉ caret-shape */
caret: manual; /* chỉ caret-animation */

/* Hai giá trị */
caret: red manual; /* caret-color + caret-animation */
caret: block auto; /* caret-shape + caret-animation */
caret: underscore orange; /* caret-shape + caret-color */

/* Ba giá trị */
caret: bar manual red; /* caret-shape + caret-animation + caret-color */
caret: block auto #00ff00; /* caret-shape + caret-animation + caret-color */

/* Giá trị toàn cục */
caret: inherit;
caret: initial;
caret: revert;
caret: revert-layer;
caret: unset;
```

Thuộc tính `caret` được chỉ định bằng một, hai hoặc ba giá trị từ các thuộc tính thành phần. Các giá trị có thể được chỉ định theo bất kỳ thứ tự nào, và các giá trị bị bỏ qua sẽ được đặt về giá trị ban đầu của chúng.

### Giá trị

- {{cssxref("caret-color")}}
  - : Đặt màu của con trỏ.

- {{cssxref("caret-animation")}}
  - : Kiểm soát xem con trỏ có nhấp nháy hay không.

- {{cssxref("caret-shape")}}
  - : Đặt hình dạng trực quan của con trỏ.

## Mô tả

Thuộc tính viết tắt `caret` cho phép đặt nhiều thuộc tính con trỏ trong một khai báo duy nhất, giúp thuận tiện khi tùy chỉnh toàn bộ giao diện và hành vi của con trỏ chèn.

### Phân giải giá trị

Khi các giá trị bị bỏ qua trong thuộc tính viết tắt, chúng sẽ được đặt lại về giá trị ban đầu:

- `caret-color`: `auto` (phân giải thành `currentColor`).
- `caret-animation`: `auto` (con trỏ nhấp nháy).
- `caret-shape`: `auto` (hình dạng do trình duyệt xác định).

### Không phụ thuộc thứ tự

Không giống một số thuộc tính viết tắt CSS, thuộc tính `caret` nhận giá trị theo bất kỳ thứ tự nào. Trình duyệt xác định giá trị nào áp dụng cho thuộc tính nào dựa trên loại giá trị:

- Giá trị {{cssxref("&lt;color>")}} áp dụng cho `caret-color`.
- Từ khóa `auto`/`manual` áp dụng cho `caret-animation`.
- Từ khóa hình dạng (`bar`, `block`, `underscore`) áp dụng cho `caret-shape`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Màn hình terminal retro với con trỏ động

Ví dụ này tạo giao diện terminal cổ điển sử dụng thuộc tính viết tắt `caret` để kết hợp nhiều thuộc tính con trỏ, minh họa cách nó thay thế các kỹ thuật dựa trên border cũ.

Ưu điểm chính của thuộc tính viết tắt `caret` là kết hợp nhiều thuộc tính trong một khai báo. Ở đây chúng ta đặt hình dạng thành `block`, tắt hiệu ứng nhấp nháy mặc định và đặt màu thành `green`, tất cả trong một dòng.

#### HTML

```html
<label for="terminal">Enter a command</label>
<div class="old-screen">
  <span>></span>
  <textarea id="terminal" class="terminal-input"></textarea>
</div>
```

#### CSS

```css hidden
label {
  background: #092104;
  display: block;
  padding: 10px 20px;
  color: #00ad00;
  font-weight: bold;
  font-family: monospace;
}

.old-screen {
  background: repeating-linear-gradient(
    #092104,
    #092104 2px,
    #123208 2px,
    #123208 4px
  );
  height: 140px;
  display: flex;
  align-items: flex-start;
  padding: 20px;
  font-family: monospace;
}

span {
  display: inline-block;
  padding: 2px 5px;
  color: #00ad00;
  font-weight: bold;
  margin-right: 8px;
}

.terminal-input {
  background: transparent;
  height: 100%;
  border: none;
  color: #00ad00;
  font-family: inherit;
  font-size: 1rem;
  outline: none;
  flex: 1;
  resize: none;
}
```

```css
.terminal-input {
  caret: block manual green;
  animation: vintage-caret 2s infinite;
}

@keyframes vintage-caret {
  0%,
  50% {
    caret-color: #00ad00;
  }
  75%,
  100% {
    caret-color: transparent;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Retro_terminal_with_animated_caret', 550, 215)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("caret-color")}}, {{cssxref("caret-animation")}}, {{cssxref("caret-shape")}}
- Mô-đun [CSS basic user interface](/en-US/docs/Web/CSS/Guides/Basic_user_interface)
