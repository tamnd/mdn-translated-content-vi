---
title: GeolocationPosition
slug: Web/API/GeolocationPosition
page-type: web-api-interface
browser-compat: api.GeolocationPosition
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

Giao diện **`GeolocationPosition`** đại diện cho vị trí của thiết bị liên quan tại một thời điểm nhất định. Vị trí, được biểu diễn bởi đối tượng {{domxref("GeolocationCoordinates")}}, bao gồm vị trí 2D của thiết bị trên một hình cầu đại diện cho Trái Đất, cũng như độ cao và tốc độ của nó.

## Thuộc tính phiên bản

_Giao diện `GeolocationPosition` không kế thừa thuộc tính nào._

- {{domxref("GeolocationPosition.coords")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("GeolocationCoordinates")}} xác định vị trí hiện tại.
- {{domxref("GeolocationPosition.timestamp")}} {{ReadOnlyInline}}
  - : Trả về dấu thời gian, được biểu thị dưới dạng {{Glossary("Unix time")}} tính bằng mili giây, đại diện cho thời điểm vị trí được lấy.

## Phương thức phiên bản

_Giao diện `GeolocationPosition` không kế thừa phương thức nào._

- {{domxref("GeolocationPosition.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `GeolocationPosition` và cho phép tuần tự hóa với {{jsxref("JSON.stringify()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- {{domxref("Geolocation")}}
