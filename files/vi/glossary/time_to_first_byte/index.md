---
title: Time to First Byte (TTFB)
slug: Glossary/Time_to_first_byte
page-type: glossary-definition
sidebar: glossarysidebar
---

**Time to First Byte** (**TTFB**) đề cập đến khoảng thời gian giữa lúc trình duyệt yêu cầu một trang và khi nó nhận được byte thông tin đầu tiên từ máy chủ. Khoảng thời gian này bao gồm tra cứu {{Glossary("DNS")}} và thiết lập kết nối sử dụng bắt tay {{Glossary("TCP")}} và bắt tay {{Glossary("TLS")}} nếu yêu cầu được thực hiện qua {{Glossary("HTTPS")}}.

TTFB là thời gian tính từ khi bắt đầu yêu cầu đến khi bắt đầu nhận phản hồi, tính bằng mili giây. Có thể đo lường điều này bằng thuộc tính {{domxref("PerformanceResourceTiming.responseStart", "responseStart")}} của {{domxref("PerformanceNavigationTiming")}}:

```js
const ttfb = performance.getEntriesByType("navigation")[0].responseStart;
```

> [!NOTE]
> Đối với các trang sử dụng {{HTTPStatus("103", "103 Early Hints")}}, TTFB thường là _các byte đầu tiên_ (sau bất kỳ chuyển hướng nào) — do đó, là phản hồi tạm thời 103. Chủ sở hữu trang muốn đo thời gian cho đến phản hồi cuối cùng nên sử dụng {{domxref("PerformanceResourceTiming.finalResponseHeadersStart", "finalResponseHeadersStart")}}, nếu được hỗ trợ.

## Xem thêm

- [Một phiên HTTP điển hình](/en-US/docs/Web/HTTP/Guides/Session)
- [PerformanceResourceTiming](/en-US/docs/Web/API/PerformanceResourceTiming)
- [PerformanceNavigationTiming](/en-US/docs/Web/API/PerformanceNavigationTiming)
