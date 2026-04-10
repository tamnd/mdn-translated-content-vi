---
title: GeolocationCoordinates
slug: Web/API/GeolocationCoordinates
page-type: web-api-interface
browser-compat: api.GeolocationCoordinates
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

Giao diện **`GeolocationCoordinates`** đại diện cho vị trí và độ cao của thiết bị trên Trái Đất, cũng như độ chính xác khi các thuộc tính này được tính toán.
Thông tin vị trí địa lý được cung cấp theo hệ tọa độ World Geodetic System (WGS84).

## Thuộc tính thể hiện

_Giao diện `GeolocationCoordinates` không kế thừa bất kỳ thuộc tính nào._

- {{domxref("GeolocationCoordinates.latitude")}} {{ReadOnlyInline}}
  - : Trả về một `double` đại diện cho vĩ độ của vị trí theo độ thập phân.
- {{domxref("GeolocationCoordinates.longitude")}} {{ReadOnlyInline}}
  - : Trả về một `double` đại diện cho kinh độ của vị trí theo độ thập phân.
- {{domxref("GeolocationCoordinates.altitude")}} {{ReadOnlyInline}}
  - : Trả về một `double` đại diện cho độ cao của vị trí tính bằng mét, so với mực nước biển danh nghĩa. Giá trị này có thể là `null` nếu triển khai không thể cung cấp dữ liệu.
- {{domxref("GeolocationCoordinates.accuracy")}} {{ReadOnlyInline}}
  - : Trả về một `double` đại diện cho độ chính xác của các thuộc tính `latitude` và `longitude`, được biểu thị bằng mét.
- {{domxref("GeolocationCoordinates.altitudeAccuracy")}} {{ReadOnlyInline}}
  - : Trả về một `double` đại diện cho độ chính xác của `altitude` được biểu thị bằng mét. Giá trị này có thể là `null` nếu triển khai không thể cung cấp dữ liệu.
- {{domxref("GeolocationCoordinates.heading")}} {{ReadOnlyInline}}
  - : Trả về một `double` đại diện cho hướng mà thiết bị đang quay về. Giá trị này, được xác định bằng độ, cho biết thiết bị lệch khỏi hướng bắc thực bao nhiêu. `0` độ đại diện cho bắc thực, và hướng được xác định theo chiều kim đồng hồ (nghĩa là đông là `90` độ và tây là `270` độ). Nếu `speed` là `0` hoặc thiết bị không thể cung cấp thông tin `heading`, `heading` sẽ là `null`.
- {{domxref("GeolocationCoordinates.speed")}} {{ReadOnlyInline}}
  - : Trả về một `double` đại diện cho vận tốc của thiết bị tính bằng mét trên giây. Giá trị này có thể là `null`.

## Phương thức thể hiện

_Giao diện `GeolocationCoordinates` không kế thừa bất kỳ phương thức nào._

- {{domxref("GeolocationCoordinates.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `GeolocationCoordinates` và cho phép tuần tự hóa bằng {{jsxref("JSON.stringify()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- {{domxref("Geolocation")}}
