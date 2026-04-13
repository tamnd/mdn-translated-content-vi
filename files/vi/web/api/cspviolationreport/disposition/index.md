---
title: "CSPViolationReport: disposition property"
short-title: disposition
slug: Web/API/CSPViolationReport/disposition
page-type: web-api-instance-property
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Thuộc tính **`disposition`** của từ điển {{domxref("CSPViolationReport")}} cho biết liệu user agent được cấu hình để thực thi các vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) hay chỉ báo cáo chúng.

## Giá trị

Các giá trị có thể có:

- `"enforce"`
  - : Chính sách được thực thi và yêu cầu tài nguyên bị chặn. Được dùng cho các vi phạm của chính sách được đặt bằng {{httpheader("Content-Security-Policy")}}.
- `"report"`
  - : Vi phạm được báo cáo nhưng yêu cầu tài nguyên không bị chặn. Được dùng cho các vi phạm của chính sách được đặt bằng {{httpheader("Content-Security-Policy-Report-Only")}}.

## Ví dụ

### Vi phạm CSP script nội tuyến hiển thị disposition

Ví dụ này kích hoạt vi phạm CSP bằng một script nội tuyến và báo cáo vi phạm bằng {{domxref("ReportingObserver")}}. `disposition` được ghi lại.

#### HTML

Tệp HTML bên dưới sử dụng phần tử [`<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta) để đặt `default-src` của {{httpheader('Content-Security-Policy')}} thành `self`, cho phép tải script và các tài nguyên khác từ cùng miền, nhưng không cho phép thực thi script nội tuyến. Tài liệu cũng bao gồm một script nội tuyến, sẽ kích hoạt vi phạm CSP.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src 'self'; report-to csp-endpoint" />
    <meta
      http-equiv="Reporting-Endpoints"
      content="csp-endpoint='https://example.com/csp-reports'" />
    <script src="main.js"></script>
    <title>CSP: Violation due to inline script</title>
  </head>
  <body>
    <h1>CSP: Violation due to inline script</h1>
    <script>
      const int = 4;
    </script>
  </body>
</html>
```

#### JavaScript (main.js)

Tài liệu trên cũng tải script bên ngoài `main.js`, được hiển thị bên dưới. Vì được tải từ cùng miền với HTML, nó không bị chặn bởi CSP.

Script tạo một {{domxref("ReportingObserver")}} mới để quan sát các báo cáo vi phạm nội dung thuộc loại `"csp-violation"`. Mỗi lần hàm callback được gọi, chúng ta lấy nội dung của mục đầu tiên trong mảng báo cáo và sử dụng nó để ghi ra tệp, dòng và cột của vi phạm vào console.

```js
// main.js
const observer = new ReportingObserver(
  (reports, observer) => {
    const cspViolationBody = reports[0].body;
    console.log(`disposition: ${cspViolationBody.disposition}`);
    // Ví dụ: "enforce"
  },
  {
    types: ["csp-violation"],
    buffered: true,
  },
);

observer.observe();
```

Lưu ý rằng mặc dù có thể có nhiều báo cáo trong mảng trả về, để ngắn gọn chúng ta chỉ ghi các giá trị của phần tử đầu tiên.

#### Kết quả

Nếu phục vụ mã trên, đầu ra log sẽ là:

```plain
disposition: enforce
```

> [!NOTE]
> Nếu `Content-Security-Policy-Reporting-Only` được bật, disposition sẽ là `report`. Tuy nhiên, lưu ý rằng `Content-Security-Policy-Reporting-Only` phải được phục vụ qua header: nó không thể được đặt trong phần tử `<meta>` như chúng ta đã làm ở trên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SecurityPolicyViolationEvent.disposition")}}
