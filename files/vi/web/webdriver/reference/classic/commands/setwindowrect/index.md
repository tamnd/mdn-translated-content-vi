---
title: Set Window Rect
slug: Web/WebDriver/Reference/Classic/Commands/SetWindowRect
page-type: webdriver-command
browser-compat: webdriver.classic.SetWindowRect
sidebar: webdriver
---

Lệnh _Set Window Rect_ của API [WebDriver](/en-US/docs/Web/WebDriver) thay đổi kích thước và vị trí của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window) hiện tại. Lệnh này đóng vai trò như bộ thiết lập cho [Get Window Rect](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetWindowRect), và đối tượng trả về của nó có thể được truyền trực tiếp làm dữ liệu gửi lên của lệnh này.

Một số tập hợp thiết bị không hỗ trợ việc đặt kích thước hoặc vị trí cửa sổ. Trên các cấu hình này, lệnh sẽ trả về lỗi [unsupported operating](/en-US/docs/Web/WebDriver/Reference/Errors/UnsupportedOperation). Để tránh rơi vào tình huống gọi lệnh này gây lỗi, có thể gọi nó có điều kiện khi [`setWindowRect` capability](/en-US/docs/Web/WebDriver/Reference/Capabilities/setWindowRect) được đặt là true cho phiên.

Việc đặt window rect nhận `x`, `y`, `width`, và `height` làm đầu vào. Tất cả các trường đều là tùy chọn, ví dụ lệnh có thể được gọi với một đối tượng rỗng và trong trường hợp này nó sẽ hoạt động như một thao tác không làm gì. Để đặt vị trí thì cần cả `x` và `y`, và tương ứng cả `width` và `height` đều cần để thay đổi kích thước cửa sổ.

Khi đặt width hoặc height, không có gì đảm bảo kích thước cửa sổ kết quả sẽ khớp chính xác với kích thước được yêu cầu. Driver được kỳ vọng sẽ chặn các giá trị lớn hơn kích thước màn hình vật lý hoặc nhỏ hơn kích thước cửa sổ tối thiểu. Một số driver cũng có thể có các giới hạn khác, chẳng hạn không thể thay đổi kích thước theo từng pixel đơn lẻ. Vì lý do này, `width` và `height` trả về có thể không khớp chính xác với [`Window.outerWidth`](/en-US/docs/Web/API/Window/outerWidth) và [`Window.outerHeight`](/en-US/docs/Web/API/Window/outerHeight).

Việc đặt vị trí cửa sổ có bản chất tương tự như gọi [`Window.moveTo(x, y)`](/en-US/docs/Web/API/Window/moveTo), nhưng khác ở chỗ bỏ qua các hạn chế bảo mật liên quan đến thao tác cửa sổ.

Lệnh Set Window Rect là lệnh đồng bộ chặn.

## Cú pháp

| Method                                              | URI template                        |
| --------------------------------------------------- | ----------------------------------- |
| [POST](/en-US/docs/Web/HTTP/Reference/Methods/POST) | `/session/{session id}/window/rect` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Dữ liệu gửi lên

Dữ liệu đầu vào là một đối tượng [`WindowRect`](/en-US/docs/Web/WebDriver/Reference/WindowRect):

- `x`
  - : Vị trí ngang của [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.screenX`](/en-US/docs/Web/API/Window/screenX). Phải là một số trong khoảng −(2^31) đến 2^31 − 1, null, hoặc undefined.

- `y`
  - : Vị trí dọc của [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.screenY`](/en-US/docs/Web/API/Window/screenY). Phải là một số trong khoảng −(2^31) đến 2^31 − 1, null, hoặc undefined.
- `width`
  - : Chiều rộng ngoài của [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.outerWidth`](/en-US/docs/Web/API/Window/outerWidth). Phải là một số trong khoảng 0 đến 2^31 − 1, null, hoặc undefined.
- `height`
  - : Chiều cao ngoài của [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.outerHeight`](/en-US/docs/Web/API/Window/outerHeight). Phải là một số trong khoảng 0 đến 2^31 − 1, null, hoặc undefined.

### Phản hồi

Phần dữ liệu phản hồi là một [`WindowRect`](/en-US/docs/Web/WebDriver/Reference/WebWindow):

- `x`
  - : Vị trí ngang của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.screenX`](/en-US/docs/Web/API/Window/screenX).
- `y`
  - : Vị trí dọc của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.screenY`](/en-US/docs/Web/API/Window/screenY).
- `width`
  - : Chiều rộng của ranh giới ngoài của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.outerWidth`](/en-US/docs/Web/API/Window/outerWidth).
- `height`
  - : Chiều cao của ranh giới ngoài của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.outerHeight`](/en-US/docs/Web/API/Window/outerHeight).

### Lỗi

- Invalid argument
  - : Nếu bất kỳ trường nào trong đối tượng dữ liệu gửi lên [`WindowRect`](/en-US/docs/Web/WebDriver/Reference/WindowRect) không đáp ứng ràng buộc kiểu hoặc giới hạn, hoặc nếu chỉ có một trong hai trường của cặp `x`/`y` hoặc cặp `width`/`height` được chỉ định.
- [Invalid session ID](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)
  - : Phiên không tồn tại.
- [No such window](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchWindow)
  - : Nếu [`window`](/en-US/docs/Web/API/Window) đã bị đóng.
- [Unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen)
  - : Một lời nhắc của người dùng, chẳng hạn như [`window.alert`](/en-US/docs/Web/API/Window/alert), chặn việc thực thi lệnh cho đến khi nó được xử lý.
- [Unsupported operation](/en-US/docs/Web/WebDriver/Reference/Errors/UnsupportedOperation)
  - : Nếu driver không hỗ trợ thay đổi kích thước hoặc vị trí cửa sổ. Điều này thường xảy ra trên thiết bị di động, nơi trình duyệt có kích thước cố định và không thể di chuyển quanh màn hình.

    Bạn có thể kiểm tra [`setWindowRect` capability](/en-US/docs/Web/WebDriver/Reference/Capabilities/setWindowRect) để biết thiết bị có hỗ trợ lệnh này hay không.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Đối tượng [`WebWindow`](/en-US/docs/Web/WebDriver/Reference/WebWindow)
- Các lệnh liên quan:
  - [Get Window Rect](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetWindowRect)
  - [Get Window Handle](/en-US/docs/Web/WebDriver/Reference/Commands/GetWindowHandle)
  - [Get Window Handles](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetWindowHandles)
  - [Close Window](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/CloseWindow)
