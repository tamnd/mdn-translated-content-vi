---
title: "Selection: thuộc tính type"
short-title: type
slug: Web/API/Selection/type
page-type: web-api-instance-property
browser-compat: api.Selection.type
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("Selection")}} trả về một chuỗi mô tả kiểu của vùng chọn hiện tại.

## Giá trị

Một chuỗi mô tả kiểu của vùng chọn hiện tại. Các giá trị có thể là:

- `None`
  - : Hiện chưa có vùng chọn nào được tạo.
- `Caret`
  - : Vùng chọn đã được thu gọn (tức là caret đang đặt tại một vị trí văn bản nào đó, nhưng chưa có range nào được chọn).
- `Range`
  - : Một range đã được chọn.

## Ví dụ

Trong ví dụ này, bộ xử lý sự kiện sẽ chạy mỗi khi có một vùng chọn mới được tạo. `console.log(selection.type)` sẽ trả về `Caret` hoặc `Range` tùy thuộc vào việc caret được đặt tại một điểm duy nhất trong văn bản hay một range đã được chọn.

```js
let selection;

document.onselectionchange = () => {
  console.log("New selection made");
  selection = document.getSelection();
  console.log(selection.type);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}
