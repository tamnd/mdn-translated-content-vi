---
title: "PerformanceNavigationTiming: criticalCHRestart property"
short-title: criticalCHRestart
slug: Web/API/PerformanceNavigationTiming/criticalCHRestart
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceNavigationTiming.criticalCHRestart
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Một website có thể chỉ ra rằng một [Client Hint](/en-US/docs/Web/HTTP/Guides/Client_hints) cụ thể là quan trọng đối với trang bằng cách đưa nó vào tiêu đề phản hồi HTTP {{HTTPHeader("Critical-CH")}} (cùng với tiêu đề yêu cầu HTTP {{HTTPHeader("Accept-CH")}}, vốn cần cho mọi client hint dù là quan trọng hay không). Việc này sẽ kích hoạt khởi động lại kết nối nếu client hint được liệt kê trong tiêu đề phản hồi HTTP `Critical-CH` lẽ ra có thể đã, nhưng thực tế chưa, được đưa vào yêu cầu HTTP ban đầu. Nếu trình duyệt không hỗ trợ client hint đó, nó sẽ bị bỏ qua và không có khởi động lại kết nối nào xảy ra.

Thuộc tính chỉ đọc **`criticalCHRestart`** biểu thị thời điểm việc khởi động lại kết nối xảy ra.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị số mili giây đã trôi qua kể từ {{domxref("PerformanceEntry.startTime")}} khi việc khởi động lại kết nối xảy ra.

Nếu giá trị là `0`, kết nối đã không được khởi động lại.

## Ví dụ

### Phát hiện trang có khởi động lại kết nối

Đoạn JavaScript sau có thể được dùng để xem kết nối có bị khởi động lại hay không:

```js
const restartTime =
  performance?.getEntriesByType?.("navigation")[0]?.criticalCHRestart;
if (restartTime > 0) {
  console.log("Time at which connection restart happened:", restartTime);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- {{HTTPHeader("Accept-CH")}}
- {{HTTPHeader("Critical-CH")}}
