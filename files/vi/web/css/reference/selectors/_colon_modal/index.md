---
title: :modal
slug: Web/CSS/Reference/Selectors/:modal
page-type: css-pseudo-class
browser-compat: css.selectors.modal
sidebar: cssref
---

Lớp giả **`:modal`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) khớp với một phần tử đang ở trạng thái loại trừ mọi tương tác với các phần tử bên ngoài nó cho đến khi tương tác đó được đóng. Nhiều phần tử có thể được chọn bởi lớp giả `:modal` cùng lúc, nhưng chỉ một trong số chúng sẽ hoạt động và có thể nhận đầu vào.

{{InteractiveExample("CSS Demo: :modal", "tabbed-shorter")}}

```css interactive-example
button {
  display: block;
  margin: auto;
  width: 10rem;
  height: 2rem;
}

:modal {
  background-color: beige;
  border: 2px solid burlywood;
  border-radius: 5px;
}

p {
  color: black;
}
```

```html interactive-example
<p>Would you like to see a new random number?</p>
<button id="showNumber">Show me</button>

<dialog id="favDialog">
  <form method="dialog">
    <p>Lucky number is: <strong id="number"></strong></p>
    <button>Close dialog</button>
  </form>
</dialog>
```

```js interactive-example
const showNumber = document.getElementById("showNumber");
const favDialog = document.getElementById("favDialog");
const number = document.getElementById("number");

showNumber.addEventListener("click", () => {
  number.innerText = Math.floor(Math.random() * 1000);
  favDialog.showModal();
});
```

## Cú pháp

```css
:modal {
  /* ... */
}
```

## Ghi chú sử dụng

Các ví dụ về phần tử sẽ ngăn người dùng tương tác với phần còn lại của trang và sẽ được chọn bởi lớp giả `:modal` bao gồm:

- Phần tử [`dialog`](/vi/docs/Web/HTML/Reference/Elements/dialog) được mở bằng API `showModal()`.
- Phần tử được chọn bởi lớp giả {{cssxref(":fullscreen")}} khi được mở bằng API `requestFullscreen()`.

## Ví dụ

### Tạo kiểu hộp thoại modal

Ví dụ này tạo kiểu cho một hộp thoại modal mở ra khi nút "Update details" được kích hoạt. Ví dụ này được xây dựng dựa trên [ví dụ](/vi/docs/Web/HTML/Reference/Elements/dialog#handling_the_return_value_from_the_dialog) của phần tử {{HTMLElement("dialog")}}.

```html hidden
<!-- Basic modal dialog containing a form -->
<dialog id="favDialog">
  <form method="dialog">
    <p>
      <label
        >Favorite animal:
        <select>
          <option value="default">Choose…</option>
          <option>Brine shrimp</option>
          <option>Red panda</option>
          <option>Spider monkey</option>
        </select>
      </label>
    </p>
    <div>
      <button value="cancel">Cancel</button>
      <button id="confirmBtn" value="default">Confirm</button>
    </div>
  </form>
</dialog>
<p>
  <button id="updateDetails">Update details</button>
</p>
<output></output>
```

#### CSS

```css
:modal {
  border: 5px solid red;
  background-color: yellow;
  box-shadow: 3px 3px 10px rgb(0 0 0 / 50%);
}
```

```js hidden
const updateButton = document.getElementById("updateDetails");
const favDialog = document.getElementById("favDialog");
const outputBox = document.querySelector("output");
const selectEl = favDialog.querySelector("select");
const confirmBtn = favDialog.querySelector("#confirmBtn");

// If a browser doesn't support the dialog, then hide the
// dialog contents by default.
if (typeof favDialog.showModal !== "function") {
  favDialog.hidden = true;
  // Your fallback script
}
// "Update details" button opens the <dialog> modally
updateButton.addEventListener("click", () => {
  if (typeof favDialog.showModal === "function") {
    favDialog.showModal();
  } else {
    outputBox.value = "Sorry, the dialog API is not supported by this browser.";
  }
});
// "Favorite animal" input sets the value of the submit button
selectEl.addEventListener("change", (e) => {
  confirmBtn.value = selectEl.value;
});
// "Confirm" button of form triggers "close" on dialog because of [method="dialog"]
favDialog.addEventListener("close", () => {
  outputBox.value = `${
    favDialog.returnValue
  } button clicked - ${new Date().toString()}`;
});
```

### Kết quả

{{EmbedLiveSample("Styling_a_modal_dialog", "100%", 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử [`dialog`](/vi/docs/Web/HTML/Reference/Elements/dialog)
- Các lớp giả trạng thái hiển thị phần tử khác: {{CSSxRef(":fullscreen")}} và {{CSSxRef(":picture-in-picture")}}
- Danh sách đầy đủ các [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
