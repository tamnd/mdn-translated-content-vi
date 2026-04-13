---
title: "HTMLMediaElement: thuộc tính currentTime"
short-title: currentTime
slug: Web/API/HTMLMediaElement/currentTime
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.currentTime
---

{{APIRef("HTML DOM")}}

Giao diện {{domxref("HTMLMediaElement")}}
Thuộc tính **`currentTime`** chỉ định thời gian phát lại hiện tại
trong vài giây.

Thay đổi giá trị của `currentTime` tìm kiếm phương tiện truyền thông tới
thời điểm mới.

## Giá trị

Giá trị dấu phẩy động có độ chính xác kép cho biết thời gian phát lại hiện tại trong
giây.

Nếu phương tiện chưa phát, giá trị của `currentTime` cho biết
vị trí thời gian trong phương tiện mà việc phát lại sẽ bắt đầu sau khi
Phương thức {{domxref("HTMLMediaElement.play", "play()")}} được gọi.

Đặt `currentTime` thành một giá trị mới sẽ tìm kiếm phương tiện theo thời gian nhất định, nếu
phương tiện truyền thông có sẵn.

Đối với phương tiện không có thời lượng xác định—chẳng hạn như phương tiện được phát trực tiếp—có thể
trình duyệt có thể không lấy được các phần của phương tiện đã hết hạn từ
bộ đệm phương tiện. Ngoài ra, không thể tìm kiếm phương tiện có dòng thời gian không bắt đầu ở 0 giây.
một thời điểm trước thời điểm sớm nhất của dòng thời gian của nó.

Độ dài của phương tiện tính bằng giây có thể được xác định bằng cách sử dụng
Thuộc tính {{domxref("HTMLMediaElement.duration", "duration")}}.

## Ví dụ

```js
const video = document.createElement("video");
console.log(video.currentTime);
```

## Ghi chú sử dụng

### Giảm độ chính xác về thời gian

Để cung cấp khả năng bảo vệ chống lại các cuộc tấn công định giờ và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `video.currentTime` có thể được làm tròn tùy thuộc vào cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật theo mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, trong trường hợp đó độ chính xác sẽ là 100 mili giây hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy theo giá trị nào lớn hơn.

Ví dụ: với độ chính xác về thời gian giảm xuống, kết quả của `video.currentTime` sẽ luôn là bội số của 0,002 hoặc bội số của 0,1 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi bật `privacy.resistFingerprinting`.

```js
// reduced time precision (2ms) in Firefox 60
video.currentTime;
// Might be:
// 23.404
// 24.192
// 25.514
// …

// reduced time precision with `privacy.resistFingerprinting` enabled
video.currentTime;
// Might be:
// 49.8
// 50.6
// 51.7
// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.currentTime`
- {{domxref("HTMLMediaElement.fastSeek()")}}: Một cách khác để cài đặt thời gian
- {{domxref("HTMLMediaElement.duration")}}: Thời lượng của media tính bằng giây
