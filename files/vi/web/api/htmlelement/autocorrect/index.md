---
title: "HTMLElement: thuộc tính autocorrect"
short-title: autocorrect
slug: Web/API/HTMLElement/autocorrect
page-type: web-api-instance-property
browser-compat: api.HTMLElement.autocorrect
---

{{APIRef("HTML DOM")}}

Thuộc tính **`autocorrect`** của giao diện {{domxref("HTMLElement")}} kiểm soát xem việc tự động sửa lỗi văn bản có được bật cho lỗi chính tả và/hoặc dấu câu hay không.

Hành vi tự động sửa lỗi cụ thể, bao gồm cả việc từ nào được thay thế, phụ thuộc vào tác nhân người dùng và các dịch vụ do thiết bị nền tảng cung cấp.
Ví dụ: trên macOS, tác nhân người dùng có thể dựa vào [văn bản và dấu câu thay thế đã đăng ký](https://support.apple.com/en-vn/guide/mac-help/mh35735/mac).
Các thiết bị và trình duyệt khác có thể sử dụng cách tiếp cận khác.

Thuộc tính này phản ánh giá trị của thuộc tính toàn cục HTML [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect).

## Giá trị

`true` nếu tự động sửa lỗi được bật cho phần tử và `false` nếu ngược lại.

## Ví dụ

### Bật và tắt tự động sửa lỗi

Ví dụ này cho thấy cách bạn có thể bật và tắt tự động sửa lỗi.

#### HTML

Đánh dấu HTML định nghĩa một nút bật/tắt và một phần tử {{htmlelement("input")}} thuộc [`type="search"`](/en-US/docs/Web/HTML/Reference/Elements/input/search).
Lưu ý rằng nếu tự động sửa lỗi được hỗ trợ, nó sẽ được bật theo mặc định.

```html
<button id="toggleAutocorrect">Chưa rõ</button>
<input type="search" id="searchinput" />
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Mã đầu tiên kiểm tra xem `autocorrect` có được hỗ trợ hay không bằng cách kiểm tra xem nó có tồn tại trên prototype của `HTMLElement` không.
Nếu có, một trình xử lý nhấp chuột được thêm vào để cho phép bạn chuyển đổi giá trị.
Nếu không có, giao diện người dùng ẩn các phần tử tương tác và ghi nhật ký rằng `autocorrect` không được hỗ trợ.

```js
const toggleButton = document.querySelector("button");
const searchInput = document.querySelector("#searchinput");

function setButtonText() {
  toggleButton.textContent = searchInput.autocorrect ? "Đã bật" : "Đã tắt";
  log(`autocorrect: ${searchInput.autocorrect}`);
}

if (`autocorrect` in HTMLElement.prototype) {
  setButtonText();

  toggleButton.addEventListener("click", (e) => {
    searchInput.autocorrect = !searchInput.autocorrect;
    setButtonText();
  });
} else {
  toggleButton.hidden = true;
  searchInput.hidden = true;
  log("autocorrect không được hỗ trợ");
}
```

#### Kết quả

<!-- cSpell:ignore Carot -->

Kích hoạt nút để chuyển đổi giá trị autocorrect.
Nhập văn bản không hợp lệ vào hộp văn bản, chẳng hạn như "Carot".
Khi autocorrect được bật và nếu việc triển khai có từ thay thế phù hợp "carrot", văn bản sẽ tự động được sửa.

{{EmbedLiveSample("Enable and disable autocorrection", "100%", "200")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính toàn cục HTML [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize)
