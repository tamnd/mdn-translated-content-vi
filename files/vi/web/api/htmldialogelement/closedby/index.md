---
title: "HTMLDialogElement: thuộc tính closedBy"
short-title: closedBy
slug: Web/API/HTMLDialogElement/closedBy
page-type: web-api-instance-property
browser-compat: api.HTMLDialogElement.closedBy
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`closedBy`** của giao diện {{domxref("HTMLDialogElement")}} cho biết các loại hành động của người dùng có thể dùng để đóng phần tử {{htmlelement("dialog")}} liên quan. Nó đặt hoặc trả về giá trị thuộc tính [`closedby`](/en-US/docs/Web/HTML/Reference/Elements/dialog#closedby) của hộp thoại.

## Giá trị

Một chuỗi; các giá trị có thể là:

- `any`
  - : Hộp thoại có thể được đóng bằng một hành động dismiss nhẹ, một hành động cụ thể của nền tảng, hoặc một cơ chế do nhà phát triển chỉ định.
- `closerequest`
  - : Hộp thoại có thể được đóng bằng một hành động cụ thể của nền tảng hoặc một cơ chế do nhà phát triển chỉ định.
- `none`
  - : Hộp thoại chỉ có thể được đóng bằng một cơ chế do nhà phát triển chỉ định.

### Hành vi mặc định

Nếu thuộc tính `closedby` vắng mặt hoặc không hợp lệ, nó sẽ quay về trạng thái **Auto**. Ở trạng thái **Auto**:

- khi `<dialog>` được mở bằng `showModal()`, nó hoạt động như thể: `closedby="closerequest"`
- khi `<dialog>` được mở bằng bất kỳ cách nào khác, nó hoạt động như thể: `closedby="none"`

## Ví dụ

### Cách sử dụng `closedBy` cơ bản

```html
<dialog closedby="any">
  <p>
    Có thể đóng bằng phím <kbd>Esc</kbd>, hoặc bằng cách nhấp bên ngoài hộp thoại ("light dismiss").
  </p>
</dialog>
```

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const dialog = document.querySelector("dialog");
dialog.showModal();
log(`closedBy: ${dialog.closedBy}`);
```

### Kết quả

{{ EmbedLiveSample('Basic `closedBy` usage', '100%', '250px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
