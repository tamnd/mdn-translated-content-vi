---
title: "HTMLTextAreaElement: selectionStart property"
short-title: selectionStart
slug: Web/API/HTMLTextAreaElement/selectionStart
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.selectionStart
---

{{APIRef("HTML DOM")}}

Thuộc tính **`selectionStart`** của giao diện {{domxref("HTMLTextAreaElement")}} chỉ định vị trí bắt đầu của vùng chọn văn bản hiện tại trong phần tử {{HTMLElement("textarea")}}. Đây là một số đại diện cho chỉ mục bắt đầu của văn bản được chọn. Thuộc tính này có thể được dùng để vừa lấy vừa đặt vị trí bắt đầu của văn bản được chọn trong `<textarea>`.

Khi không có gì được chọn, giá trị của cả `selectionStart` và {{domxref("HTMLTextAreaElement.selectionEnd", "selectionEnd")}} là vị trí của con trỏ nhập (caret) bên trong phần tử `<textarea>`.

Đặt `selectionStart` thành giá trị lớn hơn giá trị hiện tại của {{domxref("HTMLTextAreaElement.selectionEnd", "selectionEnd")}} sẽ cập nhật cả hai thuộc tính `selectionStart` và `selectionEnd` thành giá trị đó. Nếu giá trị đó bằng hoặc lớn hơn {{domxref("HTMLTextAreaElement.textLength", "textLength")}}, cả hai thuộc tính đều được đặt thành giá trị của thuộc tính `textLength`.

Giá trị thuộc tính có thể được lấy và đặt mà không cần `<textarea>` có focus, nhưng phần tử vẫn cần có focus để pseudo-element {{cssxref("::selection")}} khớp với văn bản được chọn.

Đặt `selectionStart` thành một giá trị mới sẽ kích hoạt các sự kiện {{domxref("HTMLTextAreaElement.selectionchange_event", "selectionchange")}} và {{domxref("HTMLTextAreaElement.select_event", "select")}}.

## Giá trị

Một số không âm.

## Ví dụ

```js
const textarea = document.getElementById("text-box");
const start = textarea.selectionStart;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{domxref("HTMLTextAreaElement")}}
- {{domxref("HTMLTextAreaElement.selectionEnd")}}
- {{domxref("HTMLTextAreaElement.selectionDirection")}}
- {{domxref("HTMLTextAreaElement.textLength")}}
- {{domxref("HTMLTextAreaElement.select()")}}
- {{domxref("HTMLTextAreaElement.setSelectionRange()")}}
- {{domxref("HTMLTextAreaElement.setRangeText()")}}
- {{domxref("HTMLInputElement.selectionStart")}}
- {{domxref("Selection")}}
- Pseudo-element {{cssxref("::selection")}}
