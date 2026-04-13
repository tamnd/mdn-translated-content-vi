---
title: "ReportingObserver: ReportingObserver() constructor"
short-title: ReportingObserver()
slug: Web/API/ReportingObserver/ReportingObserver
page-type: web-api-constructor
browser-compat: api.ReportingObserver.ReportingObserver
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`ReportingObserver()`** của [Reporting API](/en-US/docs/Web/API/Reporting_API) tạo một phiên bản đối tượng {{domxref("ReportingObserver")}} mới, có thể được sử dụng để thu thập và truy cập các báo cáo.

## Cú pháp

```js-nolint
new ReportingObserver(callback)
new ReportingObserver(callback, options)
```

### Tham số

- `callback`
  - : Một hàm callback chạy khi observer bắt đầu thu thập báo cáo (tức là, qua {{domxref("ReportingObserver.observe()")}}). Hàm callback được đưa cho hai tham số:
    - `reports`
      - : Một chuỗi các đối tượng đại diện cho các báo cáo được thu thập trong hàng đợi báo cáo của observer.

        Các đối tượng báo cáo được kỳ vọng có các thuộc tính sau:
        - `body`
          - : Một đối tượng đại diện cho nội dung của báo cáo. Cấu trúc của báo cáo (đặc biệt là nội dung của nó), phụ thuộc vào [`type`](#type) của nó.
        - `type`
          - : Một chuỗi cho biết loại báo cáo. Để biết thông tin về các loại báo cáo xem [`options.types`](#types) bên dưới.
        - `url`
          - : Một chuỗi đại diện cho URL của tài liệu tạo ra báo cáo.

    - `observer`
      - : Một tham chiếu đến cùng một đối tượng `ReportingObserver`, cho phép thu thập báo cáo đệ quy, v.v.

- `options` {{optional_inline}}
  - : Một đối tượng cho phép bạn đặt các tùy chọn để tạo đối tượng. Các tùy chọn có sẵn là:
    - `types`
      - : Một mảng chuỗi đại diện cho các loại báo cáo cần được thu thập bởi observer này. Các loại có sẵn bao gồm:
        - `coep`
          - : Vi phạm {{httpheader("Cross-Origin-Embedder-Policy")}} (COEP) của trang. Báo cáo là các phiên bản {{domxref("COEPViolationReport")}}.
        - `crash`
          - : Báo cáo sự cố trình duyệt. (Báo cáo sự cố không thể truy xuất qua `ReportingObserver` nhưng có thể được gửi đến máy chủ).
        - `csp-violation`
          - : Vi phạm chính sách CSP của trang. Báo cáo là các phiên bản {{domxref("CSPViolationReport")}}.
        - `deprecation`
          - : Các tính năng đã lỗi thời được trang sử dụng. Báo cáo là các phiên bản {{domxref("DeprecationReport")}}.
        - `integrity-violation`
          - : Vi phạm chính sách tính toàn vẹn của trang. Báo cáo là các phiên bản {{domxref("IntegrityViolationReport")}}.
        - `intervention`
          - : Các tính năng bị chặn bởi user agent, ví dụ: nếu một quảng cáo ảnh hưởng đáng kể đến hiệu suất trang. Báo cáo là các phiên bản {{domxref("InterventionReport")}}.

        Nếu tùy chọn này bị bỏ qua, tất cả các loại được hỗ trợ sẽ được thu thập.

    - `buffered`
      - : Một giá trị boolean xác định xem các báo cáo được tạo ra trước khi observer có thể được tạo có thể quan sát được (`true`) hay không (`false`).

## Ví dụ

### Hiển thị các loại báo cáo cụ thể

Mã này cho thấy cách tạo `ReportingObserver` có thể được sử dụng để quan sát các báo cáo [`deprecation`](#deprecation) và [`integrity-violation`](#integrity-violation).

```js
const options = {
  types: ["deprecation", "integrity-violation"],
  buffered: true,
};

const observer = new ReportingObserver((reports, observer) => {
  reportBtn.onclick = () => displayReports(reports);
}, options);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
