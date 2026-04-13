---
title: "HTMLElement: thuộc tính contentEditable"
short-title: contentEditable
slug: Web/API/HTMLElement/contentEditable
page-type: web-api-instance-property
browser-compat: api.HTMLElement.contentEditable
---

{{APIRef("HTML DOM")}}

Thuộc tính **`contentEditable`** của giao diện {{domxref("HTMLElement")}} chỉ định xem phần tử có thể chỉnh sửa được hay không.

Thuộc tính liệt kê này có thể có các giá trị sau:

- `"true"` cho biết phần tử là `contenteditable` (có thể chỉnh sửa).
- `"false"` cho biết phần tử không thể chỉnh sửa.
- `"plaintext-only"` cho biết văn bản thô của phần tử có thể chỉnh sửa, nhưng định dạng văn bản phong phú bị vô hiệu hóa.

Bạn có thể sử dụng thuộc tính {{domxref("HTMLElement.isContentEditable")}} để kiểm tra giá trị logic đã tính toán của thuộc tính này.

Nếu thuộc tính bị thiếu hoặc giá trị của nó không hợp lệ, giá trị của nó sẽ được kế thừa từ phần tử cha: do đó phần tử có thể chỉnh sửa (hoặc không) dựa trên phần tử cha.

## Giá trị

Một chuỗi.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.isContentEditable")}}
- Thuộc tính toàn cục [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).
