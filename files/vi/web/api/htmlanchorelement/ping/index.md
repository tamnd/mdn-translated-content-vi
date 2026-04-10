---
title: "HTMLAnchorElement: thuộc tính ping"
short-title: ping
slug: Web/API/HTMLAnchorElement/ping
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.ping
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`ping`** của giao diện {{domxref("HTMLAnchorElement")}} là một danh sách các URL được phân tách bằng khoảng trắng. Khi liên kết được theo dõi, trình duyệt sẽ gửi các yêu cầu {{HTTPMethod("POST")}} với nội dung PING đến các URL đó.

Nó phản ánh thuộc tính `ping` của phần tử {{HTMLElement("a")}}.

> [!NOTE]
> Thuộc tính này không có hiệu lực trong Firefox và việc sử dụng nó có thể bị hạn chế do các vấn đề về quyền riêng tư và bảo mật.

## Ví dụ

```html
<a
  id="exampleLink"
  href="https://example.com"
  ping="https://example-tracking.com https://example-analytics.com"
  >Ví dụ liên kết</a
>
```

```js
const anchorElement = document.getElementById("exampleLink");
console.log(anchorElement.ping); // Xuất ra: "https://example-tracking.com https://example-analytics.com"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLAreaElement.ping")}}
