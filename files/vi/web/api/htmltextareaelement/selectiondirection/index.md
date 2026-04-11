---
title: "HTMLTextAreaElement: selectionDirection property"
short-title: selectionDirection
slug: Web/API/HTMLTextAreaElement/selectionDirection
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.selectionDirection
---

<!--  -->

{{APIRef("HTML DOM")}}

Thuộc tính **`selectionDirection`** của giao diện {{domxref("HTMLTextAreaElement")}} chỉ định hướng hiện tại của vùng chọn. Các giá trị có thể là `"forward"`, `"backward"` và `"none"`. Giá trị `forward` cho biết vùng chọn được tạo theo hướng từ đầu đến cuối của ngôn ngữ hiện tại, còn `backward` cho biết hướng ngược lại. Giá trị `none` xuất hiện nếu hướng không xác định. Thuộc tính này có thể được dùng để vừa lấy vừa thay đổi hướng của văn bản được chọn trong `<textarea>`.

Đặt `selectionDirection` thành giá trị mới sẽ kích hoạt các sự kiện {{domxref("HTMLTextAreaElement.selectionchange_event", "selectionchange")}} và {{domxref("HTMLTextAreaElement.select_event", "select")}}.

## Giá trị

Một chuỗi; `"forward"`, `"backward"`, hoặc `"none"`.

## Ví dụ

```js
const textarea = document.getElementById("text-box");
const end = textarea.selectionDirection;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{domxref("HTMLTextAreaElement")}}
- {{domxref("HTMLTextAreaElement.selectionStart")}}
- {{domxref("HTMLTextAreaElement.selectionEnd")}}
- {{domxref("HTMLTextAreaElement.textLength")}}
- {{domxref("HTMLTextAreaElement.select()")}}
- {{domxref("HTMLTextAreaElement.setSelectionRange()")}}
- {{domxref("HTMLTextAreaElement.setRangeText()")}}
- {{domxref("HTMLInputElement.selectionDirection")}}
- {{domxref("Selection")}}
- Pseudo-element {{cssxref("::selection")}}
