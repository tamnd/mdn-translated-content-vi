---
title: "PaymentAddress: thuộc tính addressLine"
short-title: addressLine
slug: Web/API/PaymentAddress/addressLine
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.PaymentAddress.addressLine
---

{{APIRef("Payment Request API")}}{{SecureContext_Header}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`addressLine`** của giao diện {{domxref('PaymentAddress')}} là một mảng các chuỗi, mỗi chuỗi chỉ định một dòng của địa chỉ không được bao gồm trong một trong các thuộc tính khác của `PaymentAddress`.

Các dòng này có thể bao gồm tên đường phố, số nhà, số căn hộ, tuyến giao hàng nông thôn, hướng dẫn mô tả, hoặc hộp thư bưu điện.

## Giá trị

Một mảng các chuỗi, mỗi chuỗi chứa một dòng của địa chỉ. Ví dụ, mảng `addressLine` cho Mozilla Space ở London sẽ có các mục sau:

| Chỉ số | Giá trị addressLine[]     |
| ------ | ------------------------- |
| 0      | Metal Box Factory         |
| 1      | Suite 441, 4th floor      |
| 2      | 30 Great Guildford Street |

Kết hợp với các giá trị bổ sung cho các thuộc tính khác của {{domxref("PaymentAddress")}}, những dòng này sẽ đại diện cho địa chỉ đầy đủ, đó là:

Mozilla
Metal Box Factory
Suite 441, 4th floor
30 Great Guildford Street
London SE1 0HS
United Kingdom

## Tương thích trình duyệt

{{Compat}}
