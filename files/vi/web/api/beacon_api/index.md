---
title: Beacon API
slug: Web/API/Beacon_API
page-type: web-api-overview
browser-compat: api.Navigator.sendBeacon
---

{{DefaultAPISidebar("Beacon")}}

**Beacon** API được dùng để gửi một yêu cầu bất đồng bộ và không chặn tới máy chủ web. Yêu cầu này không mong đợi phản hồi. Không giống các yêu cầu được thực hiện bằng {{domxref("XMLHttpRequest")}} hoặc [Fetch API](/en-US/docs/Web/API/Fetch_API), trình duyệt bảo đảm sẽ khởi tạo các yêu cầu beacon trước khi trang được dỡ tải và thực thi chúng cho đến khi hoàn tất.

Trường hợp sử dụng chính của Beacon API là gửi dữ liệu phân tích như các sự kiện phía máy khách hoặc dữ liệu phiên lên máy chủ. Trước đây, các trang web thường dùng {{domxref("XMLHttpRequest")}} cho mục đích này, nhưng trong một số tình huống trình duyệt không bảo đảm sẽ gửi các yêu cầu bất đồng bộ đó (ví dụ, khi trang sắp bị dỡ tải). Để khắc phục, các trang web đã phải dùng nhiều kỹ thuật khác nhau, chẳng hạn biến yêu cầu thành đồng bộ, nhưng điều này ảnh hưởng xấu đến khả năng đáp ứng. Vì các yêu cầu beacon vừa bất đồng bộ vừa được bảo đảm gửi đi, chúng kết hợp được hiệu năng tốt với độ tin cậy cao.

Để biết thêm chi tiết về động cơ ra đời và cách dùng API này, hãy xem tài liệu cho phương thức {{domxref("navigator.sendBeacon()")}}.

> [!NOTE]
> API này _không dùng được_ trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API) (không được cung cấp qua {{domxref("WorkerNavigator")}}).

## Giao diện

API này chỉ định nghĩa một phương thức duy nhất: {{domxref("navigator.sendBeacon()")}}.

Phương thức này nhận hai đối số là URL và dữ liệu cần gửi trong yêu cầu. Đối số dữ liệu là tùy chọn và có thể có kiểu là chuỗi, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, {{domxref("ReadableStream")}}, {{domxref("Blob")}}, đối tượng {{domxref("FormData")}}, hoặc đối tượng {{domxref("URLSearchParams")}}. Nếu trình duyệt đưa yêu cầu vào hàng đợi để gửi thành công thì phương thức trả về `true`; nếu không, nó trả về `false`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chuẩn Beacon](https://w3c.github.io/beacon/)
- [Dữ liệu Beacon trên CanIUse](https://caniuse.com/#search=beacon)
- [Chặn các beacon thông qua service worker](https://ehsanakhgari.org/blog/2015-04-08/intercepting-beacons-through-service-workers/); Ehsan Akhgari; 2015-Apr-08
- <https://webkit.org/blog/8821/link-click-analytics-and-privacy/>
- [Beaconing in Practice](https://calendar.perfplanet.com/2020/beaconing-in-practice/)
