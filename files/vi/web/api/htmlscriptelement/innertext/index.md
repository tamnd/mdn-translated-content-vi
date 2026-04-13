---
title: "HTMLScriptElement: thuộc tính innerText"
short-title: innerText
slug: Web/API/HTMLScriptElement/innerText
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.innerText
---

{{APIRef("HTML DOM")}}

> [!WARNING]
> Thuộc tính này biểu diễn nội dung văn bản của phần tử tập lệnh, có thể được thực thi tùy theo loại tập lệnh.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector dẫn đến tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Các cân nhắc về bảo mật](#security_considerations) để biết thêm thông tin.

Thuộc tính **`innerText`** của giao diện {{domxref("HTMLScriptElement")}} biểu diễn nội dung văn bản của phần tử {{HTMLElement("script")}}.
Nó hoạt động giống như các thuộc tính {{domxref("HTMLScriptElement.textContent","textContent")}} và {{domxref("HTMLScriptElement.text","text")}}.

## Giá trị

Lấy thuộc tính trả về một chuỗi chứa văn bản của tập lệnh.

Đặt thuộc tính chấp nhận một đối tượng {{domxref("TrustedScript")}} hoặc một chuỗi.

### Ngoại lệ

- `TypeError`
  - : Ném ra nếu thuộc tính được đặt thành một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được xác định.

## Mô tả

Thuộc tính **`innerText`** của giao diện {{domxref("HTMLScriptElement")}} biểu diễn nội dung văn bản bên trong phần tử {{HTMLElement("script")}}.

Với tập lệnh có thể thực thi (tức là tập lệnh mà {{domxref('HTMLScriptElement/type','type')}} chỉ ra rằng nó là module hoặc classic script), văn bản này là mã có thể thực thi nội tuyến.
Với các loại khác, nó có thể biểu diễn một import map, speculation rules, hoặc một loại khối dữ liệu nào đó.

Lưu ý rằng nếu thuộc tính {{domxref('HTMLScriptElement/src','src')}} được đặt thì nội dung của thuộc tính `innerText` sẽ bị bỏ qua.

Thuộc tính `innerText` cũng được định nghĩa trên {{domxref("HTMLElement.innerText","HTMLElement")}} và do đó có thể được sử dụng với các phần tử khác.
Khi được sử dụng với các phần tử khác, thuộc tính không yêu cầu hay thực thi việc gán {{domxref("TrustedScript")}}.

### Các cân nhắc về bảo mật

Xem [các cân nhắc về bảo mật](/en-US/docs/Web/API/HTMLScriptElement/textContent#security_considerations) trong {{domxref("HTMLScriptElement.textContent")}} (các cân nhắc đều giống nhau cho các thuộc tính `text`, `textContent` và `innerText`).

## Ví dụ

Xem [ví dụ](/en-US/docs/Web/API/HTMLScriptElement/textContent#examples) trong {{domxref("HTMLScriptElement.textContent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.innerText")}}
