---
title: "MediaStreamTrack: phương thức getConstraints()"
short-title: getConstraints()
slug: Web/API/MediaStreamTrack/getConstraints
page-type: web-api-instance-method
browser-compat: api.MediaStreamTrack.getConstraints
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`getConstraints()`** của
giao diện {{domxref("MediaStreamTrack")}} trả về một
đối tượng {{domxref('MediaTrackConstraints')}} chứa bộ ràng buộc được thiết lập
gần đây nhất cho track bằng một lần gọi
{{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}} trước đó. Các
ràng buộc này cho biết các giá trị và phạm vi giá trị mà trang web hoặc ứng dụng đã
chỉ định là bắt buộc hoặc chấp nhận được cho các thuộc tính có thể ràng buộc được bao gồm.

Các ràng buộc có thể được sử dụng để đảm bảo phương tiện đáp ứng các hướng dẫn nhất định mà bạn mong muốn.
Ví dụ: bạn có thể muốn video độ phân giải cao nhưng yêu cầu tốc độ khung hình hơi
thấp để giúp giữ tốc độ dữ liệu đủ thấp để không gây quá tải cho mạng. Các ràng buộc
cũng có thể chỉ định kích thước lý tưởng và/hoặc chấp nhận được hoặc phạm vi kích thước. Xem [Khả năng, ràng buộc và cài đặt](/vi/docs/Web/API/Media_Capture_and_Streams_API/Constraints) để biết chi tiết về cách làm việc với các thuộc tính có thể ràng buộc.

## Cú pháp

```js-nolint
getConstraints()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref('MediaTrackConstraints')}} cho biết các thuộc tính có thể ràng buộc
mà trang web hoặc ứng dụng đã đặt gần đây nhất bằng
{{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}}. Các thuộc tính
trong đối tượng trả về được liệt kê theo cùng thứ tự khi chúng được đặt, và chỉ
các thuộc tính được trang web hoặc ứng dụng đặt cụ thể mới được bao gồm.

> [!NOTE]
> Bộ ràng buộc trả về không nhất thiết mô tả
> trạng thái thực tế của phương tiện. Ngay cả khi bất kỳ ràng buộc nào không thể được đáp ứng, chúng
> vẫn được bao gồm trong đối tượng trả về như ban đầu được đặt bởi mã của trang web. Để lấy
> các cài đặt hiện đang hoạt động cho tất cả các thuộc tính có thể ràng buộc, bạn nên
> gọi {{domxref("MediaStreamTrack.getSettings", "getSettings()")}}.

## Ví dụ

Ví dụ này lấy các ràng buộc hiện tại cho một track, đặt
{{domxref("MediaTrackConstraints.facingMode", "facingMode")}}, và áp dụng các ràng buộc đã cập nhật.

```js
function switchCameras(track, camera) {
  const constraints = track.getConstraints();
  constraints.facingMode = camera;
  track.applyConstraints(constraints);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}
