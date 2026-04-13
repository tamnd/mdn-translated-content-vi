---
title: ReportingObserver
slug: Web/API/ReportingObserver
page-type: web-api-interface
browser-compat: api.ReportingObserver
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Giao diện `ReportingObserver` của [Reporting API](/en-US/docs/Web/API/Reporting_API) cho phép bạn thu thập và truy cập các báo cáo.

## Hàm khởi tạo

- {{domxref("ReportingObserver.ReportingObserver", "ReportingObserver()")}}
  - : Tạo một phiên bản đối tượng `ReportingObserver` mới, có thể được sử dụng để thu thập và truy cập các báo cáo.

## Thuộc tính phiên bản

_Giao diện này không có thuộc tính nào được định nghĩa trên nó._

## Phương thức phiên bản

- {{domxref("ReportingObserver.disconnect()")}}
  - : Dừng một reporting observer đã từng bắt đầu quan sát khỏi việc thu thập báo cáo.
- {{domxref("ReportingObserver.observe()")}}
  - : Hướng dẫn một reporting observer bắt đầu thu thập báo cáo trong hàng đợi báo cáo của nó.
- {{domxref("ReportingObserver.takeRecords()")}}
  - : Trả về danh sách báo cáo hiện tại chứa trong hàng đợi báo cáo của observer, và làm rỗng hàng đợi.

## Sự kiện

_Giao diện này không có sự kiện nào được kích hoạt trên nó._

## Ví dụ

### Hiển thị báo cáo lỗi thời

Ví dụ này cho thấy cách quan sát các báo cáo `"deprecation"` bằng `ReportingObserver`.

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 200px;
  margin: 10px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Đầu tiên, chúng ta xây dựng một đối tượng {{domxref("ReportingObserver")}} mới để lắng nghe các báo cáo với kiểu `"deprecation"`, truyền một callback sẽ nhận và ghi lại các báo cáo.

```js
const options = {
  types: ["deprecation"],
  buffered: true,
};

const observer = new ReportingObserver((reports, observer) => {
  reports.forEach((report) => {
    // console.log(report);
    log(JSON.stringify(report, null, 2));
  });
}, options);

// Bắt đầu observer
observer.observe();
```

Sau đó chúng ta gọi đoạn mã sau sử dụng XHR đồng bộ (API đã lỗi thời). Lưu ý rằng điều này được định nghĩa sau observer và nó kích hoạt một lần observer đang chạy.

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "/", false); // false = đồng bộ (đã lỗi thời)
xhr.send();
```

#### Kết quả

Trên các trình duyệt hỗ trợ báo cáo lỗi thời, một báo cáo sẽ được hiển thị bên dưới. Lưu ý rằng `type` là `"deprecation"`.

{{EmbedLiveSample("Using the `ReportingObserver` interface", "100%", "280px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
