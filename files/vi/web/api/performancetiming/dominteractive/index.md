---
title: "PerformanceTiming: domInteractive property"
short-title: domInteractive
slug: Web/API/PerformanceTiming/domInteractive
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceTiming.domInteractive
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}}
> thay thế.

Thuộc tính chỉ đọc cũ **`PerformanceTiming.domInteractive`**
trả về một `unsigned long long` biểu diễn thời điểm,
tính bằng mili giây kể từ kỷ nguyên UNIX, khi trình phân tích cú pháp hoàn thành công việc trên
tài liệu chính, tức là khi {{domxref("Document.readyState")}} của nó thay đổi thành
`'interactive'` và sự kiện {{domxref("Document/readystatechange_event", "readystatechange")}} tương ứng được
phát ra.

Thuộc tính này có thể được sử dụng để đo tốc độ tải các trang web mà người dùng
_cảm nhận_. Tuy nhiên có một số cạm bẫy xảy ra nếu các script đang
chặn quá trình kết xuất và không được tải không đồng bộ hoặc với web font tùy chỉnh. [Hãy kiểm tra xem bạn có rơi vào một trong những trường hợp này không](https://www.stevesouders.com/blog/2015/08/07/dominteractive-is-it-really/) trước khi sử dụng thuộc tính này làm proxy cho
trải nghiệm người dùng về tốc độ tải trang web.

## Giá trị

Một `unsigned long long`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceTiming")}} mà nó thuộc về.
- Bài viết "[domInteractive: is it? really?](https://www.stevesouders.com/blog/2015/08/07/dominteractive-is-it-really/)" giải thích khi nào bạn có thể sử dụng thuộc tính này làm proxy cho
  trải nghiệm người dùng về tốc độ tải trang web.
