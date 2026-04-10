---
title: Screen
slug: Web/API/Screen
page-type: web-api-interface
browser-compat: api.Screen
---

{{APIRef("CSSOM view API")}}

Giao diện `Screen` đại diện cho một màn hình, thường là màn hình mà cửa sổ hiện tại đang được kết xuất, và được lấy thông qua {{DOMxRef("window.screen")}}.

Lưu ý rằng các trình duyệt xác định màn hình nào được báo cáo là hiện tại bằng cách phát hiện màn hình có tâm cửa sổ trình duyệt.

{{InheritanceDiagram}}

## Thuộc tính instance

_Cũng kế thừa các thuộc tính từ {{domxref("EventTarget")}}_.

- {{DOMxRef("Screen.availHeight")}}
  - : Chỉ định chiều cao của màn hình, tính bằng pixel, trừ đi các thành phần giao diện người dùng vĩnh viễn hoặc bán vĩnh viễn được hiển thị bởi hệ điều hành, chẳng hạn như Taskbar trên Windows.
- {{DOMxRef("Screen.availWidth")}}
  - : Trả về lượng không gian ngang tính bằng pixel có sẵn cho cửa sổ.
- {{DOMxRef("Screen.colorDepth")}}
  - : Trả về độ sâu màu của màn hình.
- {{DOMxRef("Screen.height")}}
  - : Trả về chiều cao của màn hình tính bằng pixel.
- {{domxref("Screen.isExtended")}} {{experimental_inline}} {{securecontext_inline}}
  - : Trả về `true` nếu thiết bị của người dùng có nhiều màn hình, và `false` nếu không.
- {{DOMxRef("Screen.orientation")}}
  - : Trả về instance {{DOMxRef("ScreenOrientation")}} được liên kết với màn hình này.
- {{DOMxRef("Screen.pixelDepth")}}
  - : Lấy độ sâu bit của màn hình.
- {{DOMxRef("Screen.width")}}
  - : Trả về chiều rộng của màn hình.
- {{DOMxRef("Screen.mozEnabled")}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : Kiểu logic (boolean). Đặt thành false sẽ tắt màn hình của thiết bị.
- {{DOMxRef("Screen.mozBrightness")}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : Điều chỉnh độ sáng của màn hình thiết bị. Yêu cầu một số thập phân từ 0 đến 1.0.

## Thuộc tính không chuẩn

Các thuộc tính sau là một phần của [Window Management API](/en-US/docs/Web/API/Window_Management_API), làm cho chúng khả dụng trên giao diện {{domxref("ScreenDetailed")}}; đây là nơi chúng tôi chọn để ghi lại. Tuy nhiên, các phiên bản không chuẩn của các thuộc tính này có sẵn trên giao diện `Screen` trong các trình duyệt không hỗ trợ API đó. Xem bảng [Tương thích trình duyệt](#browser_compatibility) của trang này để biết chi tiết về hỗ trợ không chuẩn.

- {{domxref("ScreenDetailed.availLeft", "Screen.availLeft")}} {{ReadOnlyInline}} {{Non-standard_Inline}} {{SecureContext_Inline}}
  - : Một số đại diện cho tọa độ x (cạnh trái) của khu vực màn hình khả dụng.
- {{domxref("ScreenDetailed.availTop", "Screen.availTop")}} {{ReadOnlyInline}} {{Non-standard_Inline}} {{SecureContext_Inline}}
  - : Một số đại diện cho tọa độ y (cạnh trên) của khu vực màn hình khả dụng.
- {{domxref("ScreenDetailed.left", "Screen.left")}} {{ReadOnlyInline}} {{Non-standard_Inline}} {{SecureContext_Inline}}
  - : Một số đại diện cho tọa độ x (cạnh trái) của tổng khu vực màn hình.
- {{domxref("ScreenDetailed.top", "Screen.top")}} {{ReadOnlyInline}} {{Non-standard_Inline}} {{deprecated_inline}} {{SecureContext_Inline}}
  - : Một số đại diện cho tọa độ y (cạnh trên) của tổng khu vực màn hình.

## Phương thức instance

_Cũng kế thừa các phương thức từ {{domxref("EventTarget")}}_.

- {{DOMxRef("Screen.lockOrientation")}} {{Deprecated_Inline}}
  - : Khóa hướng màn hình (chỉ hoạt động ở chế độ toàn màn hình hoặc cho các ứng dụng đã cài đặt)
- {{DOMxRef("Screen.unlockOrientation")}} {{Deprecated_Inline}}
  - : Mở khóa hướng màn hình (chỉ hoạt động ở chế độ toàn màn hình hoặc cho các ứng dụng đã cài đặt)

## Sự kiện

- {{domxref("Screen.change_event", "change")}} {{experimental_inline}} {{securecontext_inline}}
  - : Được kích hoạt trên một màn hình cụ thể khi nó thay đổi theo một cách nào đó -- chiều rộng hoặc chiều cao, chiều rộng hoặc chiều cao khả dụng, độ sâu màu, hoặc hướng.
- {{DOMxRef("Screen.orientationchange_event", "orientationchange")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Được kích hoạt khi hướng màn hình thay đổi.

## Ví dụ

```js
if (screen.colorDepth < 8) {
  // sử dụng phiên bản màu thấp của trang
} else {
  // sử dụng trang thông thường, nhiều màu sắc
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
