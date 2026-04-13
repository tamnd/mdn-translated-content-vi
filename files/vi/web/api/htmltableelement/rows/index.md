---
title: "HTMLTableElement: thuộc tính rows"
short-title: rows
slug: Web/API/HTMLTableElement/rows
page-type: web-api-instance-property
browser-compat: api.HTMLTableElement.rows
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`rows`** của {{domxref("HTMLTableElement")}} trả về một {{domxref("HTMLCollection")}} sống chứa tất cả các hàng trong bảng, bao gồm các hàng nằm trong bất kỳ phần tử {{HTMLElement("thead")}}, {{HTMLElement("tfoot")}}, và {{HTMLElement("tbody")}} nào.

Mặc dù bản thân thuộc tính là chỉ đọc, đối tượng được trả về là sống và cho phép sửa đổi nội dung của nó.

## Giá trị

Một {{domxref("HTMLCollection")}} cung cấp danh sách cập nhật theo thời gian thực của các đối tượng {{domxref("HTMLTableRowElement")}} đại diện cho tất cả các phần tử {{HTMLElement("tr")}} có trong bảng. Điều này cho phép truy cập nhanh vào tất cả các hàng của bảng mà không cần tìm kiếm thủ công.

## Ví dụ

```js
myRows = myTable.rows;
firstRow = myTable.rows[0];
lastRow = myTable.rows.item(myTable.rows.length - 1);
```

Ví dụ này cho thấy cách bạn có thể dùng cả truy cập theo chỉ mục và phương thức {{domxref("HTMLCollection.item()")}} để lấy từng hàng trong bảng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
