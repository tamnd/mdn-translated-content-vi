---
title: "CSPViolationReport: sample property"
short-title: sample
slug: Web/API/CSPViolationReport/sample
page-type: web-api-instance-property
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Thuộc tính **`sample`** của từ điển {{domxref("CSPViolationReport")}} là một chuỗi chứa một phần của tài nguyên vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).

Mẫu này thường là 40 ký tự đầu tiên của script nội tuyến, trình xử lý sự kiện hoặc kiểu vi phạm hạn chế CSP. Nếu không được điền, giá trị là chuỗi rỗng `""`.

Lưu ý rằng giá trị này chỉ được điền khi cố gắng tải các script _nội tuyến_, trình xử lý sự kiện hoặc kiểu vi phạm các quy tắc CSP [`script-src*`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) và [`style-src*`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/style-src) — các tài nguyên bên ngoài vi phạm CSP sẽ không tạo ra mẫu. Ngoài ra, mẫu chỉ được bao gồm nếu chỉ thị `Content-Security-Policy` bị vi phạm cũng chứa từ khóa [`'report-sample'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#report-sample).

> [!NOTE]
> Các báo cáo vi phạm nên được coi là dữ liệu do kẻ tấn công kiểm soát. Nội dung của trường này _đặc biệt_ nên được làm sạch trước khi lưu trữ hoặc hiển thị.

## Giá trị

Một chuỗi chứa mẫu của tài nguyên nội tuyến vi phạm CSP, thường là 40 ký tự đầu tiên, hoặc chuỗi rỗng.

## Ví dụ

### Vi phạm CSP script nội tuyến

Ví dụ này kích hoạt vi phạm CSP bằng một script nội tuyến và báo cáo vi phạm bằng {{domxref("ReportingObserver")}}. Chúng ta cũng thêm `'report-sample'` vào CSP để điền một `sample` trong nội dung.

#### HTML

Tệp HTML bên dưới sử dụng phần tử [`<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta) để đặt `script-src-elem` của {{httpheader('Content-Security-Policy')}} thành `self`, cho phép tải script từ cùng miền, nhưng không cho phép thực thi script nội tuyến. Chúng ta bao gồm `'report-sample'` trong chỉ thị để tạo ra một mẫu. Tài liệu cũng bao gồm một script nội tuyến, sẽ kích hoạt vi phạm CSP.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="script-src-elem 'self' 'report-sample'" />
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

Script tạo một {{domxref("ReportingObserver")}} mới để quan sát các báo cáo vi phạm nội dung thuộc loại `"csp-violation"`. Mỗi lần hàm callback được gọi, chúng ta lấy nội dung của mục đầu tiên trong mảng báo cáo và sử dụng nó để ghi ra `sample` của vi phạm vào console.

```js
// main.js
const observer = new ReportingObserver(
  (reports, observer) => {
    console.log(`sample: ${reports[0].body.sample}`);
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

Đầu ra console của mã trên là:

```plain
sample: const int = 4;
```

Trong trường hợp này, mẫu chứa toàn bộ nội dung của script nội tuyến.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SecurityPolicyViolationEvent.sample")}}
