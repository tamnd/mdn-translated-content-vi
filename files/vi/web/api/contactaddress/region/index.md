---
title: "Thuộc tính region của ContactAddress"
short-title: region
slug: Web/API/ContactAddress/region
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ContactAddress.region
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`region`** của giao diện {{domxref("ContactAddress")}} trả về một chuỗi chứa đơn vị hành chính cấp cao nhất của quốc gia nơi địa chỉ tọa lạc. Đây có thể là bang, tỉnh, oblast hoặc prefecture.

## Giá trị

Một chuỗi chỉ định đơn vị hành chính cấp cao nhất bên trong quốc gia nơi địa chỉ tọa lạc. Khu vực này có các tên gọi khác nhau ở các quốc gia khác nhau, chẳng hạn như: state, province, oblast, prefecture hoặc county.

## Ghi chú sử dụng

Ở một số quốc gia, như Bỉ, người dùng hiếm khi cung cấp `region` như một phần của địa chỉ bưu chính. Trong những trường hợp đó, trình duyệt trả về một chuỗi rỗng làm giá trị của `region`. Dù vậy, địa chỉ đó vẫn nên chấp nhận được cho mục đích dự định của nó, ví dụ như giao hàng. Tuy nhiên, bạn vẫn nên luôn xác minh địa chỉ để bảo đảm thông tin người dùng cung cấp là dùng được.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
