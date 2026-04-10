---
title: "Selection: phương thức containsNode()"
short-title: containsNode()
slug: Web/API/Selection/containsNode
page-type: web-api-instance-method
browser-compat: api.Selection.containsNode
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.containsNode()`** cho biết một nút cụ thể có là một phần của vùng chọn hay không.

## Cú pháp

```js-nolint
containsNode(node)
containsNode(node)
containsNode(node, partialContainment)
```

### Tham số

- `node`
  - : Nút đang được tìm trong vùng chọn.
- `partialContainment` {{optional_inline}}
  - : Khi `true`, `containsNode()` trả về `true` khi một phần của nút nằm trong vùng chọn. Khi `false`, `containsNode()` chỉ trả về `true` khi toàn bộ nút nằm trong vùng chọn. Nếu không chỉ định, giá trị mặc định `false` sẽ được dùng.

### Giá trị trả về

Trả về `true` nếu nút đã cho là một phần của vùng chọn, ngược lại trả về `false`.

## Ví dụ

### Kiểm tra vùng chọn

Đoạn mã này kiểm tra xem có nội dung nào bên trong phần tử body được chọn hay không.

```js
console.log(window.getSelection().containsNode(document.body, true));
```

### Tìm từ bí mật

Trong ví dụ này, một thông báo sẽ xuất hiện khi bạn chọn từ bí mật. Nó dùng {{domxref("EventTarget/addEventListener", "addEventListener()")}} để kiểm tra các sự kiện {{domxref("Document/selectionchange_event", "selectionchange")}}.

#### HTML

```html
<p>Can you find the secret word?</p>
<p>Hmm, where <span id="secret">SECRET</span> could it be?</p>
<p id="win" hidden>You found it!</p>
```

#### CSS

```css
#secret {
  color: transparent;
}
```

#### JavaScript

```js
const secret = document.getElementById("secret");
const win = document.getElementById("win");

// Lắng nghe thay đổi vùng chọn
document.addEventListener("selectionchange", () => {
  const selection = window.getSelection();
  const found = selection.containsNode(secret);

  win.toggleAttribute("hidden", !found);
});
```

#### Kết quả

{{EmbedLiveSample("Find_the_hidden_word")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
