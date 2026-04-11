---
title: Touch
slug: Web/API/Touch
page-type: web-api-interface
browser-compat: api.Touch
---

{{APIRef("Touch Events")}}

Giao diện **`Touch`** đại diện cho một điểm tiếp xúc duy nhất trên thiết bị cảm ứng. Điểm tiếp xúc thường là ngón tay hoặc bút stylus, và thiết bị có thể là màn hình cảm ứng hoặc trackpad.

Các thuộc tính {{ domxref("Touch.radiusX") }}, {{ domxref("Touch.radiusY") }} và {{ domxref("Touch.rotationAngle") }} mô tả vùng tiếp xúc giữa người dùng và màn hình, còn gọi là _vùng chạm_. Điều này hữu ích khi làm việc với các thiết bị trỏ không chính xác như ngón tay. Các giá trị này mô tả một hình elip gần nhất bao phủ toàn bộ vùng tiếp xúc (chẳng hạn như đầu ngón tay của người dùng).

> [!NOTE]
> Nhiều giá trị thuộc tính phụ thuộc vào phần cứng; ví dụ, nếu thiết bị không thể phát hiện lực ấn lên bề mặt thì giá trị `force` luôn là 0. Điều này cũng có thể xảy ra với `radiusX` và `radiusY`; nếu phần cứng chỉ báo một điểm duy nhất thì các giá trị này sẽ là 1.

## Hàm khởi tạo

- {{domxref("Touch.Touch", "Touch()")}}
  - : Tạo một đối tượng Touch.

## Thuộc tính phiên bản

_Giao diện này không có lớp cha và không kế thừa hay cài đặt thuộc tính nào khác._

### Thuộc tính cơ bản

- {{domxref("Touch.identifier")}} {{ReadOnlyInline}}
  - : Trả về mã định danh duy nhất cho đối tượng `Touch` này. Một điểm chạm (chẳng hạn từ một ngón tay) sẽ giữ nguyên mã định danh trong suốt quá trình di chuyển trên bề mặt, giúp bạn theo dõi đúng điểm chạm.
- {{domxref("Touch.screenX")}} {{ReadOnlyInline}}
  - : Trả về tọa độ X của điểm chạm so với cạnh trái màn hình.
- {{domxref("Touch.screenY")}} {{ReadOnlyInline}}
  - : Trả về tọa độ Y của điểm chạm so với cạnh trên màn hình.
- {{domxref("Touch.clientX")}} {{ReadOnlyInline}}
  - : Trả về tọa độ X của điểm chạm so với cạnh trái của viewport trình duyệt, không tính offset cuộn trang.
- {{domxref("Touch.clientY")}} {{ReadOnlyInline}}
  - : Trả về tọa độ Y của điểm chạm so với cạnh trên của viewport trình duyệt, không tính offset cuộn trang.
- {{domxref("Touch.pageX")}} {{ReadOnlyInline}}
  - : Trả về tọa độ X của điểm chạm so với cạnh trái tài liệu. Khác với `clientX`, giá trị này bao gồm offset cuộn ngang nếu có.
- {{domxref("Touch.pageY")}} {{ReadOnlyInline}}
  - : Trả về tọa độ Y của điểm chạm so với đầu tài liệu. Khác với `clientY`, giá trị này bao gồm offset cuộn dọc nếu có.
- {{domxref("Touch.target")}} {{ReadOnlyInline}}
  - : Trả về {{ domxref("Element")}} mà điểm chạm bắt đầu khi lần đầu đặt lên bề mặt, dù điểm chạm sau đó có di chuyển ra ngoài vùng tương tác của phần tử đó hay thậm chí bị xóa khỏi tài liệu.

### Vùng chạm

- {{domxref("Touch.radiusX")}} {{ReadOnlyInline}}
  - : Trả về bán kính X của hình elip gần nhất bao quanh vùng tiếp xúc với màn hình. Giá trị tính bằng pixel theo cùng tỷ lệ với `screenX`.
- {{domxref("Touch.radiusY")}} {{ReadOnlyInline}}
  - : Trả về bán kính Y của hình elip gần nhất bao quanh vùng tiếp xúc với màn hình. Giá trị tính bằng pixel theo cùng tỷ lệ với `screenY`.
- {{domxref("Touch.rotationAngle")}} {{ReadOnlyInline}}
  - : Trả về góc (tính bằng độ) mà hình elip được mô tả bởi radiusX và radiusY phải xoay theo chiều kim đồng hồ để bao phủ chính xác nhất vùng tiếp xúc giữa người dùng và bề mặt.
- {{domxref("Touch.force")}} {{ReadOnlyInline}}
  - : Trả về lực ấn của người dùng lên bề mặt, là giá trị `float` trong khoảng từ `0.0` (không có lực) đến `1.0` (lực tối đa).

### Loại chạm và góc

- {{domxref("Touch.altitudeAngle")}} {{ReadOnlyInline}}
  - : Trả về góc (tính bằng radian) giữa trục của bộ chuyển đổi (con trỏ hoặc stylus) và mặt phẳng X-Y của thiết bị, trong khoảng `0` (song song với bề mặt) đến `π/2` (vuông góc với bề mặt). Mặc định là `0` với phần cứng không báo cáo độ nghiêng.
- {{domxref("Touch.azimuthAngle")}} {{ReadOnlyInline}}
  - : Trả về góc phương vị (tính bằng radian) của bộ chuyển đổi (con trỏ hoặc stylus), trong khoảng `0` đến `2π`. `0` nghĩa là đầu bút chỉ theo hướng tăng X trên mặt phẳng X-Y, và giá trị tăng dần theo chiều kim đồng hồ.
- {{domxref("Touch.touchType")}} {{ReadOnlyInline}}
  - : Trả về loại thiết bị tạo ra cử chỉ chạm, ví dụ `"direct"` cho ngón tay hay `"stylus"` cho bút.

## Phương thức phiên bản

_Giao diện này không có phương thức nào và không có lớp cha, không kế thừa hay cài đặt phương thức nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sự kiện touch](/en-US/docs/Web/API/Touch_events)
- {{ domxref("Document.createTouch()") }}
