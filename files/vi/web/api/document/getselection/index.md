---
title: "Document: phương thức getSelection()"
short-title: getSelection()
slug: Web/API/Document/getSelection
page-type: web-api-instance-method
browser-compat: api.Document.getSelection
---

{{APIRef("DOM")}}

Phương thức **`getSelection()`** của giao diện {{DOMxRef("Document")}} trả về đối tượng {{DOMxRef("Selection")}} được liên kết với tài liệu này, đại diện cho phạm vi văn bản được chọn bởi người dùng, hoặc vị trí hiện tại của caret.

## Cú pháp

```js-nolint
getSelection()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{DOMxRef("Selection")}}, hoặc `null` nếu tài liệu không có [browsing context](/en-US/docs/Glossary/Browsing_context) (ví dụ: đó là tài liệu của một {{htmlelement("iframe")}} không được đính kèm với một tài liệu).

## Ví dụ

### Lấy đối tượng Selection

```js
const selection = document.getSelection();
const selRange = selection.getRangeAt(0);
// thực hiện các thao tác với range

console.log(selection); // Đối tượng Selection
```

### Biểu diễn chuỗi của đối tượng Selection

Một số hàm (như {{DOMxRef("Window.alert()")}}) gọi {{JSxRef("Object.toString", "toString()")}} tự động và giá trị trả về được truyền cho hàm. Do đó, điều này sẽ trả về văn bản đã chọn chứ không phải đối tượng `Selection`:

```js
alert(selection);
```

Tuy nhiên, không phải tất cả các hàm đều gọi `toString()` tự động. Để sử dụng đối tượng `Selection` dưới dạng chuỗi, hãy gọi phương thức `toString()` của nó trực tiếp:

```js
let selectedText = selection.toString();
```

## Các đối tượng liên quan

Bạn có thể gọi {{domxref("Window.getSelection()")}}, giống hệt với `window.document.getSelection()`.

Cũng đáng lưu ý rằng hiện tại `getSelection()` không hoạt động trên nội dung của các phần tử {{htmlelement("input")}} trong Firefox.
{{domxref("HTMLInputElement.setSelectionRange()")}}) có thể được sử dụng để khắc phục điều này.

Cũng lưu ý sự khác biệt giữa _selection_ (vùng chọn) và _focus_ (tiêu điểm).
{{domxref("Document.activeElement")}} trả về phần tử đang có tiêu điểm.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
