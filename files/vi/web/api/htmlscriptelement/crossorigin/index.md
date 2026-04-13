---
title: "HTMLScriptElement: thuộc tính crossOrigin"
short-title: crossOrigin
slug: Web/API/HTMLScriptElement/crossOrigin
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.crossOrigin
---

{{APIRef("HTML DOM")}}

Thuộc tính **`crossOrigin`** của giao diện {{domxref("HTMLScriptElement")}} phản ánh cài đặt {{Glossary("CORS", "Cross-Origin Resource Sharing")}} cho phần tử tập lệnh. Với classic scripts từ các [origin](/en-US/docs/Glossary/Origin) khác, thuộc tính này điều khiển liệu thông tin lỗi đầy đủ có được hiển thị hay không. Với module scripts, nó điều khiển bản thân tập lệnh và bất kỳ tập lệnh nào mà nó nhập. Xem [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết thêm chi tiết.

## Giá trị

Một chuỗi từ khóa chỉ định chế độ CORS khi tìm nạp tài nguyên. Các giá trị có thể là:

- `anonymous` hoặc chuỗi rỗng (`""`)
  - : Các yêu cầu được gửi bởi {{domxref("HTMLScriptElement")}} sẽ sử dụng chế độ `cors` {{domxref("Request.mode", "mode", "", "nocode")}} và chế độ thông tin xác thực `same-origin` {{domxref("Request.credentials", "credentials", "", "nocode")}}. Điều này có nghĩa là CORS được bật và thông tin xác thực được gửi _nếu_ tài nguyên được tìm nạp từ cùng origin với tài liệu được tải.
- `use-credentials`
  - : Các yêu cầu được gửi bởi {{domxref("HTMLScriptElement")}} sẽ sử dụng chế độ `cors` {{domxref("Request.mode", "mode", "", "nocode")}} và chế độ thông tin xác thực `include` {{domxref("Request.credentials", "credentials", "", "nocode")}}. Tất cả các yêu cầu tài nguyên của phần tử sẽ sử dụng CORS, bất kể domain nào đang được tìm nạp.

Nếu thuộc tính `crossOrigin` được chỉ định với bất kỳ giá trị nào khác, nó giống như chỉ định là `anonymous`.

Nếu thuộc tính `crossOrigin` không được chỉ định, tài nguyên được tìm nạp mà không có CORS (chế độ `no-cors` {{domxref("Request.mode", "mode", "", "nocode")}} và chế độ thông tin xác thực `same-origin` {{domxref("Request.credentials", "credentials", "", "nocode")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.crossOrigin")}}
- {{domxref("HTMLLinkElement.crossOrigin")}}
- {{domxref("HTMLMediaElement.crossOrigin")}}
