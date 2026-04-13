---
title: "CSPViolationReport: statusCode property"
short-title: statusCode
slug: Web/API/CSPViolationReport/statusCode
page-type: web-api-instance-property
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Thuộc tính **`statusCode`** của từ điển {{domxref("CSPViolationReport")}} là một số đại diện cho [mã trạng thái HTTP](/en-US/docs/Web/HTTP/Reference/Status) của phản hồi cho yêu cầu đã kích hoạt vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) (khi tải một cửa sổ hoặc worker).

## Giá trị

Một số đại diện cho mã trạng thái HTTP của phản hồi cho yêu cầu đã kích hoạt vi phạm CSP.

## Ví dụ

Trong ví dụ này, chúng ta tạo một {{domxref("ReportingObserver")}} mới để quan sát các báo cáo vi phạm nội dung thuộc loại `"csp-violation"`. Mỗi lần hàm callback được gọi, chúng ta ghi ra mã trạng thái cho mục đầu tiên trong mảng báo cáo.

```js
const observer = new ReportingObserver(
  (reports, observer) => {
    console.log(`statusCode: ${reports[0].body.statusCode}`);
    // Ví dụ: 200
  },
  {
    types: ["csp-violation"],
    buffered: true,
  },
);

observer.observe();
```

Lưu ý rằng mặc dù có thể có nhiều báo cáo trong mảng trả về, để ngắn gọn chúng ta chỉ ghi mã trạng thái của báo cáo đầu tiên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SecurityPolicyViolationEvent.statusCode")}}
