---
title: Keyboard API
slug: Web/API/Keyboard_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.Keyboard
  - api.KeyboardLayoutMap
spec-urls:
  - https://wicg.github.io/keyboard-lock/
  - https://wicg.github.io/keyboard-map/
---

{{SeeCompatTable}}{{DefaultAPISidebar("Keyboard API")}}

Keyboard API cung cấp các phương thức để làm việc với bàn phím vật lý được gắn với thiết bị đang chạy trình duyệt.

Nó cung cấp một số khả năng. _Keyboard mapping_ cung cấp giao diện để truy xuất chuỗi được tạo ra bởi phím vật lý cụ thể trên bàn phím để xác định chính xác phím đó với người dùng. _Keyboard locking_ cho phép trang web bắt giữ các phím thường được dành riêng bởi user agent hoặc hệ điều hành cơ bản. Mục đích sử dụng của Keyboard API là bởi các ứng dụng web như trò chơi hoặc ứng dụng truy cập từ xa cung cấp trải nghiệm toàn màn hình phong phú.

## Khái niệm và cách sử dụng

### Keyboard mapping

Trên bàn phím vật lý, thuộc tính `code` chứa vị trí vật lý của phím được nhấn và thuộc tính `key` chứa chuỗi được tạo ra khi nhấn phím ở vị trí vật lý đó. Giá trị `key` tính đến locale, layout và trạng thái phím bổ sung. Theo lịch sử không có cách nào để truy xuất thông tin đó.

Keyboard Map API cung cấp cách để truy xuất chuỗi được tạo ra bởi lần nhấn phím cụ thể, thông qua giao diện {{domxref('Keyboard')}} và giao diện {{domxref('KeyboardLayoutMap')}}.

## Các giao diện

- {{domxref("Keyboard")}}
  - : Cung cấp các hàm để truy xuất thông tin bố cục bàn phím và bật/tắt việc bắt giữ các lần nhấn phím từ bàn phím vật lý.
- {{domxref("KeyboardLayoutMap")}}
  - : Đối tượng giống map với các thuộc tính để truy xuất chuỗi liên kết với các phím cụ thể.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
