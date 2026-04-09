---
title: Tham khảo Progressive Web Apps
short-title: Tham khảo
slug: Web/Progressive_web_apps/Reference
page-type: landing-page
sidebar: pwasidebar
---

Tài liệu tham khảo này mô tả các công nghệ, tính năng, và API mà [Progressive Web Apps](/en-US/docs/Web/Progressive_web_apps) (PWA) có thể dùng để mang lại trải nghiệm người dùng tuyệt vời.

## Manifest ứng dụng web

- [Các thành phần của web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest)
  - : Nhà phát triển có thể dùng các thành phần của web app manifest để mô tả một PWA, tùy chỉnh giao diện của nó, và tích hợp sâu hơn vào hệ điều hành.

## API Service Worker

### Giao tiếp với ứng dụng

Các API sau có thể được dùng bởi một service worker để giao tiếp với PWA client liên kết của nó:

- [`Client.postMessage()`](/en-US/docs/Web/API/Client/postMessage)
  - : Cho phép service worker gửi một thông điệp đến PWA client của nó.
- [Broadcast Channel API](/en-US/docs/Web/API/Broadcast_Channel_API)
  - : Cho phép service worker và PWA client của nó thiết lập một kênh giao tiếp hai chiều cơ bản.

### Hoạt động ngoại tuyến

Các API sau có thể được dùng bởi một service worker để làm cho ứng dụng của bạn hoạt động ngoại tuyến:

- [`Cache`](/en-US/docs/Web/API/Cache)
  - : Một cơ chế lưu trữ bền vững cho các phản hồi HTTP, dùng để lưu tài nguyên có thể tái sử dụng khi ứng dụng ngoại tuyến.
- [`Clients`](/en-US/docs/Web/API/Clients)
  - : Một giao diện dùng để cung cấp quyền truy cập vào các tài liệu do service worker kiểm soát.
- [`FetchEvent`](/en-US/docs/Web/API/FetchEvent)
  - : Một sự kiện được phát trong service worker với mỗi yêu cầu HTTP mà PWA client gửi. Sự kiện này có thể được dùng để gửi yêu cầu lên máy chủ như bình thường và lưu phản hồi cho lần sau, hoặc chặn yêu cầu và trả về ngay một phản hồi đã được lưu trước đó.

### Hoạt động nền

Các API sau có thể được dùng bởi một service worker để thực hiện tác vụ ở nền, ngay cả khi ứng dụng không chạy:

- [Background Synchronization API](/en-US/docs/Web/API/Background_Synchronization_API)
  - : Một cách trì hoãn tác vụ để chạy trong service worker khi đã có kết nối mạng ổn định.
- [Web Periodic Background Synchronization API](/en-US/docs/Web/API/Web_Periodic_Background_Synchronization_API)
  - : Một cách đăng ký tác vụ để chạy trong service worker theo các khoảng thời gian định kỳ khi có kết nối mạng.
- [Background Fetch API](/en-US/docs/Web/API/Background_Fetch_API)
  - : Một phương thức để service worker quản lý các lượt tải xuống có thể mất nhiều thời gian, chẳng hạn như tệp video hoặc âm thanh.

## Các API web khác

- [IndexedDB](/en-US/docs/Web/API/IndexedDB_API)
  - : Một API lưu trữ phía client cho lượng lớn dữ liệu có cấu trúc, bao gồm cả tệp.
- [Badging API](/en-US/docs/Web/API/Badging_API)
  - : Một cách đặt huy hiệu trên biểu tượng ứng dụng, cung cấp một thông báo ít gây xao nhãng.
- [Notifications API](/en-US/docs/Web/API/Notifications_API)
  - : Một cách gửi thông báo được hiển thị ở cấp hệ điều hành.
- [Web Share API](/en-US/docs/Web/API/Web_Share_API)
  - : Một cơ chế để chia sẻ văn bản, liên kết, tệp, và nội dung khác đến các ứng dụng khác do người dùng chọn trên thiết bị của họ.
- [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API)
  - : Một API dành cho PWA được cài đặt trên hệ điều hành máy tính, cho phép ẩn thanh tiêu đề mặc định của cửa sổ, từ đó hiển thị ứng dụng trên toàn bộ bề mặt cửa sổ ứng dụng.
