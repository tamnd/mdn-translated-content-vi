---
title: PerformanceResourceTiming
slug: Web/API/PerformanceResourceTiming
page-type: web-api-interface
browser-compat: api.PerformanceResourceTiming
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Giao diện **`PerformanceResourceTiming`** cho phép truy xuất và phân tích dữ liệu timing mạng chi tiết liên quan đến việc tải các tài nguyên của một ứng dụng. Ứng dụng có thể dùng các chỉ số timing để xác định, ví dụ, khoảng thời gian cần để tìm nạp một tài nguyên cụ thể, chẳng hạn như một {{domxref("XMLHttpRequest")}}, {{SVGElement("SVG","SVG element")}}, hình ảnh hoặc script.

{{InheritanceDiagram}}

## Mô tả

Các thuộc tính của giao diện này tạo ra một timeline tải tài nguyên với các dấu thời gian độ phân giải cao cho các sự kiện mạng như thời điểm bắt đầu và kết thúc chuyển hướng, fetch start, thời điểm bắt đầu và kết thúc tra cứu DNS, thời điểm bắt đầu và kết thúc phản hồi, v.v. Ngoài ra, giao diện còn mở rộng {{domxref("PerformanceEntry")}} với các thuộc tính khác cung cấp dữ liệu về kích thước của tài nguyên đã tìm nạp cũng như loại tài nguyên đã khởi tạo việc tìm nạp.

### Các chỉ số resource timing điển hình

Các thuộc tính của giao diện này cho phép bạn tính một số chỉ số resource timing. Các trường hợp sử dụng phổ biến gồm:

- Đo thời gian bắt tay TCP (`connectEnd` - `connectStart`)
- Đo thời gian tra cứu DNS (`domainLookupEnd` - `domainLookupStart`)
- Đo thời gian chuyển hướng (`redirectEnd` - `redirectStart`)
- Đo thời gian yêu cầu tạm thời (`firstInterimResponseStart` - `finalResponseHeadersStart`)
- Đo thời gian yêu cầu (`responseStart` - `requestStart`)
- Đo thời gian yêu cầu tài liệu (`finalResponseHeadersStart` - `requestStart`)
- Đo thời gian thương lượng TLS (`requestStart` - `secureConnectionStart`)
- Đo thời gian tìm nạp (không có chuyển hướng) (`responseEnd` - `fetchStart`)
- Đo thời gian xử lý của ServiceWorker (`fetchStart` - `workerStart`)
- Kiểm tra xem nội dung có được nén hay không (`decodedBodySize` không nên khác `encodedBodySize`)
- Kiểm tra xem có trúng bộ đệm cục bộ hay không (`transferSize` nên bằng `0`)
- Kiểm tra xem có dùng giao thức hiện đại và nhanh hay không (`nextHopProtocol` nên là HTTP/2 hoặc HTTP/3)
- Kiểm tra xem tài nguyên có đúng là render-blocking hay không (`renderBlockingStatus`)

### Quản lý kích thước bộ đệm resource

