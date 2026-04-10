---
title: "XMLHttpRequest: thuộc tính withCredentials"
short-title: withCredentials
slug: Web/API/XMLHttpRequest/withCredentials
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.withCredentials
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính **`XMLHttpRequest.withCredentials`** là một giá trị boolean cho biết liệu các yêu cầu `Access-Control` xuyên miền có nên được thực hiện bằng cách sử dụng thông tin xác thực như cookie, tiêu đề xác thực hoặc chứng chỉ client TLS hay không. Việc đặt `withCredentials` không có tác dụng đối với các yêu cầu cùng nguồn gốc.

Ngoài ra, cờ này cũng được sử dụng để cho biết khi nào cookie bị bỏ qua trong phản hồi. Giá trị mặc định là `false`. Các phản hồi `XMLHttpRequest` từ một miền khác không thể đặt giá trị cookie cho miền của chúng trừ khi `withCredentials` được đặt thành `true` trước khi thực hiện yêu cầu. Các [third-party cookies](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) thu được bằng cách đặt `withCredentials` thành `true` vẫn sẽ tuân thủ chính sách cùng nguồn gốc và do đó không thể được truy cập bởi script yêu cầu thông qua [document.cookie](/en-US/docs/Web/API/Document/cookie) hoặc từ các tiêu đề phản hồi.

> [!NOTE]
> Điều này không bao giờ ảnh hưởng đến các yêu cầu cùng nguồn gốc.

> [!NOTE]
> Các phản hồi `XMLHttpRequest` từ một miền khác _không thể_ đặt giá trị cookie cho miền của chúng trừ khi `withCredentials` được đặt thành `true` trước khi thực hiện yêu cầu, bất kể giá trị tiêu đề `Access-Control-` là gì.

## Giá trị

Một boolean.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "http://example.com/", true);
xhr.withCredentials = true;
xhr.send(null);
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
