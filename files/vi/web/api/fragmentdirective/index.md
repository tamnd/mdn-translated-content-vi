---
title: FragmentDirective
slug: Web/API/FragmentDirective
page-type: web-api-interface
browser-compat: api.FragmentDirective
---

{{APIRef("URL Fragment Text Directives")}}

Giao diện **`FragmentDirective`** là một đối tượng được cung cấp để cho phép mã kiểm tra xem trình duyệt có hỗ trợ [text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments) hay không.

Truy cập thông qua thuộc tính {{domxref("Document.fragmentDirective")}}.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

Không có.

## Ví dụ

### Kiểm tra xem text fragments có được hỗ trợ không

Đoạn mã dưới đây ghi nhật ký xem text fragments có được hỗ trợ trong trình duyệt của bạn hay không bằng cách kiểm tra rằng {{domxref("Document.fragmentDirective")}} được xác định. Lưu ý rằng đối tượng này rỗng và hiện tại chủ yếu được dùng để phát hiện tính năng. Trong tương lai, nó có thể chứa thêm thông tin khác.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}
```

```css hidden
#log {
  height: 20px;
}
```

```js
if (document.fragmentDirective) {
  log("Your browser supports text fragments.");
} else {
  log("Text fragments are not supported in your browser.");
}
```

{{EmbedLiveSample("Checking if text fragments are supported","100%","30px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::target-text")}}
