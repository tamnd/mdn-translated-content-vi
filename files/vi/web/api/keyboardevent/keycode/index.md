---
title: "KeyboardEvent: thuộc tính keyCode"
short-title: keyCode
slug: Web/API/KeyboardEvent/keyCode
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.KeyboardEvent.keyCode
---

{{APIRef("UI Events")}}{{Deprecated_Header}}

Thuộc tính chỉ đọc đã lỗi thời **`KeyboardEvent.keyCode`** biểu diễn một mã số phụ thuộc hệ thống và triển khai xác định giá trị không thay đổi của phím đã nhấn.

Đây thường là mã ASCII ({{RFC(20)}}) hoặc Windows 1252 thập phân tương ứng với phím. Nếu không thể xác định phím, giá trị này là `0`.

Bạn nên tránh sử dụng thuộc tính này nếu có thể; nó đã bị loại bỏ trong một thời gian. Thay vào đó, bạn nên sử dụng {{domxref("KeyboardEvent.code")}} (cho phím vật lý đã nhấn) hoặc {{domxref("KeyboardEvent.key")}} (cho ký tự mà phím ánh xạ đến). Hãy kiểm tra khả năng tương thích cho một trong hai thuộc tính nếu bạn nhắm đến các trình duyệt rất cũ.

> [!NOTE]
> Các nhà phát triển web không nên sử dụng thuộc tính `keyCode` cho các ký tự có thể in được khi xử lý các sự kiện `keydown` và `keyup`. Như đã mô tả ở trên, thuộc tính `keyCode` không hữu ích cho các ký tự có thể in, đặc biệt là những ký tự được nhập với phím <kbd>Shift</kbd> hoặc <kbd>Alt</kbd> được nhấn.

## Giá trị của keyCode

### Phím có thể in ở vị trí tiêu chuẩn

Giá trị của các sự kiện phím do nhấn hoặc nhả các phím có thể in ở vị trí tiêu chuẩn không tương thích giữa các trình duyệt.

IE chỉ hiển thị giá trị mã ảo gốc là `KeyboardEvent.keyCode`.

Google Chrome, Chromium và Safari phải quyết định giá trị từ ký tự đầu vào. Nếu ký tự đầu vào có thể được nhập với bố cục bàn phím Mỹ, họ sử dụng giá trị `keyCode` trên bố cục bàn phím Mỹ.

Firefox nhận giá trị `keyCode` từ các ký tự {{Glossary("ASCII")}} có thể nhập được bằng phím -- ngay cả với bổ trợ shift hoặc bố cục bàn phím có khả năng ASCII. Xem các quy tắc sau để biết chi tiết:

1. Nếu hệ thống là Windows và mã gốc của phím được nhấn cho biết phím là a-z hoặc 0-9, sử dụng mã phím cho nó.
2. Nếu hệ thống là Mac và mã gốc của phím được nhấn cho biết phím là 0-9, sử dụng mã phím cho nó.
3. Nếu phím được nhấn nhập một ký tự chữ hoặc số ASCII không có phím bổ trợ, sử dụng mã phím cho nó.
4. Nếu phím được nhấn nhập một ký tự chữ hoặc số ASCII với bổ trợ Shift, sử dụng mã phím cho nó.
5. Nếu phím được nhấn nhập một ký tự ASCII khác không có phím bổ trợ, sử dụng mã phím cho nó.
6. Nếu phím được nhấn nhập một ký tự ASCII khác với bổ trợ Shift, sử dụng mã phím cho nó.
7. Nếu không, tức là phím được nhấn nhập một ký tự unicode:
   1. Nếu bố cục bàn phím có khả năng ASCII (tức là, có thể nhập bảng chữ cái ASCII), sử dụng 0 hoặc tính toán với các quy tắc bổ sung sau.
   2. Nếu không, tức là bố cục bàn phím không có khả năng ASCII, sử dụng bố cục bàn phím có khả năng ASCII được cài đặt trên môi trường với ưu tiên cao nhất:
      1. Nếu phím được nhấn trên bố cục bàn phím thay thế nhập một ký tự chữ hoặc số ASCII, sử dụng mã phím cho nó.
      2. Nếu không, sử dụng 0 hoặc tính toán với các quy tắc bổ sung sau.

Gecko đặt giá trị `keyCode` của các phím dấu câu càng xa càng tốt (khi đạt đến điểm 7.1 hoặc 7.2 trong danh sách trên) với các quy tắc sau:

> [!WARNING]
> Mục đích của các quy tắc bổ sung mới này là giúp người dùng có bố cục bàn phím ánh xạ ký tự unicode thành các phím dấu câu trong bố cục bàn phím Mỹ có thể sử dụng các ứng dụng web chỉ hỗ trợ Firefox với các bố cục bàn phím có khả năng ASCII hoặc chỉ với bố cục bàn phím Mỹ. Nếu không, các giá trị `keyCode` mới được ánh xạ có thể xung đột với các phím khác. Ví dụ: nếu bố cục bàn phím đang hoạt động là tiếng Nga, giá trị `keyCode` của **cả** phím `"Period"` và phím `"Slash"` đều là `190` (`KeyEvent.DOM_VK_PERIOD`). Nếu bạn cần phân biệt các phím đó nhưng không muốn hỗ trợ tất cả các bố cục bàn phím trên thế giới, bạn nên sử dụng {{domxref("KeyboardEvent.code")}}.

1. Nếu đang chạy macOS hoặc Linux:
   1. Nếu bố cục bàn phím đang hoạt động không có khả năng ASCII và có một bố cục bàn phím thay thế có khả năng ASCII.
      1. Nếu bố cục bàn phím thay thế có khả năng ASCII tạo ra một ký tự ASCII chỉ bằng phím không bổ trợ, sử dụng `keyCode` cho ký tự đó.
      2. Nếu bố cục bàn phím thay thế có khả năng ASCII tạo ra một ký tự ASCII với bổ trợ Shift, sử dụng `keyCode` cho ký tự đã chuyển đổi.
      3. Nếu không, sử dụng `keyCode` cho một ký tự ASCII được tạo ra bởi phím khi bố cục bàn phím Mỹ đang hoạt động.

   2. Nếu không, sử dụng `keyCode` cho một ký tự ASCII được tạo ra bởi phím khi bố cục bàn phím Mỹ đang hoạt động.

2. Nếu đang chạy trên Windows:
   1. Sử dụng giá trị `keyCode` cho một ký tự ASCII được tạo ra bởi một phím được ánh xạ thành cùng mã ảo của Windows khi bố cục bàn phím Mỹ đang hoạt động.

> [!NOTE]
> Vì tệp keyCode rất dài với nhiều bảng dữ liệu trình duyệt, toàn bộ bảng dữ liệu trình duyệt đã được giữ nguyên để đảm bảo tính chính xác kỹ thuật.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
