---
title: "Thuộc tính country của ContactAddress"
short-title: country
slug: Web/API/ContactAddress/country
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ContactAddress.country
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`country`** của giao diện {{domxref("ContactAddress")}} là một chuỗi xác định quốc gia của địa chỉ bằng tiêu chuẩn [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Chuỗi này luôn ở dạng chữ hoa chuẩn tắc.

Một vài ví dụ về giá trị `country` hợp lệ: `"US"`, `"GB"`, `"CN"` hoặc `"JP"`.

## Giá trị

Một chuỗi chứa mã ISO3166-1 alpha-2 xác định quốc gia nơi địa chỉ tọa lạc, hoặc một chuỗi rỗng nếu không có thông tin quốc gia. Trong nhiều trường hợp, điều này có thể được hiểu là "cùng quốc gia với chủ sở hữu trang web".

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
