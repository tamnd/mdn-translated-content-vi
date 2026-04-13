---
title: "PerformanceTiming: connectEnd property"
short-title: connectEnd
slug: Web/API/PerformanceTiming/connectEnd
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.connectEnd
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.connectEnd`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, kết nối được mở vào mạng. Nếu
lớp truyền tải báo cáo lỗi và việc thiết lập kết nối được bắt đầu lại, thời gian kết thúc
thiết lập kết nối cuối cùng được cung cấp. Nếu kết nối liên tục được sử dụng, giá trị sẽ
giống với {{domxref("PerformanceTiming.fetchStart")}}. Một kết nối được
coi là đã mở khi tất cả quá trình bắt tay kết nối bảo mật, hoặc xác thực SOCKS, đã
kết thúc.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
