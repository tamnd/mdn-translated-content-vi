---
title: "HTMLScriptElement: thuộc tính text"
short-title: text
slug: Web/API/HTMLScriptElement/text
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.text
---

{{APIRef("HTML DOM")}}

> [!WARNING]
> Thuộc tính này biểu diễn nội dung văn bản của phần tử tập lệnh, có thể được thực thi tùy theo loại tập lệnh.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector dẫn đến tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Các cân nhắc về bảo mật](#security_considerations) để biết thêm thông tin.

Thuộc tính **`text`** của giao diện {{domxref("HTMLScriptElement")}} biểu diễn nội dung văn bản nội tuyến của phần tử {{HTMLElement("script")}}.
Nó hoạt động giống như các thuộc tính {{domxref("HTMLScriptElement.textContent","textContent")}} và {{domxref("HTMLScriptElement.innerText","innerText")}}.

## Giá trị

Lấy thuộc tính trả về một chuỗi chứa văn bản của tập lệnh.

Đặt thuộc tính chấp nhận một đối tượng {{domxref("TrustedScript")}} hoặc một chuỗi.

### Ngoại lệ

- `TypeError`
  - : Ném ra nếu thuộc tính được đặt thành một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được xác định.

## Mô tả

Thuộc tính **`text`** của giao diện {{domxref("HTMLScriptElement")}} biểu diễn nội dung văn bản bên trong phần tử {{HTMLElement("script")}}.

Với tập lệnh có thể thực thi (tức là tập lệnh mà {{domxref('HTMLScriptElement/type','type')}} chỉ ra rằng nó là module hoặc classic script), văn bản này là mã có thể thực thi nội tuyến.
Với các loại khác, nó có thể biểu diễn một import map, speculation rules, hoặc một loại khối dữ liệu nào đó.

Lưu ý rằng nếu thuộc tính {{domxref('HTMLScriptElement/src','src')}} được đặt thì nội dung của thuộc tính `text` sẽ bị bỏ qua.

### Các cân nhắc về bảo mật

Xem [các cân nhắc về bảo mật](/en-US/docs/Web/API/HTMLScriptElement/textContent#security_considerations) trong {{domxref("HTMLScriptElement.textContent")}} (các cân nhắc đều giống nhau cho các thuộc tính `text`, `textContent` và `innerText`).

## Ví dụ

Xem [ví dụ](/en-US/docs/Web/API/HTMLScriptElement/textContent#examples) trong {{domxref("HTMLScriptElement.textContent")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.textContent")}}
- {{domxref("HTMLScriptElement.innerText")}}
