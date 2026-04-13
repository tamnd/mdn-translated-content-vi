---
title: "GeolocationCoordinates: thuộc tính heading"
short-title: heading
slug: Web/API/GeolocationCoordinates/heading
page-type: web-api-instance-property
browser-compat: api.GeolocationCoordinates.heading
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

Thuộc tính chỉ đọc **`heading`** của giao diện {{domxref("GeolocationCoordinates")}} là một `double` đại diện cho hướng mà thiết bị đang di chuyển. Giá trị này, được xác định bằng độ, cho biết thiết bị lệch khỏi hướng bắc đích thực bao nhiêu. `0` độ đại diện cho bắc thực, và hướng được xác định theo chiều kim đồng hồ (nghĩa là đông là `90` độ và tây là `270` độ). Nếu {{domxref("GeolocationCoordinates.speed")}} là `0` hoặc thiết bị không thể cung cấp thông tin hướng, `heading` sẽ là `null`.

## Giá trị

Một `double` đại diện cho hướng mà thiết bị đang di chuyển.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- {{domxref("GeolocationCoordinates")}}
