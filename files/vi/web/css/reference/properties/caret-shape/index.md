---
title: caret-shape
slug: Web/CSS/Reference/Properties/caret-shape
page-type: css-property
status:
  - experimental
browser-compat: css.properties.caret-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`caret-shape`** trong [CSS](/en-US/docs/Web/CSS) đặt hình dạng của **con trỏ chèn**, dấu hiệu hiển thị trong các phần tử có thể chỉnh sửa để chỉ ra vị trí ký tự tiếp theo sẽ được chèn vào hoặc xóa đi.

{{InteractiveExample("CSS Demo: caret-shape")}}

```css interactive-example-choice
caret-shape: auto;
```

```css interactive-example-choice
caret-shape: bar;
```

```css interactive-example-choice
caret-shape: block;
```

```css interactive-example-choice
caret-shape: underscore;
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

## Cú pháp

```css
/* Giá trị từ khóa */
caret-shape: auto;
caret-shape: bar;
caret-shape: block;
caret-shape: underscore;

/* Giá trị toàn cục */
caret-shape: inherit;
caret-shape: initial;
caret-shape: revert;
caret-shape: revert-layer;
caret-shape: unset;
```

### Giá trị

- `auto`
  - : Giá trị mặc định. Trình duyệt xác định hình dạng con trỏ. Hình dạng này thường theo quy ước của nền tảng và có thể thay đổi tùy theo ngữ cảnh.

- `bar`
  - : Con trỏ xuất hiện dưới dạng đường thẳng đứng mảnh tại điểm chèn, nằm giữa các ký tự thay vì đè lên chúng.

- `block`
  - : Con trỏ xuất hiện dưới dạng hình chữ nhật đè lên ký tự tiếp theo sau điểm chèn. Nếu không có ký tự nào theo sau, nó xuất hiện sau ký tự cuối cùng.

- `underscore`
  - : Con trỏ xuất hiện dưới dạng đường ngang mảnh bên dưới ký tự tiếp theo sau điểm chèn. Nếu không có ký tự nào theo sau, nó xuất hiện sau ký tự cuối cùng.

## Mô tả

Con trỏ chèn là con trỏ nhấp nháy cho biết vị trí văn bản sẽ được chèn khi gõ phím. Các hình dạng con trỏ khác nhau có thể cung cấp phản hồi trực quan về chế độ chỉnh sửa hiện tại hoặc mang lại tùy chỉnh giao diện.

### Chế độ chỉnh sửa và hình dạng con trỏ

Các trình soạn thảo văn bản thường hoạt động ở một trong hai chế độ:

- **Chế độ chèn**: Ký tự mới được chèn vào vị trí con trỏ, đẩy văn bản hiện có về cuối dòng. Đây là hành vi mặc định trong hầu hết các ứng dụng hiện đại.
- **Chế độ ghi đè** (còn gọi là "chế độ overwrite"): Ký tự mới thay thế các ký tự hiện có tại vị trí con trỏ thay vì được chèn vào giữa chúng. Chế độ này thường được chuyển đổi bằng phím <kbd>Insert</kbd>.

Các hình dạng con trỏ khác nhau có cách dùng truyền thống, ví dụ:

- **Con trỏ dạng thanh** nằm giữa các ký tự và phổ biến nhất trong giao diện hiện đại.
- **Con trỏ dạng khối** đè lên ký tự tiếp theo và thường được dùng trong ứng dụng terminal hoặc để chỉ chế độ ghi đè.
- **Con trỏ dạng gạch dưới** xuất hiện bên dưới ký tự và có thể hữu ích cho một số thiết kế thẩm mỹ nhất định, chẳng hạn như mô phỏng kiểu gõ máy chữ hoặc kiểu nhập văn bản có gạch chân.

### Vị trí và hành vi con trỏ

Thuộc tính `caret-shape` ảnh hưởng đến cách con trỏ được hiển thị trực quan nhưng không thay đổi vị trí logic của nó trong văn bản. Con trỏ luôn đại diện cho điểm chèn giữa các ký tự, bất kể hình dạng trực quan của nó.

### Tương tác với chế độ viết

Hình dạng con trỏ thích ứng với {{cssxref("writing-mode")}} của văn bản. Trong chế độ viết dọc, con trỏ dạng thanh trở thành ngang, và con trỏ dạng gạch dưới định vị phù hợp so với hướng văn bản.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Màn hình terminal retro với con trỏ động

Ví dụ này cho thấy cách tạo giao diện terminal cổ điển bằng `caret-shape: block` với màu con trỏ động, thay thế kỹ thuật cũ dựa trên border.

Điểm quan trọng là sử dụng các thuộc tính con trỏ hiện đại thay vì kỹ thuật dựa trên border cũ. Chúng ta đặt hình dạng con trỏ thành block, tắt hiệu ứng nhấp nháy mặc định và tạo hoạt ảnh tùy chỉnh của riêng mình.

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
  caret-shape: block;
  caret-animation: manual;
  animation: old-caret 2s infinite;
}

@keyframes old-caret {
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

### Giao diện console với con trỏ dạng gạch dưới

Ví dụ này minh họa cách dùng `caret-shape: underscore` để tạo giao diện kiểu console, nơi con trỏ dạng gạch dưới bổ sung cho thẩm mỹ terminal.

#### HTML

```html
<label for="console">Enter a command</label>
<div class="console-demo">
  <div class="console-output">
    <p>user@host:css-ui-4 $ ls -a</p>
    <p>. .. Overview.bs Overview.html</p>
  </div>
  <div class="console-input">
    <span class="prompt">user@host:css-ui-4 $ </span>
    <input type="text" id="console" class="console" value="cd" />
  </div>
</div>
```

#### CSS

```css hidden
label {
  background: #2a2a2c;
  color: white;
  display: block;
  padding: 10px 20px;
  font-weight: bold;
  font-family: monospace;
}

.console-demo {
  background: black;
  color: white;
  font-family: monospace;
  padding: 10px 20px;
  height: 60px;
}

.console-output {
  margin-bottom: 0.5rem;
}

.console-output p {
  margin: 0 0.25rem;
}

.console-input {
  display: flex;
  align-items: center;
}

.prompt {
  margin-right: 0;
}

.console {
  background: transparent;
  border: none;
  color: white;
  padding-left: 1ch;
  font-family: inherit;
  outline: none;
  flex: 1;
}
```

```css
.console {
  caret-shape: underscore;
}
```

#### Kết quả

{{EmbedLiveSample('Console_interface_with_underscore_caret', 550, 115)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("caret-color")}}, {{cssxref("caret-animation")}}
- Thuộc tính viết tắt {{cssxref("caret")}}
- Mô-đun [CSS basic user interface](/en-US/docs/Web/CSS/Guides/Basic_user_interface)
