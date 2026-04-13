---
title: GeolocationPositionError
slug: Web/API/GeolocationPositionError
page-type: web-api-interface
browser-compat: api.GeolocationPositionError
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

Giao diện **`GeolocationPositionError`** đại diện cho lý do của lỗi xảy ra khi sử dụng thiết bị định vị địa lý.

## Thuộc tính phiên bản

_Giao diện `GeolocationPositionError` không kế thừa bất kỳ thuộc tính nào._

- {{domxref("GeolocationPositionError.code")}} {{ReadOnlyInline}}
  - : Trả về `unsigned short` đại diện cho mã lỗi. Các giá trị có thể bao gồm:

    | Giá trị | Hằng số liên quan      | Mô tả                                                                                                                                                                            |
    | ------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `1`     | `PERMISSION_DENIED`    | Việc thu thập thông tin vị trí địa lý thất bại do trang không có các quyền cần thiết, ví dụ vì nó bị chặn bởi [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) |
    | `2`     | `POSITION_UNAVAILABLE` | Việc thu thập vị trí địa lý thất bại do ít nhất một nguồn nội bộ của vị trí trả về lỗi nội bộ.                                                                                   |
    | `3`     | `TIMEOUT`              | Thời gian được phép thu thập vị trí địa lý đã hết trước khi thông tin được lấy.                                                                                                  |

- {{domxref("GeolocationPositionError.message")}} {{ReadOnlyInline}}
  - : Trả về chuỗi có thể đọc được bởi con người mô tả chi tiết về lỗi. Các thông số kỹ thuật lưu ý rằng điều này chủ yếu được thiết kế để sử dụng trong gỡ lỗi, không được hiển thị trực tiếp trong giao diện người dùng.

## Phương thức phiên bản

_Giao diện `GeolocationPositionError` không triển khai hoặc kế thừa bất kỳ phương thức nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- {{domxref("Geolocation")}}
