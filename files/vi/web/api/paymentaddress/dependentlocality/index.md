---
title: "PaymentAddress: thuộc tính dependentLocality"
short-title: dependentLocality
slug: Web/API/PaymentAddress/dependentLocality
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.PaymentAddress.dependentLocality
---

{{APIRef("Payment Request API")}}{{SecureContext_Header}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`dependentLocality`** của giao diện {{domxref('PaymentAddress')}} là một chuỗi chứa tên địa phương con trong một thành phố, chẳng hạn khu phố, quận, huyện, hoặc ở Vương quốc Anh là địa phương phụ thuộc. Còn được gọi là _thị trấn bưu chính_.

## Giá trị

Một chuỗi cho biết phần địa phương con của địa chỉ. Đây có thể là chuỗi rỗng nếu không có hoặc không cần địa phương con. Nó được sử dụng để phân biệt khi một thành phố có thể bao gồm các khu vực có tên đường trùng lặp.

Địa phương con là một khu vực trong một thành phố, chẳng hạn khu phố, quận, hoặc huyện. Ở Vương quốc Anh, đây được sử dụng để chỉ **thị trấn bưu chính** (được Royal Mail gọi chính thức là **địa phương phụ thuộc**). Đây là tính năng phân biệt của các địa chỉ ở những nơi mà một thành phố có thể có các khu vực có tên đường trùng lặp.

## Tương thích trình duyệt

{{Compat}}
