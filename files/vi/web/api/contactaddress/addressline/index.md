---
title: "Thuộc tính addressLine của ContactAddress"
short-title: addressLine
slug: Web/API/ContactAddress/addressLine
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ContactAddress.addressLine
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`addressLine`** của giao diện {{domxref("ContactAddress")}} là một mảng chuỗi, trong đó mỗi chuỗi chỉ định một dòng của địa chỉ không thuộc phạm vi của các thuộc tính khác của `ContactAddress`. Mảng này có thể bao gồm tên đường, số nhà, số căn hộ, tuyến phát hàng vùng nông thôn, chỉ dẫn mô tả hoặc hộp thư bưu điện.

## Giá trị

Một mảng chuỗi, trong đó mỗi phần tử chứa một dòng của địa chỉ. Ví dụ, thuộc tính `addressLine` cho Mozilla Space ở London sẽ có các mục sau:

| Chỉ mục | Giá trị `addressLine[]`   |
| ------- | ------------------------- |
| 0       | Metal Box Factory         |
| 1       | Suite 441, 4th floor      |
| 2       | 30 Great Guildford Street |

Khi kết hợp với các giá trị bổ sung cho những thuộc tính khác của {{domxref("ContactAddress")}}, chúng sẽ biểu diễn đầy đủ địa chỉ sau:

```plain
Mozilla
Metal Box Factory
Suite 441, 4th floor
30 Great Guildford Street
London SE1 0HS
United Kingdom
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
