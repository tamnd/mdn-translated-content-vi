---
title: InterventionReport
slug: Web/API/InterventionReport
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.intervention
---

{{APIRef("Reporting API")}}{{SeeCompatTable}}

Dictionary `InterventionReport` của [Reporting API](/en-US/docs/Web/API/Reporting_API) đại diện cho một báo cáo can thiệp.

Báo cáo can thiệp có thể được tạo ra khi việc sử dụng một tính năng trong tài liệu web đã bị trình duyệt chặn vì lý do bảo mật, hiệu suất hoặc sự phiền toái của người dùng. Báo cáo loại này có thể được quan sát từ trong trang bằng cách sử dụng {{domxref("ReportingObserver")}} và phiên bản tuần tự hóa có thể được gửi đến điểm cuối máy chủ báo cáo.

## Thuộc tính phiên bản

- `body`
  - : Nội dung của báo cáo. Đây là đối tượng với các thuộc tính sau:
    - `columnNumber` {{experimental_inline}}
      - : Một chuỗi đại diện cho vị trí ký tự trong dòng tệp nguồn nơi xảy ra sự can thiệp, nếu biết, hoặc `null`.
    - `id` {{experimental_inline}}
      - : Một chuỗi đại diện cho sự can thiệp đã tạo ra báo cáo.
    - `lineNumber` {{experimental_inline}}
      - : Một chuỗi đại diện cho dòng trong tệp nguồn nơi xảy ra sự can thiệp, nếu biết, hoặc `null`.
    - `message` {{experimental_inline}}
      - : Một chuỗi chứa mô tả có thể đọc được của con người về sự can thiệp, bao gồm thông tin như cách tránh sự can thiệp.
    - `sourceFile` {{experimental_inline}}
      - : Một chuỗi chứa đường dẫn đến tệp nguồn đã sử dụng API được chỉ định đầu tiên (và gây ra sự can thiệp), nếu biết, hoặc `null`.
- `type`
  - : Chuỗi `"intervention"` cho biết đây là báo cáo can thiệp.
- `url`
  - : Một chuỗi đại diện cho URL của tài liệu đã tạo ra báo cáo.

## Ví dụ

### Sử dụng giao diện `ReportingObserver`

Để quan sát các báo cáo can thiệp trong trang, hãy xây dựng đối tượng {{domxref("ReportingObserver")}} mới:

```js
const options = {
  types: ["intervention"],
  buffered: true,
};

const observer = new ReportingObserver((reports, observer) => {
  reports.forEach((report) => {
    console.log(report);
    console.log(JSON.stringify(report));
  });
}, options);

// Start the observer
observer.observe();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReportingObserver")}}
- {{HTTPHeader("Reporting-Endpoints")}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
