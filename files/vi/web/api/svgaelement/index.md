---
title: SVGAElement
slug: Web/API/SVGAElement
page-type: web-api-interface
browser-compat: api.SVGAElement
---

{{APIRef("SVG")}}

Giao diện **`SVGAElement`** cung cấp quyền truy cập vào các thuộc tính của phần tử {{SVGElement("a")}}, cũng như các phương thức để thao tác với chúng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGAElement.download")}}
  - : Một chuỗi cho biết rằng tài nguyên được liên kết dự định được tải xuống thay vì hiển thị trong trình duyệt.
- {{domxref("SVGAElement.hash")}}
  - : Một chuỗi biểu thị mã định danh mảnh, bao gồm dấu thăng (`#`) đứng đầu nếu có, trong URL được tham chiếu.
- {{domxref("SVGAElement.host")}}
  - : Một chuỗi biểu thị tên máy chủ và cổng (nếu không phải cổng mặc định) trong URL được tham chiếu.
- {{domxref("SVGAElement.hostname")}}
  - : Một chuỗi biểu thị tên máy chủ trong URL được tham chiếu.
- {{domxref("SVGAElement.href")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}}.
- {{domxref("SVGAElement.hreflang")}}
  - : Một chuỗi cho biết ngôn ngữ của tài nguyên được liên kết.
- {{domxref("SVGAElement.interestForElement")}} {{experimental_inline}} {{non-standard_inline}}
  - : Lấy hoặc đặt phần tử đích của một [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers#creating_an_interest_invoker), trong trường hợp phần tử {{svgelement("a")}} liên kết được chỉ định là một interest invoker.
- {{domxref("SVGAElement.origin")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa nguồn gốc của URL, tức là, giao thức, tên miền và cổng của nó.
- {{domxref("SVGAElement.pathname")}}
  - : Một chuỗi chứa `/` ban đầu theo sau là đường dẫn URL, không bao gồm chuỗi truy vấn hoặc mảnh.
- {{domxref("SVGAElement.password")}}
  - : Một chuỗi chứa mật khẩu được chỉ định trước tên miền.
- {{domxref("SVGAElement.ping")}}
  - : Một chuỗi phản ánh thuộc tính `ping`, chứa danh sách URL phân cách bằng dấu cách mà khi theo liên kết, trình duyệt sẽ gửi các yêu cầu {{HTTPMethod("POST")}} với nội dung `PING` (trong nền). Thường được dùng để theo dõi.
- {{domxref("SVGAElement.port")}}
  - : Một chuỗi biểu thị thành phần cổng, nếu có, của URL được tham chiếu.
- {{domxref("SVGAElement.protocol")}}
  - : Một chuỗi biểu thị thành phần giao thức, bao gồm dấu hai chấm (`:`) ở cuối, của URL được tham chiếu.
- {{domxref("SVGAElement.referrerPolicy")}}
  - : Một chuỗi chỉ định [referrer](/en-US/docs/Web/HTTP/Reference/Headers/Referer) nào sẽ gửi khi tải [URL](/en-US/docs/Glossary/URL).
- {{domxref("SVGAElement.rel")}}
  - : Một chuỗi phản ánh thuộc tính SVG `rel`, chỉ định mối quan hệ của đích liên kết.
- {{domxref("SVGAElement.relList")}}
  - : Một {{domxref("DOMTokenList")}} phản ánh thuộc tính SVG `rel`, dưới dạng danh sách token.
- {{domxref("SVGAElement.search")}}
  - : Một chuỗi biểu thị chuỗi truy vấn của URL, nếu có, bao gồm dấu hỏi (`?`) đứng đầu.
- {{domxref("SVGAElement.target")}} {{ReadOnlyInline}}
  - : Tương ứng với thuộc tính {{SVGAttr("target")}} của phần tử đã cho.
- {{domxref("SVGAElement.text")}} {{deprecated_inline}}
  - : Một chuỗi là từ đồng nghĩa của thuộc tính {{domxref("Node.textContent")}}.
- {{domxref("SVGAElement.type")}}
  - : Một chuỗi phản ánh thuộc tính `type`, cho biết kiểu MIME của tài nguyên được liên kết.
- {{domxref("SVGAElement.username")}}
  - : Một chuỗi chứa tên người dùng được chỉ định trước tên miền.

## Phương thức phiên bản

_Giao diện này không có phương thức riêng nhưng kế thừa các phương thức từ cha của nó, {{domxref("SVGGraphicsElement")}}._

## Ví dụ

Trong ví dụ bên dưới, thuộc tính {{SVGAttr("target")}} của phần tử {{SVGElement("a")}} được đặt thành `_blank` và khi nhấp vào liên kết, nó sẽ ghi nhật ký để thông báo xem điều kiện có được đáp ứng hay không.

```js
const linkRef = document.querySelector("a");
linkRef.target = "_self";

linkRef.onclick = () => {
  if (linkRef.target === "_blank") {
    console.log("BLANK!");
    linkRef.target = "_self";
  } else {
    console.log("SORRY! not _blank");
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử SVG {{SVGElement("a")}}
