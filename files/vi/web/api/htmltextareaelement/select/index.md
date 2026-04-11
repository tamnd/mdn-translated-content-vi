---
title: "HTMLTextAreaElement: select() method"
short-title: select()
slug: Web/API/HTMLTextAreaElement/select
page-type: web-api-instance-method
browser-compat: api.HTMLTextAreaElement.select
---

{{APIRef("HTML DOM")}}

Phương thức **`select()`** của giao diện {{domxref("HTMLTextAreaElement")}} chọn toàn bộ nội dung của phần tử {{htmlelement("textarea")}}. Ngoài ra, sự kiện {{domxref("HTMLTextAreaElement.select_event", "select")}} cũng được kích hoạt. Phương thức `select()` không nhận tham số nào và không trả về giá trị.

## Cú pháp

```js-nolint
select()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const textarea = document.getElementById("text-box");
textarea.select();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- Sự kiện {{domxref("HTMLTextAreaElement/select_event", "select")}}
- {{domxref("EventTarget.addEventListener", "addEventListener()")}}
- Pseudo-element CSS {{cssxref("::selection")}}
