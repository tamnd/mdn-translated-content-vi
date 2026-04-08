---
title: :scope
slug: Web/CSS/Reference/Selectors/:scope
page-type: css-pseudo-class
browser-compat: css.selectors.scope
sidebar: cssref
---

**`:scope`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho các phần tử là điểm tham chiếu, hay phạm vi, để các bộ chọn khớp với.

```css
/* Chọn một phần tử có phạm vi */
:scope {
  background-color: lime;
}
```

Phần tử nào mà `:scope` khớp phụ thuộc vào ngữ cảnh sử dụng của nó:

- Khi dùng ở cấp độ gốc của stylesheet, `:scope` tương đương với {{cssxref(":root")}}, trong một tài liệu HTML thông thường sẽ khớp với phần tử {{htmlelement("html")}}.
- Khi dùng bên trong một khối {{cssxref("@scope")}}, `:scope` khớp với phần tử gốc của phạm vi được định nghĩa bởi khối đó. Nó cung cấp cách áp dụng kiểu cho gốc của phạm vi từ bên trong chính khối `@scope`.
- Khi dùng trong một lời gọi DOM API — chẳng hạn như {{domxref("Element.querySelector", "querySelector()")}}, {{domxref("Element.querySelectorAll", "querySelectorAll()")}}, {{domxref("Element.matches", "matches()")}}, hoặc {{domxref("Element.closest()")}} — `:scope` khớp với phần tử mà phương thức được gọi trên đó.

## Cú pháp

```css
:scope {
  /* ... */
}
```

## Ví dụ

### Sử dụng `:scope` thay thế cho `:root`

Ví dụ này cho thấy `:scope` tương đương với `:root` khi dùng ở cấp độ gốc của stylesheet. Trong trường hợp này, CSS được cung cấp sẽ tô màu nền của phần tử `<html>` thành màu cam.

```css
:scope {
  background-color: orange;
}
```

{{ EmbedLiveSample("Using :scope as an alternative to :root", "100%", 50) }}

### Sử dụng `:scope` để tạo kiểu cho gốc phạm vi trong khối `@scope`

Trong ví dụ này, chúng ta dùng hai khối `@scope` riêng biệt để khớp với các liên kết bên trong các phần tử có lớp `.light-scheme` và `.dark-scheme` tương ứng. Lưu ý cách `:scope` được dùng để chọn và cung cấp kiểu cho chính các gốc phạm vi. Trong ví dụ này, các gốc phạm vi là các phần tử {{htmlelement("div")}} có các lớp được áp dụng cho chúng.

#### HTML

```html
<div class="light-scheme">
  <p>
    MDN contains lots of information about
    <a href="/en-US/docs/Web/HTML">HTML</a>,
    <a href="/en-US/docs/Web/CSS">CSS</a>, and
    <a href="/en-US/docs/Web/JavaScript">JavaScript</a>.
  </p>
</div>

<div class="dark-scheme">
  <p>
    MDN contains lots of information about
    <a href="/en-US/docs/Web/HTML">HTML</a>,
    <a href="/en-US/docs/Web/CSS">CSS</a>, and
    <a href="/en-US/docs/Web/JavaScript">JavaScript</a>.
  </p>
</div>
```

#### CSS

```css hidden
div {
  padding: 10px;
}
```

```css
@scope (.light-scheme) {
  :scope {
    background-color: plum;
  }

  a {
    color: indigo;
  }
}

@scope (.dark-scheme) {
  :scope {
    background-color: indigo;
    color: antiquewhite;
  }

  a {
    color: plum;
  }
}
```

#### Kết quả

{{ EmbedLiveSample("Using :scope to style the scope root in a @scope block", "100%", 150) }}

### Sử dụng `:scope` trong JavaScript

Ví dụ này minh họa cách sử dụng lớp giả `:scope` trong JavaScript. Điều này có thể hữu ích nếu bạn cần lấy một phần tử con trực tiếp của một {{domxref("Element")}} đã được truy xuất.

#### HTML

```html
<div id="context">
  <div id="element-1">
    <div id="element-1-1"></div>
    <div id="element-1-2"></div>
  </div>
  <div id="element-2">
    <div id="element-2-1"></div>
  </div>
</div>
<p>
  Selected element ids :
  <span id="results"></span>
</p>
```

#### JavaScript

```js
const context = document.getElementById("context");
const selected = context.querySelectorAll(":scope > div");

document.getElementById("results").textContent = [...selected]
  .map((element) => `#${element.id}`)
  .join(", ");
```

#### Kết quả

Phạm vi của `context` là phần tử có [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) là `context`. Các phần tử được chọn là các phần tử `<div>` là con trực tiếp của context đó — `element-1` và `element-2` — nhưng không phải các phần tử con cháu của chúng.

{{ EmbedLiveSample('Using :scope in JavaScript') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- At-rule {{cssxref("@scope")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- Lớp giả {{cssxref(":root")}} [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
- [Selection and traversal on the DOM tree](/en-US/docs/Web/API/Document_Object_Model/Selection_and_traversal_on_the_DOM_tree)
- {{domxref("Element.querySelector()")}} và {{domxref("Element.querySelectorAll()")}}
- {{domxref("Document.querySelector()")}} và {{domxref("Document.querySelectorAll()")}}
- {{domxref("DocumentFragment.querySelector()")}} và {{domxref("DocumentFragment.querySelectorAll()")}}
