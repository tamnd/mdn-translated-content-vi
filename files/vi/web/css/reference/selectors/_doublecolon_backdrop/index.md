---
title: ::backdrop
slug: Web/CSS/Reference/Selectors/::backdrop
page-type: css-pseudo-element
browser-compat: css.selectors.backdrop
sidebar: cssref
---

Phần tử giả **`::backdrop`** trong [CSS](/en-US/docs/Web/CSS) là một hộp có kích thước bằng {{Glossary("viewport")}}, được hiển thị ngay bên dưới bất kỳ phần tử nào đang được trình bày trong {{glossary("top layer")}}.

{{InteractiveExample("CSS Demo: ::backdrop", "tabbed-shorter")}}

```css interactive-example
button {
  font-size: 1.2rem;
  padding: 5px 15px;
}

dialog::backdrop {
  background-color: salmon;
}
```

```html interactive-example
<button id="showDialogBtn">Show a dialog</button>

<dialog id="favDialog">
  <form method="dialog">
    <p>The background shown outside of this dialog is a backdrop.</p>
    <button id="confirmBtn">Close the dialog</button>
  </form>
</dialog>
```

```js interactive-example
const showDialogBtn = document.getElementById("showDialogBtn");
const favDialog = document.getElementById("favDialog");

showDialogBtn.addEventListener("click", () => favDialog.showModal());
```

## Cú pháp

```css
::backdrop {
  /* ... */
}
```

## Mô tả

Backdrop xuất hiện trong các trường hợp sau:

- Các phần tử đã được đặt ở chế độ toàn màn hình bằng phương thức {{domxref("Element.requestFullscreen()")}} của [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API).
- Các phần tử {{HTMLElement("dialog")}} đã được hiển thị trong top layer thông qua lệnh gọi {{domxref("HTMLDialogElement.showModal()")}}.
- Các phần tử {{domxref("Popover API", "Popover", "", "nocode")}} đã được hiển thị trong top layer thông qua lệnh gọi {{domxref("HTMLElement.showPopover()")}}.

Khi nhiều phần tử được đặt vào top layer, mỗi phần tử có phần tử giả `::backdrop` riêng của nó.

```css
/* Backdrop is only displayed when dialog is opened with dialog.showModal() */
dialog::backdrop {
  background: rgb(255 0 0 / 25%);
}
```

Các phần tử được đặt trong một ngăn xếp vào sau ra trước (LIFO) trong top layer. Phần tử giả `::backdrop` cho phép che khuất, tạo kiểu, hoặc ẩn hoàn toàn mọi thứ nằm bên dưới một phần tử top layer.

`::backdrop` không kế thừa từ và không được kế thừa bởi bất kỳ phần tử nào khác. Không có hạn chế nào về các thuộc tính áp dụng cho phần tử giả này.

## Ví dụ

### Tạo kiểu cho backdrop của hộp thoại modal

Trong ví dụ này, chúng ta dùng phần tử giả `::backdrop` để tạo kiểu cho backdrop được sử dụng khi một {{htmlelement("dialog")}} modal được mở.

#### HTML

Chúng ta bao gồm một {{htmlelement("button")}} khi được nhấp sẽ mở `<dialog>` đã bao gồm. Khi `<dialog>` được mở, chúng ta trao tiêu điểm cho nút đóng hộp thoại:

```html
<dialog>
  <button autofocus>Close</button>
  <p>This modal dialog has a beautiful backdrop!</p>
</dialog>
<button>Show the dialog</button>
```

#### CSS

Chúng ta thêm nền cho backdrop, tạo ra một chiếc bánh vòng đầy màu sắc bằng cách dùng [CSS gradients](/en-US/docs/Web/CSS/Reference/Values/gradient):

```css
::backdrop {
  background-image:
    radial-gradient(
      circle,
      white 0 5vw,
      transparent 5vw 20vw,
      white 20vw 22.5vw,
      #eeeeee 22.5vw
    ),
    conic-gradient(
      #272b66 0 50grad,
      #2d559f 50grad 100grad,
      #9ac147 100grad 150grad,
      #639b47 150grad 200grad,
      #e1e23b 200grad 250grad,
      #f7941e 250grad 300grad,
      #662a6c 300grad 350grad,
      #9a1d34 350grad 400grad,
      #43a1cd 100grad 150grad,
      #ba3e2e
    );
}
```

#### JavaScript

Hộp thoại được mở modal bằng phương thức [`.showModal()`](/en-US/docs/Web/API/HTMLDialogElement/showModal) và đóng bằng phương thức [`.close()`](/en-US/docs/Web/API/HTMLDialogElement/close).

```js
const dialog = document.querySelector("dialog");
const showButton = document.querySelector("dialog + button");
const closeButton = document.querySelector("dialog button");

// "Show the dialog" button opens the dialog modally
showButton.addEventListener("click", () => {
  dialog.showModal();
});

// "Close" button closes the dialog
closeButton.addEventListener("click", () => {
  dialog.close();
});
```

#### Kết quả

{{EmbedLiveSample("Styling a modal dialog's backdrop", 450, 300)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":fullscreen")}} pseudo-class
- {{HTMLElement("dialog")}} HTML element
- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) HTML global attribute
- [Popover API](/en-US/docs/Web/API/Popover_API)
