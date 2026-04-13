---
title: "Document: thuộc tính activeElement"
short-title: activeElement
slug: Web/API/Document/activeElement
page-type: web-api-instance-property
browser-compat: api.Document.activeElement
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`activeElement`** của giao diện {{domxref("Document")}} trả về {{domxref("Element")}} trong DOM đang nhận các sự kiện bàn phím như {{domxref("Element/keydown_event", "keydown")}} và {{domxref("Element/keyup_event", "keyup")}}. Thuộc tính này thường tương đương với phần tử đang được focus.

Các phần tử nào có thể được focus thay đổi tùy thuộc vào nền tảng và cấu hình hiện tại của trình duyệt. Ví dụ: trên Safari, theo hành vi của macOS, các phần tử không phải là phần tử nhập văn bản sẽ không thể được focus theo mặc định, trừ khi cài đặt "Full Keyboard Access" được bật trong System Settings.

Thông thường, người dùng có thể nhấn phím <kbd>Tab</kbd> để di chuyển focus quanh trang giữa các phần tử có thể focus và sử dụng các phím tắt bàn phím như <kbd>Space</kbd> hoặc <kbd>Enter</kbd> để mô phỏng thao tác nhấp vào phần tử đang được focus.

> [!NOTE]
> Focus (phần tử nào đang nhận sự kiện đầu vào của người dùng) không giống như selection (phần được đánh dấuhighlight hiện tại của tài liệu). Bạn có thể lấy selection hiện tại bằng cách sử dụng {{domxref("window.getSelection()")}}.

## Giá trị

{{domxref('Element')}} sâu nhất hiện đang có focus.

- Nếu phần tử đang được focus nằm trong một shadow tree bên trong tài liệu hiện tại (ví dụ: phần tử đang được focus nằm bên trong `iframe`, và `document` gọi chứa iframe đó), thì đây sẽ là phần tử gốc của tree đó (trong ví dụ này là `iframe`).
- Nếu phần tử đang được focus nằm trong một document tree không phải là con cháu của tài liệu hiện tại (ví dụ: phần tử đang được focus nằm trong tài liệu chính, và `document` gọi là một iframe được nhúng), thì đây sẽ là `null`.
- Nếu không có phần tử nào đang được focus, đây là {{domxref("Document.body")}} hoặc {{domxref("Document.documentElement")}}.

## Ví dụ

### HTML

```html
<p>Select some text from one of the text areas below:</p>

<form>
  <textarea name="ta-example-one" id="ta-example-one" rows="7" cols="40">
This is Text Area One. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt, lorem a porttitor molestie, odio nibh iaculis libero, et accumsan nunc orci eu dui.</textarea
  >
  <textarea name="ta-example-two" id="ta-example-two" rows="7" cols="40">
This is Text Area Two. Fusce ullamcorper, nisl ac porttitor adipiscing, urna orci egestas libero, ut accumsan orci lacus laoreet diam. Morbi sed euismod diam.</textarea
  >
</form>

<p>Active element ID: <em id="output-element"></em></p>
<p>Selected text: <em id="output-text"></em></p>
```

### JavaScript

```js
function onMouseUp(e) {
  const activeTextarea = document.activeElement;
  const selection = activeTextarea.value.substring(
    activeTextarea.selectionStart,
    activeTextarea.selectionEnd,
  );

  const outputElement = document.getElementById("output-element");
  const outputText = document.getElementById("output-text");
  outputElement.textContent = activeTextarea.id;
  outputText.textContent = selection;
}

const textarea1 = document.getElementById("ta-example-one");
const textarea2 = document.getElementById("ta-example-two");
textarea1.addEventListener("mouseup", onMouseUp);
textarea2.addEventListener("mouseup", onMouseUp);
```

### Kết quả

{{ EmbedLiveSample('Examples', '400', '400') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.hasFocus()")}}
