---
title: "Document: thuộc tính fragmentDirective"
short-title: fragmentDirective
slug: Web/API/Document/fragmentDirective
page-type: web-api-instance-property
browser-compat: api.Document.fragmentDirective
---

{{APIRef("URL Fragment Text Directives")}}

Thuộc tính chỉ đọc **`fragmentDirective`** của giao diện {{domxref("Document")}} trả về {{domxref("FragmentDirective")}} cho tài liệu hiện tại.

## Giá trị

Một đối tượng {{domxref("FragmentDirective")}}.

## Ví dụ

### Kiểm tra xem text fragments có được hỗ trợ không

Đoạn mã dưới đây ghi log xem text fragments có được hỗ trợ trong trình duyệt của bạn hay không bằng cách kiểm tra sự tồn tại của đối tượng.
Lưu ý rằng đối tượng trống, và hiện tại nó chủ yếu dùng để phát hiện tính năng.
Trong tương lai, nó có thể bao gồm thông tin khác.

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
  log("Trình duyệt của bạn hỗ trợ text fragments.");
} else {
  log("Text fragments không được hỗ trợ trong trình duyệt của bạn.");
}
```

{{EmbedLiveSample("Checking if text fragments are supported","100%","30px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments)
- {{cssxref("::target-text")}}
