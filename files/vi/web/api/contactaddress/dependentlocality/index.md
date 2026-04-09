---
title: "Thuộc tính dependentLocality của ContactAddress"
short-title: dependentLocality
slug: Web/API/ContactAddress/dependentLocality
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ContactAddress.dependentLocality
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`dependentLocality`** của giao diện {{domxref("ContactAddress")}} là một chuỗi chứa định danh địa phương hoặc khu vực con trong một thành phố, chẳng hạn như khu phố, quận, khu vực, hoặc, tại Vương quốc Anh, dependent locality. Thuộc tính này cũng được gọi là _post town_.

## Giá trị

Một chuỗi cho biết phần khu vực con của địa chỉ. Chuỗi này có thể rỗng nếu không có hoặc không cần khu vực con. Nó được dùng để loại bỏ nhập nhằng khi một thành phố có thể bao gồm nhiều khu vực trùng tên đường.

Khu vực con là một vùng bên trong thành phố, chẳng hạn như khu phố, quận hoặc khu vực. Tại Vương quốc Anh, thuộc tính này được dùng để chỉ **post town** (được Royal Mail chính thức gọi là **dependent locality**). Đây là một đặc điểm giúp phân biệt địa chỉ tại những nơi một thành phố có thể có nhiều khu vực trùng tên đường.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
