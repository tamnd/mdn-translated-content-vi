---
title: "HTMLTextAreaElement: selectionEnd property"
short-title: selectionEnd
slug: Web/API/HTMLTextAreaElement/selectionEnd
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.selectionEnd
---

{{APIRef("HTML DOM")}}

Thuộc tính **`selectionEnd`** của giao diện {{domxref("HTMLTextAreaElement")}} chỉ định vị trí kết thúc của vùng chọn văn bản hiện tại trong phần tử {{HTMLElement("textarea")}}. Đây là một số đại diện cho chỉ mục cuối của văn bản được chọn. Thuộc tính này có thể được dùng để vừa lấy vừa đặt chỉ mục của phần cuối văn bản được chọn trong `<textarea>`.

Khi không có gì được chọn, giá trị của cả {{domxref("HTMLTextAreaElement.selectionStart", "selectionStart")}} và `selectionEnd` là vị trí của con trỏ nhập (caret) bên trong phần tử `<textarea>`.

Đặt `selectionEnd` thành một giá trị nhỏ hơn giá trị hiện tại của {{domxref("HTMLTextAreaElement.selectionStart", "selectionStart")}} sẽ cập nhật cả hai thuộc tính `selectionEnd` và `selectionStart` thành giá trị đó. Nếu cả hai giá trị đều nhỏ hơn 0, cả hai thuộc tính sẽ được đặt thành giá trị của thuộc tính {{domxref("HTMLTextAreaElement.textLength", "textLength")}}.

Giá trị thuộc tính có thể được lấy và đặt mà không cần `<textarea>` có focus, nhưng phần tử vẫn cần có focus để pseudo-element {{cssxref("::selection")}} khớp với văn bản được chọn.

Đặt `selectionEnd` thành một giá trị mới sẽ kích hoạt các sự kiện {{domxref("HTMLTextAreaElement.selectionchange_event", "selectionchange")}} và {{domxref("HTMLTextAreaElement.select_event", "select")}}.

## Giá trị

Một số không âm.

## Ví dụ

```js
const textarea = document.getElementById("text-box");
const end = textarea.selectionEnd;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{domxref("HTMLTextAreaElement")}}
- {{domxref("HTMLTextAreaElement.selectionStart")}}
- {{domxref("HTMLTextAreaElement.selectionDirection")}}
- {{domxref("HTMLTextAreaElement.textLength")}}
- {{domxref("HTMLTextAreaElement.selectionchange_event", "selectionchange")}} event
- {{domxref("HTMLTextAreaElement.select()")}}
- {{domxref("HTMLTextAreaElement.setSelectionRange()")}}
- {{domxref("HTMLTextAreaElement.setRangeText()")}}
- {{domxref("HTMLInputElement.selectionEnd")}}
- {{domxref("Selection")}}
- Pseudo-element {{cssxref("::selection")}}
