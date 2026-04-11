---
title: "HTMLElement: thuộc tính editContext"
short-title: editContext
slug: Web/API/HTMLElement/editContext
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLElement.editContext
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính **`editContext`** của giao diện {{domxref("HTMLElement")}} lấy và đặt đối tượng {{domxref("EditContext")}} liên kết với phần tử.

{{domxref("EditContext API", "", "", "nocode")}} có thể được dùng để xây dựng các trình soạn thảo văn bản phong phú trên web, hỗ trợ các trải nghiệm nhập văn bản nâng cao như soạn thảo bằng {{glossary("Input Method Editor")}} (IME), bộ chọn emoji, hoặc bất kỳ giao diện người dùng liên quan đến chỉnh sửa nào khác dành riêng cho nền tảng.

## Giá trị

Một đối tượng {{domxref("EditContext")}} hoặc `null`.

### Các phần tử có thể dùng

Đặt thuộc tính `editContext` chỉ hoạt động trên một số loại phần tử nhất định:

- Một trong các phần tử HTML sau: [`<article>`](/en-US/docs/Web/HTML/Reference/Elements/article), [`<aside>`](/en-US/docs/Web/HTML/Reference/Elements/aside), [`<blockquote>`](/en-US/docs/Web/HTML/Reference/Elements/blockquote), [`<body>`](/en-US/docs/Web/HTML/Reference/Elements/body), [`<div>`](/en-US/docs/Web/HTML/Reference/Elements/div), [`<footer>`](/en-US/docs/Web/HTML/Reference/Elements/footer), [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), [`<h2>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), [`<h3>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), [`<h4>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), [`<h5>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), [`<h6>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), [`<header>`](/en-US/docs/Web/HTML/Reference/Elements/header), [`<main>`](/en-US/docs/Web/HTML/Reference/Elements/main), [`<nav>`](/en-US/docs/Web/HTML/Reference/Elements/nav), [`<p>`](/en-US/docs/Web/HTML/Reference/Elements/p), [`<section>`](/en-US/docs/Web/HTML/Reference/Elements/section), hoặc [`<span>`](/en-US/docs/Web/HTML/Reference/Elements/span).
- Một [phần tử tùy chỉnh](/en-US/docs/Web/API/Web_components/Using_custom_elements) hợp lệ.
- Một phần tử [`<canvas>`](/en-US/docs/Web/HTML/Reference/Elements/canvas).

Nếu bạn cố đặt thuộc tính `editContext` trên một phần tử không thuộc các loại trên, sẽ có một {{domxref("DOMException")}} `NotSupportedError` được ném ra.

### Liên kết phần tử

Đặt thuộc tính `editContext` của một phần tử thành một đối tượng {{domxref("EditContext")}} sẽ liên kết phần tử đó với đối tượng `EditContext`.

Mối liên kết là một-một:

- Một phần tử chỉ có thể liên kết với một đối tượng `EditContext`.
- Một đối tượng `EditContext` chỉ có thể liên kết với một phần tử.

Nếu bạn cố liên kết một đối tượng `EditContext` đã liên kết với một phần tử khác, sẽ có {{domxref("DOMException")}} được ném ra.

Nếu bạn cố liên kết một đối tượng `EditContext` khác với một phần tử đã liên kết, cũng sẽ có {{domxref("DOMException")}} được ném ra.

Để kiểm tra xem một phần tử đã liên kết với đối tượng `EditContext` hay chưa, hãy dùng phương thức {{domxref("EditContext.attachedElements()")}}.

### Thu gom rác

Một đối tượng `EditContext` sẽ giữ phần tử liên kết còn sống nếu nó có các tham chiếu đang hoạt động khác, ngay cả khi phần tử liên kết đã bị xóa khỏi DOM.

Nếu bạn muốn đảm bảo phần tử được thu gom rác, hãy xóa thuộc tính `editContext` của phần tử.

## Ví dụ

### Đặt thuộc tính `editContext` của phần tử

Ví dụ này cho thấy cách đặt thuộc tính `editContext` của một phần tử `<canvas>` thành một đối tượng `EditContext` mới để làm cho phần tử có thể chỉnh sửa.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const canvas = document.getElementById("editor-canvas");
const editContext = new EditContext();
canvas.editContext = editContext;
```

### Xóa thuộc tính `editContext` của phần tử

Ví dụ này cho thấy cách xóa thuộc tính `editContext` của một phần tử `<canvas>` có thể chỉnh sửa để xóa phần tử khỏi DOM một cách an toàn.

```html
<canvas id="editor-canvas"></canvas>
```

```js
// Create the EditContext and associate it with the canvas element.
const canvas = document.getElementById("editor-canvas");
const editContext = new EditContext();
canvas.editContext = editContext;

// Later, clear the editContext property, and remove the element.
canvas.editContext = null;
canvas.remove();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}}.
