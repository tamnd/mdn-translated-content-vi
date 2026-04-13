---
title: "Selection: thuộc tính isCollapsed"
short-title: isCollapsed
slug: Web/API/Selection/isCollapsed
page-type: web-api-instance-property
browser-compat: api.Selection.isCollapsed
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Selection.isCollapsed`** trả về một giá trị boolean cho biết hiện có văn bản nào đang được chọn hay không. Không có văn bản nào được chọn khi điểm bắt đầu và điểm kết thúc của vùng chọn nằm ở cùng một vị trí trong nội dung.

Hãy nhớ rằng một vùng chọn đã thu gọn vẫn có thể có một hoặc nhiều {{domxref("Range")}} (trong Gecko), vì vậy {{domxref("Selection.rangeCount")}} có thể không bằng 0. Trong trường hợp đó, gọi phương thức {{domxref("Selection")}} object's {{domxref("Selection.getRangeAt", "getRangeAt()")}} có thể trả về một đối tượng `Range` đã được thu gọn.

## Giá trị

Một giá trị boolean.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}
- {{domxref("Range")}}
