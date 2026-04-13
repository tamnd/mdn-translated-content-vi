---
title: "SVGAnimatedString: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedString/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedString.baseVal
---

{{APIRef("SVG")}}

> [!WARNING]
> Thuộc tính `baseVal` có thể được dùng để đặt giá trị không hoạt hình của một thuộc tính được phản chiếu.
> Trong trường hợp {{domxref("SVGScriptElement/href","SVGScriptElement.href.baseVal")}}, thuộc tính này đại diện cho URL của một script bên ngoài được tải vào phần tử script SVG.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage) và có thể là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) giới hạn các vị trí mà script có thể được tải, và bằng cách luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi, và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Lưu ý bảo mật](/en-US/docs/Web/API/SVGScriptElement/href#security_considerations) trong {{domxref("SVGScriptElement.href")}} để biết thêm thông tin.

Thuộc tính **`baseVal`** của giao diện {{domxref("SVGAnimatedString")}} lấy hoặc đặt giá trị cơ sở của thuộc tính đã cho.

Đây là giá trị của thuộc tính được phản chiếu trước khi áp dụng bất kỳ hoạt hình nào.

## Giá trị

Khi lấy thuộc tính, nó trả về một chuỗi đại diện cho giá trị không hoạt hình của thuộc tính được phản chiếu, nếu nó đã được đặt.
Nếu thuộc tính được phản chiếu không được chỉ định nhưng có phiên bản thay thế đã lỗi thời đã được đặt, thì giá trị của nó sẽ được trả về thay thế.
Nếu cả hai thuộc tính được phản chiếu đều không được đặt, thuộc tính sẽ trả về giá trị ban đầu cho thuộc tính được phản chiếu nếu có, nếu không thì trả về chuỗi rỗng (`""`).

Thuộc tính phải được đặt thành {{domxref("TrustedScriptURL")}} nếu phần tử của thuộc tính được phản chiếu là {{domxref("SVGScriptElement")}} và [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [enforced bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
Trong tất cả các trường hợp khác, giá trị có thể là chuỗi (hoặc đối tượng có thể phân giải thành chuỗi).
Thuộc tính đặt giá trị của thuộc tính được phản chiếu nếu nó được định nghĩa, nhưng sẽ đặt phiên bản thay thế đã lỗi thời của thuộc tính được phản chiếu nếu nó được định nghĩa và thuộc tính được phản chiếu không.

Lưu ý rằng {{domxref("TrustedScriptURL")}} hoặc bất kỳ kiểu đáng tin cậy nào khác có thể được đặt cho `baseVal` trên bất kỳ phần tử nào, vì các kiểu đáng tin cậy phân giải thành chuỗi.
Tuy nhiên, {{domxref("TrustedScriptURL")}} _bắt buộc phải_ được sử dụng cho {{domxref("SVGScriptElement/href","SVGScriptElement.href.baseVal")}} khi trusted types được thực thi.

## Ngoại lệ

- `TypeError`
  - : Được ném ra nếu phần tử của thuộc tính được phản chiếu là {{domxref("SVGScriptElement")}}, và thuộc tính được đặt thành chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [enforced bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types), và không có chính sách mặc định nào được định nghĩa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
