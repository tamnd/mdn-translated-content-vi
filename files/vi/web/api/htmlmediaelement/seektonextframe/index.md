---
title: "HTMLMediaElement: phương thức seekToNextFrame()"
short-title: seekToNextFrame()
slug: Web/API/HTMLMediaElement/seekToNextFrame
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.HTMLMediaElement.seekToNextFrame
---

{{APIRef("HTML DOM")}}{{Deprecated_Header}}{{non-standard_header}}

Phương thức **`HTMLMediaElement.seekToNextFrame()`**
nâng cao không đồng bộ vị trí phát hiện tại sang khung hình tiếp theo trong phương tiện.

> [!WARNING]
> Phương pháp phi tiêu chuẩn này là một phần của quá trình thử nghiệm xung quanh việc hỗ trợ cho
> truy cập không theo thời gian thực vào phương tiện cho các tác vụ bao gồm lọc, chỉnh sửa, v.v.
> Bạn nên _không_ sử dụng phương pháp này trong mã sản xuất, vì việc triển khai nó
> có thể thay đổi—hoặc bị xóa hoàn toàn—mà không cần thông báo. Tuy nhiên, bạn được mời đến
> thử nghiệm với nó.

Phương pháp này cho phép bạn truy cập các khung của phương tiện video mà không cần thực hiện phương tiện đó trong
thời gian thực. Điều này cũng cho phép bạn truy cập phương tiện bằng cách sử dụng khung làm đơn vị tìm kiếm thay vì
mã thời gian (mặc dù chỉ bằng cách tìm kiếm từng khung hình một cho đến khi bạn đến được khung hình mà bạn
muốn). Các ứng dụng có thể có của phương pháp này bao gồm lọc và chỉnh sửa nội dung video.

Phương thức này trả về ngay lập tức, trả về {{jsxref("Promise")}}, việc thực hiện của nó
trình xử lý được gọi khi thao tác tìm kiếm hoàn tất. Ngoài ra, một
Sự kiện {{domxref("HTMLMediaElement/seeked_event", "seeked")}} được gửi để cho các bên quan tâm biết rằng việc tìm kiếm đã được thực hiện
địa điểm. Nếu tìm kiếm không thành công vì phương tiện đã ở khung cuối cùng,
Sự kiện {{domxref("HTMLMediaElement/seeked_event", "seeked")}} xảy ra, ngay sau đó là sự kiện {{domxref("HTMLMediaElement/ended_event", "ended")}}.

Nếu không có video trên thành phần đa phương tiện hoặc không thể tìm kiếm được phương tiện thì không có gì
xảy ra.

## Cú pháp

```js-nolint
seekToNextFrame()
```

### Tham số

Không có.

### Giá trị trả về

{{jsxref("Promise")}} được thực hiện sau khi thao tác tìm kiếm hoàn tất.

## Đặc tả kỹ thuật

Không phải là một phần của bất kỳ đặc điểm kỹ thuật.

## Tương thích trình duyệt

{{Compat}}