Mặc định chỉ có 250 resource timing entry được đưa vào bộ đệm. Để biết thêm thông tin, xem [kích thước bộ đệm resource](/en-US/docs/Web/API/Performance_API/Resource_timing#managing_resource_buffer_sizes) của hướng dẫn Resource Timing.

### Thông tin timing liên miền

Nhiều thuộc tính resource timing bị giới hạn chỉ trả về `0` hoặc một chuỗi rỗng khi tài nguyên là một yêu cầu cross-origin. Để hiển thị thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Các thuộc tính mặc định trả về `0` khi tải tài nguyên từ một origin khác với origin của chính trang web: `redirectStart`, `redirectEnd`, `domainLookupStart`, `domainLookupEnd`, `connectStart`, `connectEnd`, `secureConnectionStart`, `requestStart`, và `responseStart`.

Ví dụ, để cho phép `https://developer.mozilla.org` xem thông tin timing tài nguyên, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thuộc tính thể hiện

### Kế thừa từ `PerformanceEntry`

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau cho các loại resource performance entry bằng cách ràng buộc và giới hạn chúng như sau:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp","timestamp")}} là hiệu số giữa các thuộc tính {{domxref("PerformanceResourceTiming.responseEnd","responseEnd")}} và {{domxref("PerformanceEntry.startTime","startTime")}}.
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}}
  - : Trả về `"resource"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}}
  - : Trả về URL của tài nguyên.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}}
  - : Trả về dấu thời gian {{domxref("DOMHighResTimeStamp","timestamp")}} tại thời điểm tài nguyên bắt đầu được tìm nạp. Giá trị này tương đương với {{domxref("PerformanceResourceTiming.fetchStart")}}.

### Các dấu thời gian

Giao diện hỗ trợ các thuộc tính dấu thời gian sau mà bạn có thể thấy trong sơ đồ và được liệt kê theo thứ tự chúng được ghi lại cho việc tìm nạp một tài nguyên. Danh sách theo bảng chữ cái được hiển thị trong thanh điều hướng bên trái.

![Timestamp diagram listing timestamps in the order in which they are recorded for the fetching of a resource](https://mdn.github.io/shared-assets/images/diagrams/api/performance/resource-timing/timestamp-diagram.svg)

- {{domxref('PerformanceResourceTiming.redirectStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm bắt đầu của lần tìm nạp khởi tạo chuyển hướng.
- {{domxref('PerformanceResourceTiming.redirectEnd')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi nhận byte cuối cùng của phản hồi của lần chuyển hướng cuối cùng.
- {{domxref('PerformanceResourceTiming.workerStart')}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} ngay trước khi phát {{domxref("FetchEvent")}} nếu luồng Service Worker đang chạy, hoặc ngay trước khi khởi động luồng Service Worker nếu nó chưa chạy. Nếu tài nguyên không bị Service Worker chặn, thuộc tính này luôn trả về 0.
- {{domxref('PerformanceResourceTiming.fetchStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay trước khi trình duyệt bắt đầu tìm nạp tài nguyên.
- {{domxref('PerformanceResourceTiming.domainLookupStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay trước khi trình duyệt bắt đầu tra cứu tên miền cho tài nguyên.
- {{domxref('PerformanceResourceTiming.domainLookupEnd')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình duyệt hoàn tất tra cứu tên miền cho tài nguyên.
- {{domxref('PerformanceResourceTiming.connectStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay trước khi trình duyệt bắt đầu thiết lập kết nối tới máy chủ để lấy tài nguyên.
- {{domxref('PerformanceResourceTiming.secureConnectionStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay trước khi trình duyệt bắt đầu quá trình bắt tay để bảo mật kết nối hiện tại.
- {{domxref('PerformanceResourceTiming.connectEnd')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi trình duyệt hoàn tất thiết lập kết nối tới máy chủ để lấy tài nguyên.
- {{domxref('PerformanceResourceTiming.requestStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay trước khi trình duyệt bắt đầu yêu cầu tài nguyên từ máy chủ.
- {{domxref('PerformanceResourceTiming.firstInterimResponseStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời gian phản hồi tạm thời (ví dụ 100 Continue hoặc 103 Early Hints).
- {{domxref('PerformanceResourceTiming.responseStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi trình duyệt nhận byte đầu tiên của phản hồi từ máy chủ (có thể là phản hồi tạm thời).
- {{domxref('PerformanceResourceTiming.finalResponseHeadersStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm phản hồi đầu cuối có header bắt đầu (ví dụ 200 Success), sau mọi phản hồi tạm thời.
- {{domxref('PerformanceResourceTiming.responseEnd')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi trình duyệt nhận byte cuối cùng của tài nguyên hoặc ngay trước khi kết nối vận chuyển bị đóng, tùy điều kiện nào đến trước.

### Thông tin tài nguyên bổ sung

Ngoài ra, giao diện này còn hiển thị các thuộc tính sau chứa thêm thông tin về tài nguyên:

- {{domxref("PerformanceResourceTiming.contentType")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi biểu thị phiên bản rút gọn và chuẩn hóa của MIME type của tài nguyên đã tìm nạp.
- {{domxref('PerformanceResourceTiming.decodedBodySize')}} {{ReadOnlyInline}}
  - : Một số là kích thước (tính bằng octet) nhận được từ lần tìm nạp (HTTP hoặc cache) của phần thân thông điệp, sau khi loại bỏ mọi content encoding đã áp dụng.
- {{domxref("PerformanceResourceTiming.deliveryType")}} {{ReadOnlyInline}}
  - : Cho biết tài nguyên được phân phối như thế nào - ví dụ từ cache hoặc từ navigational prefetch.
- {{domxref('PerformanceResourceTiming.encodedBodySize')}} {{ReadOnlyInline}}
  - : Một số biểu thị kích thước (tính bằng octet) nhận được từ lần tìm nạp (HTTP hoặc cache) của phần thân payload, trước khi loại bỏ mọi content encoding đã áp dụng.
- {{domxref('PerformanceResourceTiming.initiatorType')}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị tính năng nền tảng web đã khởi tạo performance entry.
- {{domxref('PerformanceResourceTiming.nextHopProtocol')}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị giao thức mạng được dùng để tìm nạp tài nguyên, được xác định bởi [ALPN Protocol ID (RFC7301)](https://datatracker.ietf.org/doc/html/rfc7301).
- {{domxref('PerformanceResourceTiming.renderBlockingStatus')}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị trạng thái chặn kết xuất. Có thể là `"blocking"` hoặc `"non-blocking"`.
- {{domxref('PerformanceResourceTiming.responseStatus')}} {{ReadOnlyInline}}
  - : Một số biểu thị mã trạng thái phản hồi HTTP được trả về khi tìm nạp tài nguyên.
- {{domxref('PerformanceResourceTiming.transferSize')}} {{ReadOnlyInline}}
  - : Một số biểu thị kích thước (tính bằng octet) của tài nguyên đã tìm nạp. Kích thước này bao gồm các trường header phản hồi cộng với phần thân payload phản hồi.
- {{domxref('PerformanceResourceTiming.serverTiming')}} {{ReadOnlyInline}}
  - : Một mảng các entry {{domxref("PerformanceServerTiming")}} chứa các chỉ số server timing.

## Phương thức thể hiện

- {{domxref("PerformanceResourceTiming.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceResourceTiming`.

## Ví dụ

### Ghi nhật ký thông tin resource timing

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry);
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  console.log(entry);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Resource timing (Overview)](/en-US/docs/Web/API/Performance_API/Resource_timing)
