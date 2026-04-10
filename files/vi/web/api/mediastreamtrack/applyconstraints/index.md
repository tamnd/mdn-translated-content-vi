---
title: "MediaStreamTrack: phương thức applyConstraints()"
short-title: applyConstraints()
slug: Web/API/MediaStreamTrack/applyConstraints
page-type: web-api-instance-method
browser-compat: api.MediaStreamTrack.applyConstraints
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`applyConstraints()`** của giao diện {{domxref("MediaStreamTrack")}} áp dụng một bộ ràng buộc cho track; các ràng buộc này cho phép trang web hoặc ứng dụng thiết lập các giá trị lý tưởng và/hoặc phạm vi giá trị chấp nhận được cho các thuộc tính có thể ràng buộc của track, chẳng hạn như tốc độ khung hình, kích thước, hủy tiếng vọng, v.v.

Các ràng buộc có thể được sử dụng để đảm bảo phương tiện đáp ứng các hướng dẫn nhất định mà bạn mong muốn.
Ví dụ: bạn có thể muốn video mật độ cao nhưng yêu cầu tốc độ khung hình hơi thấp để giúp giữ tốc độ dữ liệu đủ thấp để không gây quá tải cho mạng.
Các ràng buộc cũng có thể chỉ định kích thước lý tưởng và/hoặc chấp nhận được hoặc phạm vi kích thước.
Xem [Áp dụng ràng buộc](/vi/docs/Web/API/Media_Capture_and_Streams_API/Constraints#applying_constraints) trong [Khả năng, ràng buộc và cài đặt](/vi/docs/Web/API/Media_Capture_and_Streams_API/Constraints) để biết thêm thông tin về cách áp dụng các ràng buộc mong muốn của bạn.

## Cú pháp

```js-nolint
applyConstraints()
applyConstraints(constraints)
```

### Tham số

- `constraints` {{optional_inline}}
  - : Một đối tượng {{domxref("MediaTrackConstraints")}} liệt kê các ràng buộc cần áp dụng cho các thuộc tính có thể ràng buộc của track; bất kỳ ràng buộc hiện có nào sẽ được thay thế bằng các giá trị mới được chỉ định, và bất kỳ thuộc tính có thể ràng buộc nào không được bao gồm sẽ được khôi phục về các ràng buộc mặc định của chúng.
    Nếu tham số này bị bỏ qua, tất cả các ràng buộc tùy chỉnh hiện được đặt sẽ bị xóa.
    Đối tượng này đại diện cho bộ ràng buộc cơ bản phải được áp dụng để {{jsxref("Promise")}} được giải quyết.
    Đối tượng có thể chứa một thuộc tính advanced chứa một mảng các đối tượng `MediaTrackConstraints` bổ sung, được xử lý như các yêu cầu chính xác.

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ được giải quyết khi các ràng buộc đã được áp dụng thành công.
Nếu các ràng buộc không thể được áp dụng, promise sẽ bị từ chối với một {{domxref("OverconstrainedError")}} là một {{domxref("DOMException")}} có tên là `OverconstrainedError` với các tham số bổ sung, để cho biết rằng các ràng buộc không thể được đáp ứng.
Điều này có thể xảy ra nếu các ràng buộc được chỉ định quá nghiêm ngặt để tìm được kết quả phù hợp khi cố gắng cấu hình track.

## Ví dụ

Đoạn mã sau đây cho thấy cách chỉ định một bộ ràng buộc cơ bản và nâng cao.
Nó chỉ định rằng trang hoặc ứng dụng web cần chiều rộng từ 640 đến 1280 và chiều cao từ 480 đến 720, với số cuối trong mỗi cặp được ưu tiên.
Thuộc tính advanced cũng chỉ định rằng kích thước hình ảnh 1920x1280 là ưu tiên hoặc {{glossary("aspect ratio")}} là 1.333 nếu không khả dụng.
Lưu ý rằng các ràng buộc này cũng minh họa những gì đặc tả gọi là _chiến lược lùi_.

```js
const constraints = {
  width: { min: 640, ideal: 1280 },
  height: { min: 480, ideal: 720 },
  advanced: [{ width: 1920, height: 1280 }, { aspectRatio: 1.333 }],
};

navigator.mediaDevices.getUserMedia({ video: true }).then((mediaStream) => {
  const track = mediaStream.getVideoTracks()[0];
  track
    .applyConstraints(constraints)
    .then(() => {
      // Làm gì đó với track như sử dụng API Image Capture.
    })
    .catch((e) => {
      // Các ràng buộc không thể được đáp ứng bởi các thiết bị hiện có.
    });
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [API MediaStream Image Capture](/vi/docs/Web/API/MediaStream_Image_Capture_API)
