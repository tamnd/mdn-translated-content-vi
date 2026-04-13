---
title: DeprecationReport
slug: Web/API/DeprecationReport
page-type: web-api-interface
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.deprecation
---

{{APIRef("Reporting API")}}

Dictionary `DeprecationReport` của [Reporting API](/en-US/docs/Web/API/Reporting_API) đại diện cho báo cáo ngừng sử dụng.

Báo cáo ngừng sử dụng có thể được tạo khi một tính năng đã lỗi thời (ví dụ: phương thức API đã lỗi thời) được sử dụng trên một tài liệu. Lưu ý rằng việc nhận báo cáo ngừng sử dụng hữu ích phụ thuộc vào nhà cung cấp trình duyệt thêm các cảnh báo này cho các tính năng đã lỗi thời.

Các báo cáo loại này có thể được quan sát từ trong trang bằng cách sử dụng {{domxref("ReportingObserver")}}, và phiên bản được tuần tự hóa có thể được gửi đến [endpoint báo cáo](/en-US/docs/Web/API/Reporting_API#reporting_server_endpoints) mặc định.

## Thuộc tính phiên bản

- `body`
  - : Phần thân của báo cáo. Đây là đối tượng với các thuộc tính sau:
    - `id` {{experimental_inline}}: Chuỗi đại diện cho tính năng hoặc API đã lỗi thời, ví dụ `NavigatorGetUserMedia`.
    - `anticipatedRemoval` {{Experimental_Inline}}: Đối tượng {{jsxref("Date")}} đại diện cho ngày mà tính năng dự kiến bị xóa khỏi trình duyệt hiện tại. Nếu ngày không được biết, thuộc tính này sẽ trả về `null`.
    - `message` {{experimental_inline}}: Chuỗi chứa mô tả có thể đọc được của việc ngừng sử dụng.
    - `sourceFile` {{experimental_inline}}: Chuỗi chứa đường dẫn đến tệp nguồn nơi tính năng đã lỗi thời được sử dụng, nếu biết, hoặc `null`.
    - `lineNumber` {{experimental_inline}}: Số đại diện cho dòng trong tệp nguồn nơi tính năng đã lỗi thời được sử dụng, nếu biết, hoặc `null`.
    - `columnNumber` {{experimental_inline}}: Số đại diện cho vị trí ký tự trong dòng của tệp nguồn nơi tính năng đã lỗi thời được sử dụng lần đầu, nếu biết, hoặc `null`.
- `type`
  - : Chuỗi `"deprecation"` cho biết đây là báo cáo ngừng sử dụng.
- `url`
  - : Chuỗi đại diện cho URL của tài liệu tạo ra báo cáo.

## Mô tả

Báo cáo ngừng sử dụng có thể được tạo khi một tính năng đã lỗi thời được sử dụng trên tài liệu.

Bạn có thể giám sát báo cáo ngừng sử dụng trong trang bằng cách sử dụng [Reporting API](/en-US/docs/Web/API/Reporting_API). Để làm điều này, hãy tạo đối tượng {{domxref("ReportingObserver")}} để lắng nghe báo cáo, truyền hàm callback và tùy chọn thuộc tính `options` chỉ định các loại báo cáo. Hàm callback sau đó được gọi với các báo cáo của các loại được yêu cầu, truyền đối tượng báo cáo. Đối với báo cáo ngừng sử dụng, đối tượng sẽ là instance `DeprecationReport` (có thuộc tính [`type`](#type) được đặt thành `"deprecation"`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
