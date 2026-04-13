---
title: "HTMLMediaElement: thuộc tính crossOrigin"
short-title: crossOrigin
slug: Web/API/HTMLMediaElement/crossOrigin
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.crossOrigin
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.crossOrigin`** là cài đặt CORS cho thành phần phương tiện này. Xem [CORS settings attributes](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết chi tiết.

## Giá trị

Một chuỗi từ khóa chỉ định chế độ CORS sẽ sử dụng khi tìm nạp tài nguyên. Các giá trị có thể là:

- `anonymous` hoặc chuỗi trống (`""`)
- : Các yêu cầu được gửi bởi {{domxref("HTMLMediaElement")}} sẽ sử dụng chế độ `cors` {{domxref("Request.mode", "mode", "", "nocode")}} và `same-origin` {{domxref("Request.credentials", "credentials", "", "nocode")}}. Điều này có nghĩa là CORS được bật và thông tin xác thực được gửi _if_ tài nguyên được tìm nạp từ cùng một nguồn mà tài liệu được tải.
- `use-credentials`
- : Các yêu cầu được gửi bởi {{domxref("HTMLMediaElement")}} sẽ sử dụng chế độ `cors` {{domxref("Request.mode", "mode", "", "nocode")}} và `include` {{domxref("Request.credentials", "credentials", "", "nocode")}}. Tất cả các yêu cầu tài nguyên của phần tử sẽ sử dụng CORS, bất kể tìm nạp từ miền nào.

Nếu thuộc tính `crossOrigin` được chỉ định bằng bất kỳ giá trị nào khác thì nó cũng giống như chỉ định như `anonymous`.

Nếu thuộc tính `crossOrigin` không được chỉ định, tài nguyên sẽ được tìm nạp mà không có CORS (chế độ `no-cors` {{domxref("Request.mode", "mode", "", "nocode")}} và `same-origin` {{domxref("Request.credentials", "credentials", "", "nocode")}}).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.crossOrigin")}}
- {{domxref("HTMLLinkElement.crossOrigin")}}
- {{domxref("HTMLScriptElement.crossOrigin")}}
