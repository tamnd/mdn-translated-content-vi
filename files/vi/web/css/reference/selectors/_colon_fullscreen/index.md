---
title: :fullscreen
slug: Web/CSS/Reference/Selectors/:fullscreen
page-type: css-pseudo-class
browser-compat: css.selectors.fullscreen
sidebar: cssref
---

**`:fullscreen`** là [lớp giả (pseudo-class)](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS), khớp với mọi phần tử hiện đang ở chế độ toàn màn hình. Nếu nhiều phần tử đã được đặt ở chế độ toàn màn hình, lớp giả này sẽ chọn tất cả chúng.

## Cú pháp

```css
:fullscreen {
  /* ... */
}
```

## Ghi chú sử dụng

Lớp giả `:fullscreen` cho phép bạn cấu hình stylesheet để tự động điều chỉnh kích thước, kiểu dáng hoặc bố cục nội dung khi các phần tử chuyển đổi qua lại giữa chế độ toàn màn hình và cách trình bày thông thường.

## Ví dụ

### Tạo kiểu cho phần tử toàn màn hình

Ví dụ này áp dụng màu nền khác nhau cho một phần tử {{htmlelement("div")}}, tùy thuộc vào việc nó có đang ở chế độ toàn màn hình hay không. Ví dụ bao gồm một {{htmlelement("button")}} để bật/tắt toàn màn hình.

```html
<div class="element">
  <h1><code>:fullscreen</code> pseudo-class demo</h1>

  <p>
    This demo uses the <code>:fullscreen</code> pseudo-class to automatically
    change the background color of the <code>.element</code> div.
  </p>

  <p>
    Normally, the background is light yellow. In fullscreen mode, the background
    is light pink.
  </p>

  <button class="toggle">Toggle Fullscreen</button>
</div>
```

Lớp giả `:fullscreen` được dùng để ghi đè {{cssxref("background-color")}} của thẻ `<div>` khi nó ở chế độ toàn màn hình.

```css
.element {
  background-color: lightyellow;
}

.element:fullscreen {
  background-color: lightpink;
}
```

JavaScript sau đây cung cấp một hàm xử lý sự kiện để bật/tắt toàn màn hình khi `<button>` được nhấp.

```js
document.querySelector(".toggle").addEventListener("click", (event) => {
  if (document.fullscreenElement) {
    // If there is a fullscreen element, exit full screen.
    document.exitFullscreen();
    return;
  }
  // Make the .element div fullscreen.
  document.querySelector(".element").requestFullscreen();
});
```

```css hidden
.element {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-family: sans-serif;
  padding: 1.2em;
}
```

{{EmbedLiveSample("Styling a fullscreen element", "", "300", "", "", "", "fullscreen")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [Guide to the Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide)
- {{cssxref("::backdrop")}}
- DOM API: {{ domxref("Element.requestFullscreen()") }}, {{ domxref("Document.exitFullscreen()") }}, {{ domxref("Document.fullscreenElement") }}
- Thuộc tính [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen)
