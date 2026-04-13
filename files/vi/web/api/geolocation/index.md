---
title: Geolocation
slug: Web/API/Geolocation
page-type: web-api-interface
browser-compat: api.Geolocation
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

**`Geolocation`** là một giao diện đại diện cho một đối tượng có thể lấy vị trí của thiết bị theo cách lập trình. Nó cho nội dung web quyền truy cập vào vị trí của thiết bị. Điều này cho phép một website hoặc ứng dụng cung cấp kết quả tùy chỉnh dựa trên vị trí của người dùng.

Một đối tượng có giao diện này được lấy thông qua thuộc tính {{domxref("navigator.geolocation")}} do đối tượng {{domxref("Navigator")}} triển khai.

> [!NOTE]
> Vì lý do bảo mật, khi một trang web cố gắng truy cập thông tin vị trí, người dùng sẽ được thông báo và được yêu cầu cấp quyền. Hãy lưu ý rằng mỗi trình duyệt có chính sách và cách thức riêng để yêu cầu quyền này.

## Thuộc tính thể hiện

_Giao diện `Geolocation` không triển khai, cũng không kế thừa bất kỳ thuộc tính nào._

## Phương thức thể hiện

_Giao diện `Geolocation` không kế thừa bất kỳ phương thức nào._

- {{domxref("Geolocation.getCurrentPosition()")}}
  - : Xác định vị trí hiện tại của thiết bị và trả về một đối tượng {{domxref("GeolocationPosition")}} chứa dữ liệu.
- {{domxref("Geolocation.watchPosition()")}}
  - : Trả về một giá trị `long` đại diện cho hàm callback vừa được thiết lập để được gọi mỗi khi vị trí của thiết bị thay đổi.
- {{domxref("Geolocation.clearWatch()")}}
  - : Xóa bộ xử lý cụ thể đã được cài đặt trước đó bằng `watchPosition()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
