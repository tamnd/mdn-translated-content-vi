---
title: :defined
slug: Web/CSS/Reference/Selectors/:defined
page-type: css-pseudo-class
browser-compat: css.selectors.defined
sidebar: cssref
---

**`:defined`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử nào đã được định nghĩa. Điều này bao gồm mọi phần tử tiêu chuẩn được tích hợp sẵn trong trình duyệt và các phần tử tùy chỉnh đã được định nghĩa thành công (tức là bằng phương thức {{domxref("CustomElementRegistry.define()")}}).

```css
/* Chọn bất kỳ phần tử đã được định nghĩa */
:defined {
  font-style: italic;
}

/* Chọn bất kỳ thể hiện nào của một phần tử tùy chỉnh cụ thể */
custom-element:defined {
  display: block;
}
```

## Cú pháp

```css
:defined {
  /* ... */
}
```

## Ví dụ

### Ẩn các phần tử cho đến khi chúng được định nghĩa

Trong ví dụ này, chúng ta định nghĩa một phần tử tùy chỉnh cơ bản có tên `<custom-element>` và sử dụng các bộ chọn `:not(:defined)` và `:defined` để tạo kiểu cho phần tử trước và sau khi nó được định nghĩa. Điều này hữu ích nếu bạn có một phần tử tùy chỉnh phức tạp mất một thời gian để tải vào trang — bạn có thể muốn ẩn các thể hiện của phần tử đó cho đến khi định nghĩa hoàn tất để tránh hiện tượng các phần tử chưa được tạo kiểu xuất hiện đột ngột trên trang.

#### HTML

Đoạn HTML sau sử dụng phần tử tùy chỉnh nhưng phần tử đó chưa được định nghĩa. Chúng ta cũng bao gồm một {{htmlelement("button")}} sẽ định nghĩa phần tử tùy chỉnh khi được nhấp, cho phép bạn thấy trạng thái của nó trước và sau khi được định nghĩa.

```html
<custom-element>
  <p>
    Loaded content: Lorem ipsum tel sed tellus eiusmod tellus. Aenean. Semper
    dolor sit nisi. Elit porttitor nisi sit vivamus.
  </p>
</custom-element>

<button id="btn">define the <code>&lt;custom-element&gt;</code></button>
```

#### CSS

```css hidden
custom-element {
  display: block;
  border: 5px dashed grey;
  border-radius: 1rem;
  height: 100px;
  width: 400px;
  padding: 1rem;
  position: relative;
  user-select: none;
}

code {
  background: #cccccc;
}

#btn {
  margin-top: 1rem;
  cursor: pointer;
}
```

Trong CSS sau, chúng ta sử dụng bộ chọn `custom-element:not(:defined)` để chọn phần tử và tô màu xám khi chưa được định nghĩa, và bộ chọn `custom-element:defined` để chọn phần tử và tô màu đen sau khi được định nghĩa.

```css
custom-element:not(:defined) {
  border-color: grey;
  color: grey;
}

custom-element:defined {
  background-color: wheat;
  border-color: black;
  color: black;
}

/* show loading message */
custom-element:not(:defined)::before {
  content: "Loading...";
  position: absolute;
  inset: 0;
  align-content: center;
  text-align: center;
  font-size: 2rem;
  background-color: white;
  border-radius: 1rem;
}

/* remove the loading message */
custom-element:defined::before {
  content: "";
}
```

Chúng ta cũng đã sử dụng phần tử giả {{cssxref("::before")}} để hiển thị thông báo "Loading..." dạng lớp phủ cho đến khi phần tử được định nghĩa. Sau khi được định nghĩa, nó bị loại bỏ bằng cách đặt {{cssxref("content")}} thành chuỗi rỗng.

JavaScript sau đây đã được dùng để định nghĩa phần tử tùy chỉnh. Để cho phép bạn thấy trạng thái của phần tử tùy chỉnh trước và sau khi được định nghĩa, chúng ta chạy phương thức {{domxref("CustomElementRegistry.define", "define()")}} khi nút được nhấp.

```js
const btn = document.querySelector("#btn");

btn.addEventListener("click", () => {
  customElements.define("custom-element", class extends HTMLElement {});
  btn.remove();
});
```

#### Kết quả

{{EmbedLiveSample("Hiding elements until they are defined", "100%", "230")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web components](/en-US/docs/Web/API/Web_components)
