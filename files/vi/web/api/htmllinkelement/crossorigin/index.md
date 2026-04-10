---
title: "HTMLLinkElement: thuộc tính crossOrigin"
short-title: crossOrigin
slug: Web/API/HTMLLinkElement/crossOrigin
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.crossOrigin
---

{{APIRef("HTML DOM")}}

Thuộc tính **`crossOrigin`** của giao diện {{domxref("HTMLLinkElement")}} chỉ định thiết lập Cross-Origin Resource Sharing ({{Glossary("CORS")}}) sẽ sử dụng khi truy xuất tài nguyên.

## Giá trị

Một chuỗi chứa từ khóa chỉ định chế độ CORS sẽ sử dụng khi tải tài nguyên. Các giá trị có thể là:

- `anonymous` hoặc chuỗi rỗng (`""`)
  - : Các yêu cầu được gửi bởi {{domxref("HTMLLinkElement")}} sẽ sử dụng {{domxref("Request.mode", "mode", "", "nocode")}} `cors` và {{domxref("Request.credentials", "credentials", "", "nocode")}} `same-origin`. Điều này có nghĩa là CORS được bật và thông tin xác thực được gửi _nếu_ tài nguyên được tải từ cùng nguồn gốc với tài liệu đã tải.
- `use-credentials`
  - : Các yêu cầu được gửi bởi {{domxref("HTMLLinkElement")}} sẽ sử dụng {{domxref("Request.mode", "mode", "", "nocode")}} `cors` và {{domxref("Request.credentials", "credentials", "", "nocode")}} `include`. Tất cả yêu cầu tài nguyên bởi phần tử sẽ sử dụng CORS, bất kể tên miền nào được tải.

Nếu thuộc tính `crossOrigin` được chỉ định với bất kỳ giá trị nào khác, nó tương đương với việc chỉ định `anonymous`.

Nếu thuộc tính `crossOrigin` không được chỉ định, tài nguyên sẽ được tải mà không có CORS ({{domxref("Request.mode", "mode", "", "nocode")}} `no-cors` và {{domxref("Request.credentials", "credentials", "", "nocode")}} `same-origin`).

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.crossOrigin")}}
- {{domxref("HTMLMediaElement.crossOrigin")}}
- {{domxref("HTMLScriptElement.crossOrigin")}}
