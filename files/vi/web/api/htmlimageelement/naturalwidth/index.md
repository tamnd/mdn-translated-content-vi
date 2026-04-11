---
title: "HTMLImageElement: naturalWidth property"
short-title: naturalWidth
slug: Web/API/HTMLImageElement/naturalWidth
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.naturalWidth
---

{{APIRef("HTML DOM")}}

Thuộc tính **`naturalWidth`** chỉ đọc của giao diện {{domxref("HTMLImageElement")}} trả về chiều rộng nội tại (tự nhiên), được điều chỉnh theo mật độ của hình ảnh trong {{Glossary("CSS pixel", "CSS pixels")}}.

Đây là chiều rộng của hình ảnh nếu được vẽ mà không có gì hạn chế chiều rộng của nó; nếu bạn không chỉ định chiều rộng cho hình ảnh cũng như không đặt hình ảnh bên trong vùng chứa giới hạn hoặc chỉ định rõ ràng chiều rộng hình ảnh thì hình ảnh sẽ được hiển thị rộng như thế này.

> [!NOTE]
> Hầu hết chiều rộng tự nhiên là chiều rộng thực tế của hình ảnh được máy chủ gửi. Tuy nhiên, trình duyệt có thể sửa đổi hình ảnh trước khi đẩy nó vào trình kết xuất. Ví dụ: Chrome [làm giảm độ phân giải của hình ảnh trên các thiết bị cấp thấp](https://crbug.com/1187043#c7). Trong những trường hợp như vậy, `naturalWidth` sẽ coi chiều rộng của hình ảnh được sửa đổi bởi sự can thiệp của trình duyệt như chiều rộng tự nhiên và trả về giá trị này.

## Giá trị

Một giá trị số nguyên biểu thị chiều rộng nội tại của hình ảnh, tính bằng pixel CSS. Đây là chiều rộng mà hình ảnh được vẽ một cách tự nhiên khi không có ràng buộc hoặc giá trị cụ thể nào được thiết lập cho hình ảnh. Chiều rộng tự nhiên này được điều chỉnh theo mật độ điểm ảnh của thiết bị mà nó được hiển thị, không giống như {{domxref("HTMLImageElement.width", "width")}}.

Nếu chiều rộng nội tại không có sẵn—do hình ảnh không chỉ định chiều rộng nội tại hoặc do dữ liệu hình ảnh không có sẵn để lấy thông tin này, `naturalWidth` trả về 0.

## Ví dụ

Xem [`HTMLImageElement.naturalHeight`](/en-US/docs/Web/API/HTMLImageElement/naturalHeight#examples) để biết mã hiển thị hình ảnh ở cả kích thước "được điều chỉnh theo mật độ" tự nhiên và kích thước được hiển thị khi được thay đổi bởi CSS của trang và các yếu tố khác.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.width")}}
- {{domxref("HTMLImageElement.naturalHeight")}}
